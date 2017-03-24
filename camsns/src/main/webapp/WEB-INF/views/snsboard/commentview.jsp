<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
	<c:forEach items="${clist}" var="cdto" varStatus="status">
	{
		"userEmailIdFk":"${cdto.userEmailIdFk}",
		"snscommentFilename":"${cdto.snscommentFilename}",
		"snscommentContent":"${cdto.snscommentContent}",
		"snscommentRegdate":"${cdto.snscommentRegdate}"
	}
	<c:if test="${status.count<clist.size()}">,</c:if>
	</c:forEach>
]