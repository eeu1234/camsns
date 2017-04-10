<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<script>
	var isCheckId = false;
	var isCheckPw = false;
	
	$().ready(function(){

		//아이디 유효성 체크
		$("#universityName").change(function(){
			
			var universityName = $("#universityName").val();
			//입력된 아이디 길이가 0 이면 사용 불가
			if(universityName.length != 0){
				
				$.ajax({
					type: "GET",
					url: "/spring/admin/university/universityNameCheck.action",
					data: "universityName="+universityName,
					success:function(date){
						if(date==1){
							$("#checkID").text("사용 불가능한 학교명 입니다.").css("color","red");
							isCheckId = false;
						}else{
							$("#checkID").text("사용 가능한 학교명 입니다.").css("color","blue");
							isCheckId = true;
						}
					},
					
					error:function(data){
						alert(data)
					}
					
				});//아이디유효성 ajax
				
			}else{
				$("#checkID").text("");
			}//if
				
		});//adminId change 함수

				
	});//ready

	
	
</script>
<style>


#content{
	position:relative;
	width:100%;
	max-width: 600px;
	margin:0 auto;
	text-align:center;
	margin-top:10%;
}
#tbl1 {
	width: 100%;
	margin: 30px auto;
}

#tbl1 th, #tbl1 td {
	text-align: center;
}

#tbl1 th {
	width: 50%;
}

#tbl1 td {
	width: 50%;
}

#submitBtn{
	width:100%;
	text-align:center;
}
</style>
</head>
<body>
	<%@include file="/inc/top.jsp"%>

	<!-- content 몸통부분 -->
	<div id="content">
		<form id="universityAdd" action="/spring/admin/university/universityAddOk.action" method="POST">
			<h1>대학 추가</h1>
			<table id="tbl1" class="table-striped">
				<tr>
					<th>대학명 입력</th>
					<td>
						<input type="text" name="universityName" id="universityName" placeholder="대학교 이름을 입력해주세요" class="form-control">
						<span id="checkID"></span>
					</td>
				</tr>
				
			
			</table>
					<div id="submitBtn">
						<input type="button" value="되돌아가기" onclick="history.back();" class="btn btn-default"/>
						<input type="submit" value="학교추가하기" class="btn btn-primary"	 />
					</div>
		</form>
	</div><!-- content -->
	
</body>
</html>