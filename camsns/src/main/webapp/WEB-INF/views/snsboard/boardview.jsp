<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 각종 임포트 -->
<%@include file="/inc/asset.jsp"%>
<!-- <link rel="stylesheet" type="text/css" href="./css/boardview.css" />
<script type="text/javascript" src="./js/boardview.js"></script> -->
<title>Sns</title>



<style>

html,body {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height:100%;
	max-width: 600px;
}

#subMenu {
	width: 90%;
	height: 50px;
	margin: 0 auto;
}



#container {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height: 100%;
}



.backBlue {
	background-color: #337AB7;
	border-color: #337AB7;
}

.backRed {
	background-color: #D9534F;
	border-color: #D9534F;
}

.backYellow {
	background-color: #F0AD4E;
	border-color: #F0AD4E;
}

.backGreen {
	background-color: #5CB85C;
	border-color: #5CB85C;
}

.backSkyBlue {
	background-color: #5BC0DE;
	border-color: #5BC0DE;
}





.contentArea {
	position: relative;
	width: 90%;
	height:auto;
	background-color: #D5D5D5;
	margin: 0 auto;
}

.contentHeader {
	position: relative;
	width: 100%;
	height: 35px;
	color: white;
	border-radius: 4px;
}

.contentNum {
	float: left;
	position: relative;
	width: 20%;
	height: 35px;
	text-align: center;
	padding-top: 8px;
	margin: 0;
}

.title {
	float: left;
	position: relative;
	width: 67%;
	height: 35px;
	padding-top: 8px;
	margin: 0;
	font-weight: bold;
}

.shareArea {
	float: left;
	position: relative;
	width: 13%;
	height: 35px;
}

.shareBtn {
	width: 90%;
	height: 90%;
	color: white;
	border: 0px;
}

.content {
	position: relative;
	width: 100%;
	height: 20%;
	min-height: 200px;
	background-color: white;
	padding: 8px;
	box-shadow: 0px 7px 10px 0 silver inset;
}

.contentPic {
	position: relative;
	margin: 10px auto;
	width: 50%;
	height: auto;
}

.contentRegdate {
	position: relative;
	margin: 0px auto;
	width: 100%;
	height: auto;
	text-align: right;
	font-size: 0.7em;
	color: #888;
}

.comment {
	position: relative;
	padding: 7px;
	width: 100%;
	height: 5%;
	min-height: 60px;
	font-size: 0.8em;
	border-bottom:2px solid  #bfbfbf;
}



.addComment {
	width: 100%;
	height: 30px;
	margin-bottom:10px;
}

.commentText {
	float: left;
	width: 88%;
	height: 30px;
}


#picUpBtn {
	position: relative;
	float: left;
	width: 10%;
	height: 30px;
	color: gray;
	margin-left: 5px;
}

.clear {
	both: clear;
}

img {
	width: 100%;
	height: auto;
}

#picUpBtn label {
	width: 100%;
	height: 100%;
	display: inline-block;
	color: #999;
	text-align: center;
	padding-top: 0.1em;
	font-size: 1.5em;
	line-height: normal;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

#picUpBtn input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}




/* 코멘트 */

.commentArea{
	position:relative;
	width: 100%;
	height: 100;
	max-width: 600px;
	margin-bottom:8%;
	 
}


.commInfo{
	position:relative;
	float:left;
	width:100%;
	height:30%;
	font-size:0.7em;
	
	
}
.userEmail{
	float:left;
	width:50%;
	height:100%;
	background-color: #dadada;
	padding-top:2%;
	padding-left:2%;
	color: #3b5998;
	
	
	border-left: 2px solid;
    border-radius: 25px 0px 0px 0px;
	
}
.commRegdate{
	float:left;
	width:50%;
	height:100%;
	text-align:right;
	background-color: #dadada;
	padding-top:2%; 
	padding-right:2%;
	color: #bfbfbf;
}

.commContent{
	position:relative;
	float:left;
	width:100%;
	height:100%;
	min-height:100px;
	
	background-color: #f6f7f9;
	margin:0 auto;
	padding-left:2%;
	padding-top:2%;
	border-bottom:2px solid #e5e5e5;
}

.commContent img{
	width:90%;
	height:auto;

}

</style>
<script>
	$(function() {
		
		document.getElementById('picUpBtn').addEventListener("click", function() {
		    document.getElementById('snscommentFilename').click();
		}); 
		
		
	})
	
	function enterComment(seq){
		
		$(this).parent().parent().parent().submit();
	}
</script>
</head>
<body>
	<%@include file="/inc/top.jsp"%>


	<div id="subMenu">
	<!-- 	<a href="javascript:location.href='/camsns/main.action'" id="newBoardBtn" class="glyphicon glyphicon-arrow-left"></a> --> 
		<a href="javascript:history.back()" id="newBoardBtn" class="glyphicon glyphicon-arrow-left"></a> 
	</div>
	<div id="container">
		<!-- 공지사항 -->
		<!-- 본문 글 쿼리 -->


		<div class="contentArea">

			<!-- 머리부분 -->
			<div class="contentHeader ${boardDto.categoryType}">
				<div class="contentNum">#${boardDto.snsboardSeq}</div>
				<div class="title">${boardDto.snsboardSubject}</div>

				<div class="shareArea">
					<button
						class="shareBtn glyphicon glyphicon-share-alt ${boardDto.categoryType}">
						<!-- 이미지넣기 -->
					</button>
				</div>

				<div class="clear"></div>
			</div>


			<div class="content">
				<div class="contentRegdate">${boardDto.snsboardRegdate}</div>
				<div class="contentPic">
					<!-- <img src="./images/ad1.JPG" /> -->
					<!-- 이미지있으면 띄우기 -->
				</div>

				${boardDto.snsboardContent}

			</div>

			<div class="comment">
							<div class="addComment">
							<form  action="/camsns/snsboard/addComment.action" method="POST"  enctype="multipart/form-data">
						
								<input type="hidden" value="${boardDto.snsboardSeq}" name="snsboardSeqFk">
								<input type="text" class="commentText form-control" id="content" name="snscommentContent" onkeydown="javascript: if(event.keyCode==13 ){alert(${boardDto.snsboardSeq}); enterComment(${boardDto.snsboardSeq});} "/>
	
		
								<div id="picUpBtn">
									<label for="ex_file" class="glyphicon glyphicon-camera">
									</label> <input type="file" id="snscommentFilename" name="snscommentFilename">
								</div>
							</form>
						</div>
			
						



	

		</div><!--comment  -->

 				 <c:forEach items="${clist}" var="cdto"> 
	
			<div class="commentArea">
				<div class="commInfo">
					<div class="userEmail">${cdto.userEmailIdFk}</div>
					<div class="commRegdate">${cdto.snscommentRegdate}</div>
					
					<!-- <button class="commDel">X</button> 삭제버튼--> 
					<div style="clear:both;"></div>
				</div>
				<div class="commContent">
				 <c:if test="${cdto.snscommentFilename != null}"> 
					<div style="width:100%;text-align:center;margin-bottom:10spx;">
									<img src="../images/comment/${cdto.snscommentFilename}" />
					</div>
				 </c:if> 
				${cdto.snscommentContent}
				</div>
			</div>
			
		</c:forEach> 

	</div><!-- 컨텐츠아리아 -->



<script type="text/javascript">
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('497e3896cc14549676d2ada05a95e0fd');






  function sendLink(url,name) {
  Kakao.Link.sendTalkLink({
    label: '#'+name+'번째 이야기', // 공유할 메세지의 제목을 설정
			 image: {
    src: 'http://mud-kage.kakao.co.kr/14/dn/btqfJfuXWcY/P7iGH1pyo5w9X1pp8lf9Pk/o.jpg',
    width: '150',
    height: '150'
  } // 이건 썸네일을 설정 하는 겁니다.
			,
  webButton: {
    text: '글 보기',
     url : url // 각각의 포스팅 본문의 링크를 거는 코드입니다. 
  }
  });
}
//]]>
</script>
</div><!-- 컨테이너 -->
</body>
</html>