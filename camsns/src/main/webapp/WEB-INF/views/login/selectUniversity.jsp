<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<style>
	#uniTab{
		width:100%;
	}

</style>

<script>
var universitySeq;
$(document).ready(function(){
	$("#select1").change(function(){
		//alert(universitySeq);
		universitySeq = $(this).val();
		
		location.href="/camsns/main.action?universitySeq="+universitySeq;
	})//end onchange
	
	
	
	$("#searchBox").keyup(function(){
		var word = $(this).val()
		$.ajax({
			type:"GET",
			dataType:"json",
			data:"word="+word,
			url:"/camsns/searchUniversity.action",
			success:function(result){
				var universityName;
				var universitySeq;
				var row;
				if(result.length==0){
					row="";
				}else{
					$.each(result,function(index,dto){
						
							universityName = dto.universityName;
							universitySeq = dto.universitySeq;
							//row +="<tr><td><div value='"+universitySeq+"' style='cursor:pointer;' class='form-control' onclick='insert();'>"+universityName+"</div></td></tr>";	
							row +="<tr><td><div id = 'university"+universitySeq+"'value='"+universitySeq+"' style='cursor:pointer;' class='form-control' onclick='insert();'>"+universityName+"</div></td></tr>";
					})//end each
					
				}//end if
				$("#uniTab tBody").html(row);
			}//end success
		})//end ajax
	})//end key up
	

});//end document.ready

function insert(){
	
	universitySeq = $(event.srcElement).attr("value");
	location.href="/camsns/main.action?universitySeq="+universitySeq;
}
	
		
	

</script>
</head>
<body>
	
	<div id="subMenu">
		<select id ="select1" class="form-control">
			<option value="-1">학교선택</option>
			<c:forEach items="${uniList}" var="dto">
				<option value="${dto.universitySeq}">${dto.universityName}</option>
			</c:forEach>
		</select>
		<input type="text" id="searchBox" class="form-control" placeholder="검색">
		<table id = "uniTab">
			<tbody>
				
			</tbody>
		</table>
	</div>
	
</body>
</html>