<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
	<c:forEach items="${uniList}" var="dto" varStatus="status">
	{
		"universitySeq":"${dto.universitySeq}",
		"universityName":"${dto.universityName}"
		
	}
	
	<c:if test="${status.count < uniList.size()}">,</c:if>
	
	</c:forEach>
	


]
