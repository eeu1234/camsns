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

<link rel="stylesheet" type="text/css" href="./css/main.css" />
<script type="text/javascript" src="./js/main.js"></script>

<style>

</style>
<script>
	
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