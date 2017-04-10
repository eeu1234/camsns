<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script>

var naver_id_login = new naver_id_login("RnwpsHXunrglCkR5f5HG", "http://211.63.89.34:8090/camsns/maindata.action");

//alert(naver_id_login.oauthParams.access_token);

naver_id_login.get_naver_userprofile("naverSignInCallback()");
var email;

function naverSignInCallback() {

		email = naver_id_login.getProfileData('email');		
		//email +=1;
	
		insertLogin();
  
}
function insertLogin(){
	$.ajax({
		type:"GET",
		data:"userEmailId="+email,
		url:"/camsns/checkId.action",
		success:function(result){
			//location.href="/camsns/selectuniversity.action"
			//window.close();
			//alert('${userEmailId}');
			//alert('${check}');
			
			//최초로그인
			location.reload();
			<c:choose>
				<c:when test="${check==1}">
					opener.document.location.reload();
					window.close();
					
				</c:when>
				<c:when test="${check==0}">
					
					location.href="/camsns/camsns/selectUniversity.action";
				</c:when>
				
			</c:choose>
			
			
			
		},
		 error:function(request,status,error){
		        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		
		}
		
	});
}

</script>


</body>
</html>