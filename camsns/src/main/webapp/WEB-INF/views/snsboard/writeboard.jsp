<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 각종 임포트 -->
<%@include file="/inc/asset.jsp"%>

<title>Sns</title>


<style>
body {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height: 100%;
	max-width: 600px;
}

#container {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height: 100%;
}

table tr td:nth-child(1) {
	text-align: center;
	vertical-align: middle;
}

.filebox {
	position: relative;
	width: 90%;
	min-height:80px;
	margin: 0 auto;
}

.filebox label {
	width: 100%;
	
	display: inline-block;
	padding: .5em .75em;
	text-align: center;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	margin-top: 10px;
	margin-bottom: 30px;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox.bs3-success label {
	color: #fff;
	background-color: #5cb85c;
	border-color: #4cae4c;
}

#btnGroup {
	position: relative;
	width: 90%;
	margin: 0 auto;
}

#btnGroup input {
	position: relative;
	width: 50%;
}
</style>
<script>
	$(function() {

	})
</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>

	<div id="container">
		<!--제목,컨텐츠,아이디,카테고리  -->
		<form action="/camsns/snsboard/writeBoardOk.action" method="POST">
			<table class="table table-striped">
				
				<tr>
					<td colspan="2">
					
					<select name="categoryVal" id="" class="form-control">
							<option value="">- 카테고리 선택 -</option>
							<c:forEach items="${categoryDtoList}" var="categorydto">
								<option value="${categorydto.categorySeq}">${categorydto.categoryName}</option>
							</c:forEach>
					</select>
					<br>
					</td>
				</tr>

				<tr>
					<td><input type="text" name="subject" class="form-control" placeholder="제목"/></td>

				</tr>

				<tr>
					<td colspan="2"><textarea rows="5" cols="30" name="content" 
							class="form-control" /></textarea></td>

				</tr>


			</table>



			<div class="filebox bs3-success">
				<label for="ex_file2">사진 업로드</label> <input type="file" id="ex_file2" name="imgFile">
			</div>
			<hr />
			<div id="btnGroup">
				<input type="button" value="취소" class="btn btn-danger" onclick="history.back();" /> <input type="submit" value="확인" class="btn btn-primary"	style="float: right;" />
				
			</div>
			<input type="hidden" name="userId" value="" />
		</form>
		<!-- 		
<tr class="active">...</tr>
<tr class="success">...</tr>
<tr class="warning">...</tr>
<tr class="danger">...</tr>
<tr class="info">...</tr> -->




	</div>


</body>
</html>
<%-- 
<tr>
					<td>카테고리</td>
					<td><select name="" id="" class="form-control">
							<option value="">- 카테고리 선택 -</option>
							<c:forEach items="${categoryDtoList}" var="categorydto">
								<option value="${categorydto.categorySeq}">${categorydto.categoryName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" class="form-control" /></td>

				</tr>

				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="30" name="content"
							class="form-control" /></textarea></td>

				</tr>

 --%>