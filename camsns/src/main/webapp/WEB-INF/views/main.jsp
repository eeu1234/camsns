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
	text-align:center;
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
	var index = 0; //글 5개씩 넘기기 위한 변수
	var cntList = "${cntList}";// 총 글 갯수
	var flag = false;//마지막 글 이후 ajax 요청 안하기위한 flag
	var alertFlag =false;//마지막글 alert 창 1번만띄우는 flag
	
	
	$(function() {
		if(cntList ==0){ $("#contentArea").html("글이 존재하지 않습니다.");}
		
		
		/* 검색 */
		$("#searchBox").keydown(function (key) {
			 
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
				//검색 index 초기화
	        	index = 0;
	        	//이전에 감춰뒀던 로딩이미지 보이기
	        	$("#loading").show();
	        	
	        	
		        var word = $(this).val();//검색어 가져옴
		        $("#contentArea").html("");//기존 자료 초기화
		        search(word);//ajax
	        }
	 
	    });


		
		




		/* 카카오톡 글 url 보내기 */
		$(".shareBtn")
				.click(
						function() {
							var name = $(this).attr('name');
							
							var boardSeq = $(this).val();
//							var hostUrl = "http://127.0.0.1:8090";
							var hostUrl = "http://eeu1234.iptime.org:8090";
							var shareUrl = "/camsns/snsboard/snsboardview.action?boardSeq="	+ boardSeq;
							var url = hostUrl +shareUrl
							
							//함수실행
							sendLink(url,name);
							
						})

				
		/* 스크롤시 글 더불러오기 */		
		$(window).scroll(
		
				
				function() {
				
					if ($(window).scrollTop() == ($(document).height() - $(window).height()) && flag == true && alertFlag == false) {
						$("#loading").hide();
						alert("마지막 글입니다.");
						alertFlag = true;
						return;
					}

				
					if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {
						
						
						if(flag == false){
					
							
						index +=5;
						var word= $("#searchBox").val();
						
							$.ajax({
								type : "GET",
								url : "/camsns/main.action",
								dataType: "json",
								data : "num=" + index + "&word=" + word ,
								
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
												html += '<button value="'+currentElement.boardSeq+'"'+'name="'+currentElement.boardSeq+'"';
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
	
	
	function search(word){
		$.ajax({
			type : "GET",
			url : "/camsns/main.action",
			dataType: "json",
			data : "word=" + word ,
			
			success: function(result){
				
				if (result.length != 0) {
				
					$.each(result, function(intValue, currentElement) {
						
							//console.log(intValue);
							//console.log(currentElement);
							//categoryType,boardSeq,boardCotent,boardRegdate,boardSubject
							//console.log(currentElement.boardCategoryName);
							//console.log(currentElement.boardCategoryName);
							var html ="";
							
							
							html += '<div class="area">';
							html += '<div class="contentHeader '+currentElement.category+'">';
							html += '<div class="contentNum">#'+currentElement.boardSeq+'</div>';
							html += '<div class="title">'+currentElement.boardSubject+'</div>';
							html += '<div class="shareArea">';
							html += '<button value="'+currentElement.boardSeq+'"'+'name="'+currentElement.boardSeq+'"';
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
						
							 
						
						

					});
					
				}else{//if(result!=0)
					$("#loading").hide();//값이없을경우
					$("#contentArea").html("결과가 없습니다.");
				}
			},//sucess
		    error: function(xhr, textStatus, error) {
			        alert('Error' + error);
		    }
		
			
		});//ajax
		
	}
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
						<button value="${boardDtoList.snsboardSeq}" name="${boardDtoList.snsboardSeq}"
							class="shareBtn glyphicon glyphicon-share-alt ${boardDtoList.categoryType}">

						</button>
					</div>

					<div class="clear"></div>
				</div>


				<div class="content">
					<div class="contentRegdate">${boardDtoList.snsboardRegdate}</div>
					<div class="contentPic">


						<img src="./images/ad1.JPG" /> 
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




<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('497e3896cc14549676d2ada05a95e0fd');
	
	
	
	

	
	  function sendLink(url,name) {
      Kakao.Link.sendTalkLink({
        label: '#'+name+'번째 이야기', // 공유할 메세지의 제목을 설정
				 image: {
        src: 'http://mud-kage.kakao.co.kr/14/dn/btqfJfuXWcY/P7iGH1pyo5w9X1pp8lf9Pk/o.jpg',
        width: '50',
        height: '50'
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

</body>
</html>