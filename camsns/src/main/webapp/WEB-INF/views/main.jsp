<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 각종 임포트 -->
<%@include file="/inc/camsnsAsset.jsp"%>
<title>Sns</title>

<link rel="stylesheet" type="text/css" href="./css/main.css" />

<style>

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


	share();//공유버튼인식
	






			
	/* 스크롤시 글 더불러오기 */		
	$(window).scroll(
	
			
			function() {
				
				share();//버튼인식
				if ($(window).scrollTop() == ($(document).height() - $(window).height()) && flag == true && alertFlag == false) {
					$("#loading").hide();
					alert("마지막 글입니다.");
					alertFlag = true;
					return;
				}
						
			
				if ($(window).scrollTop() == ($(document).height() - $(window).height())) {
					
					
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
											
											
											 $.each(currentElement.fileList, function(key, file) {
												html += '	<img src="./images/board/'+file.fileName+'" /> ';
											
											}); 
											
											html += '</div>';
											html += currentElement.boardContent;
											html += '</div>';
											html += '<div class="comment">';
											html += '<button class="showComment" onclick="location.href=\'/camsns/snsboard/snsboardview.action?boardSeq='+currentElement.boardSeq+'\'">댓글 보기</button>';
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
		
				console.log(alertFlag);
			});//scroll

})//onload

function share(){
	/* 카카오톡 글 url 보내기 */
	$(".shareBtn")
			.click(
					function() {
						var name = $(this).attr('name');
						
						var boardSeq = $(this).val();
						var hostUrl = "http://127.0.0.1:8090";
//						var hostUrl = "http://eeu1234.iptime.org:8090";
						var shareUrl = "/camsns/snsboard/snsboardview.action?boardSeq="	+ boardSeq;
						var url = hostUrl +shareUrl
						
						//함수실행
						sendLink(url,name);
						
					})
}

//검색
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
						
						
						 $.each(currentElement.fileList, function(key, file) {
								html += '	<img src="./images/board/'+file.fileName+'" /> ';
							
							}); 
						
						
						
						
						html += '</div>';
					
						
						html += currentElement.boardContent;
						html += '</div>';
						html += '<div class="comment">';
						html += '<button class="showComment" onclick="location.href=\'/camsns/snsboard/snsboardview.action?boardSeq='+currentElement.boardSeq+'\'">댓글 보기</button>';
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
						<button value="${boardDtoList.snsboardSeq}" name="${boardDtoList.snsboardSeq}"	class="shareBtn glyphicon glyphicon-share-alt ${boardDtoList.categoryType}"></button>
					</div>

					<div class="clear"></div>
				</div>


				<div class="content">
					<div class="contentRegdate">${boardDtoList.snsboardRegdate}</div>
					<div class="contentPic">

						<c:forEach items="${boardDtoList.filelist}" var="filedto">
							 <c:if test="${filedto.snsboardfileFileName != null}"> 
								<img src="./images/board/${filedto.snsboardfileFileName}" />
							 </c:if>  
					 </c:forEach> 
					</div>

					${boardDtoList.snsboardContent}

				</div>

				<div class="comment">
					<button class="showComment" onclick="location.href='/camsns/snsboard/snsboardview.action?boardSeq=${boardDtoList.snsboardSeq}'">댓글 보기</button>
				</div>

		</div>
		</c:forEach>
		</div>
	</div>
	<div id="loading" style="background-color:white;width:100%;height:50px;text-align:center;">
		<img src="./images/loading.gif" style="width:10%;height:auto;" />
	</div>




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
</body>
</html>