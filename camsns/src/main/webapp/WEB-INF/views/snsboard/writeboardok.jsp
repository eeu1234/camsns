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


<script>

$(document).ready(function(){

	<c:if test="${result==1}">
	alert("글쓰기 성공!!");
	location.href ="/camsns/main.action";
	</c:if>

	<c:if test="${result==0}">
	alert("글쓰기 실패!!");
	history.back();
	</c:if>
});

</script>

</head>
<body>
</body>
</html>