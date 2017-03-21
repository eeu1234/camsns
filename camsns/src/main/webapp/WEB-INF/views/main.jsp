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
	 overflow: auto; 
	 -webkit-overflow-scrolling: touch;
}

#subMenu {
	width: 90%;
	height: 50px;
	margin: 0 auto;
}

#newBoardBtn {
	width: 20%;
}

#searchBox {
	float: right;
	width: 50%;
	text-align: right;
}

#container {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height: 100%;
}

.adminArea {
	position: relative;
	color: white;
	width: 90%;
	height: 100px;
	margin: 0 auto;
	border: 5px solid #F06161;
	border-radius: 10px 10px 0 0;
	color: white;
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

.permission {
	float: left;
	width: 20%;
}

.chkView {
	float: left;
	width: 80%;
	text-align: right;
}

.blind {
	position: absolute;
	bottom: 0;
	right: 0;
	width: 100%;
	text-align: right;
	width: 100%;
}

#contentArea {
	position: relative;
	width: 90%;
	height: auto;
	min-height: 300px;
	margin: 0 auto;
	margin-bottom: 10px;
	background-color: white;
}
.area{
	background-color: #D5D5D5;
	position: relative;
	margin-bottom:20px;
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
	height: auto;
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
	height: auto;
	min-height: 60px;
	font-size: 0.8em;
}

.showComment {
	position: relative;
	width: 100%;
	margin-top: 5px;
	padding: 5px;
	border: 0px;
	text-align: right;
	color: #888;
	padding: 5px;
}

.showComment:hover {
	position: relative;
	width: 100%;
	margin-top: 5px;
	padding: 5px;
	border: 0px;
	text-align: right;
	text-decoration: underline;
	color: #888;
	padding: 5px;
}

.addComment {
	width: 100%;
	height: 30px;
}

.commentText {
	float: left;
	width: 88%;
	height: 30px;
}


.commentList {
	position: relative;
	width: 100%;
	height: 30px;
	font-size: 0.9em;
	margin-top: 20px;
	padding-left: 10px;
	color: black;
}

.picUpBtn {
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

.picUpBtn label {
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

.picUpBtn input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
<script>
	var index = 0;
	var windowWidth =0;
	var windowHeight =0;
	var cntList = 0;
	var flag = false;
	$(function() {
			
		
		cntList = "${cntList}";
		
		
		
		$(".commentList").hide();

		$("#showBtn1").click(function() {
			$(".commentList").show();
		});

		function chkVal(event) {
			console.log(event);
		}

		$(".chkBox").change(function() {
			$('#chk').prop('checked', true);

		})

		/* 카카오톡 글 url 보내기 */
		$(".shareBtn")
				.click(
						function() {
							var url = "http://localhost:8090";
							
							var boardSeq = $(this).val();
							var shareUrl = "/camsns/snsboard/snsboardview.action?boardSeq="
									+ boardSeq;
							
							console.log(url+shareUrl);
						})

						//1289/1303/1343/1369/1358/1366
						 var i=0;
						
		$(window).scroll(
				
		
				
				function() {
					if ($(window).scrollTop() == ($(document).height() - $(window).height()) && flag == true) {
						$("#loading").hide();
						alert("마지막 글입니다.");
						return;
					}

				
					if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {
						
						
						if(flag == false){
					
							
						index +=5;
						//console.log(index);						
						
							$.ajax({
								type : "GET",
								url : "/camsns/main.action",
								dataType: "json",
								data : "num=" + index,
								
								success: function(result){
									
									if (result.length != 0) {
										$.each(result, function(intValue, currentElement) {
											
												//	console.log(key);
												//console.log(value);
												//categoryType,boardSeq,boardCotent,boardRegdate,boardSubject
												//console.log(currentElement.boardCategoryName);
												//console.log(currentElement.boardCategoryName);
												var html ="";
												
												
												html += '<div class="area">';
												html += '<div class="contentHeader '+currentElement.category+'">';
												html += '<div class="contentNum">#'+currentElement.boardSeq+'</div>';
												html += '<div class="title">'+currentElement.boardSubject+'</div>';
												html += '<div class="shareArea">';
												html += '<button value="'+currentElement.boardSeq+'"';
												html += 'class="shareBtn glyphicon glyphicon-share-alt '+currentElement.category+' ">';
												html += '</button>';
												html += '</div>';
												html += '<div class="clear"></div>';
												html += '</div>';
												html += '<div class="content">';
												html += '<div class="contentRegdate">'+currentElement.boardRegdate+' </div>';
												html += '<div class="contentPic">';
												html += '	<!-- <img src="./images/ad1.JPG" /> -->';
												html += '												</div>';
												html += currentElement.boardContent;
												html += '</div>';
												html += '<div class="comment">';
												html += '<div class="addComment">';
												html += '<input type="text" class="commentText form-control" />';
												html += '<!-- <button class="glyphicon glyphicon-camera picUpBtn"></button> -->';
												html += '<div class="picUpBtn">';
												html += '<label for="ex_file" class="glyphicon glyphicon-camera">';
												html += '</label> <input type="file" id="ex_file">';
												html += '</div>';
												html += '</div>';
												html += '<button class="showComment" id="showBtn1">댓글 28개</button>';
												html += '</div>';
												html += '</div>';
												html += '</div>';
												
						
												$("#contentArea").append(html);
											//	console.log($(document).height()); //동적으로 변경된다.
											
												 
											
											

										});
										
									}//if(result!=0)
										
										
										//다음 루프때  alert 띄움
										if((cntList - index ) <= 0){
											flag = true;
											
											
										}
									
								},//sucess
							    error: function(xhr, textStatus, error) {
								        alert('Error' + error);
							    }
							
								
							});//ajax
							
						}
					
					
						
					};
			
					
				});//scroll

	})//onload
</script>
</head>
<body>
	<%@include file="/inc/top.jsp"%>


	<div id="subMenu">
		<a href="/camsns/snsboard/writeBoard.action" id="newBoardBtn"
			class="btn btn-primary">글쓰기</a> <input type="text" id="searchBox"
			class="form-control" placeholder="검색">
	</div>
	<div id="container">
		<!-- 공지사항 -->






		<!-- 본문 글 쿼리 -->
		<div id="contentArea">
		<c:forEach items="${boardDtoList}" var="boardDtoList">
			<div class="area">

				<!-- 머리부분 -->
				<div class="contentHeader ${boardDtoList.categoryType} }">
					<div class="contentNum">#${boardDtoList.snsboardSeq}</div>
					<div class="title">${boardDtoList.snsboardSubject}</div>

					<div class="shareArea">
						<button value="${boardDtoList.snsboardSeq}"
							class="shareBtn glyphicon glyphicon-share-alt ${boardDtoList.categoryType}">

						</button>
					</div>

					<div class="clear"></div>
				</div>


				<div class="content">
					<div class="contentRegdate">${boardDtoList.snsboardRegdate}</div>
					<div class="contentPic">
						<!-- <img src="./images/ad1.JPG" /> -->
						<!-- 이미지있으면 띄우기 -->
					</div>

					${boardDtoList.snsboardContent}

				</div>

				<div class="comment">
					<div class="addComment">
						<input type="text" class="commentText form-control" />
						<!-- <button class="glyphicon glyphicon-camera picUpBtn"></button> -->

						<div class="picUpBtn">
							<label for="ex_file" class="glyphicon glyphicon-camera">
							</label> <input type="file" id="ex_file">
						</div>

					</div>
					

					<button class="showComment" id="showBtn1">댓글 28개</button>
				</div>

		</div>
		</c:forEach>
		</div>
	</div>
	<div id="loading" style="background-color:white;width:100%;height:50px;text-align:center;">
		<img src="./images/loading.gif" style="width:10%;height:auto;" />
	</div>


</body>
</html>