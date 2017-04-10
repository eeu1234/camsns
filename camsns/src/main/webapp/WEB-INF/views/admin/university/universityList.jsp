<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>

	
	#tbl1 { width: 1440px; margin: 30px auto;}
	#tbl1 th, #tbl1 td { text-align: center; }
	 
	
	#tbl1 th:nth-child(1) { width: 10%;}
	#tbl1 th:nth-child(2) { width: 10%; }
	#tbl1 th:nth-child(3) { width: 10%; } 
	#tbl1 th:nth-child(4) { width: 15%; }
	#tbl1 th:nth-child(5) { width: 15%; }
	#tbl1 th:nth-child(6) { width:20%; }
	
	#tbl2 { width: 500px; margin: 20px auto; }
	#tbl2 td { padding: 0px 2px; }
	#tbl2 td:nth-child(1) { width: 120px; }
	#tbl2 td:nth-child(2) { width: 280px; }
	#tbl2 td:nth-child(3) { width: 100px; }
	
	#searchMsg { text-align: center; }
	
</style>
<script>

	//학교 수정하는 함수
	function universityUpdate(universitySeq){
		location.href="/spring/admin/adminUpdate.action?universitySeq="+universitySeq;
	}

	//학교 추가하는 함수
	function universityAdd(){
		location.href="/spring/admin/university/universityAdd.action"
	}
	
	//로그인 한 level이 999 이면 삭제 함수 생성
	<c:if test="${userLevel == 999}">
	function universityDelete(adminID){
		if(confirm("삭제하시겠습니까?")){
			location.href="/spring/admin/university/univeristyDelete.action?universitySeq="+universitySeq;
		}
	}
	</c:if>

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- content 몸통부분 -->
	<div id="container">
		<h1 class="menuTitle">관리자 관리</h1>
		최고관리자 : 999   // 일반관리자 : 300
		<table id="tbl1" class="table table-striped">
			<tr>
				<th>학교번호</th>
				<th>학교명</th>
			</tr>
			<c:if test="${empty uniList || uniList.size() == 0}">
				<tr>
					<td colspan="2">게시물이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${uniList}" var="unidto">
			<tr>
				<td>${unidto.universitySeq}</td>
				<td>${unidto.univeristyName}</td>
				<td>
					<input type="button" value="수정" onclick="universityUpdate('${unidto.univeristySeq}')" class="btn btn-info"/>
						<input type="button" value="삭제" onclick="universityDelete('${unidto.universitySeq}')" class="btn btn-danger"/>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		<div style="width:100%;text-align:right;">
		<input type="button" value="학교 추가" onclick="universityAdd();" class="btn btn-primary"/>
		</div>
		<div id="pageBar" style="text-align: center;">
			${pageBar}
		</div>
		<div id="search">
			<!-- 자기 자신을 호출 -->
			<form method="GET" action="/spring/admin/university/universityList.action">
				<input type="hidden" name="column" id="column" value="UNIVERSITY_NAME">
				<table id="tbl2">
					<tr>
						<td><input type="text" name="word" id="word" class="form-control" required placeholder="검색어를 입력하세요." value="${sdto.word}"></td>
						<td><input type="submit" value="검색하기" class="btn btn-warning"></td>
					</tr>
				</table>
				
			</form>
		</div>
	</div><!-- content -->
	
	
</body>
</html>