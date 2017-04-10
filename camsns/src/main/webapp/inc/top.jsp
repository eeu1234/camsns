<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="topInc">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>


			</div>



			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/camsns/main.action">메인으로</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
						  <div id="naver_id_login" style="width:126px;height:30px;"></div>
						  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
						  <script type="text/javascript">
						  	var naver_id_login = new naver_id_login("RnwpsHXunrglCkR5f5HG", "rnfkehdrn.iptime.org:8090/camsns/main.action");
						  	var state = naver_id_login.getUniqState();
						  	naver_id_login.setButton("white", 2,40);
						  	naver_id_login.setDomain("rnfkehdrn.iptime.org:8090/camsns/maindata.action");
						  	naver_id_login.setState(state);
						  	naver_id_login.setPopup();
						  	naver_id_login.init_naver_id_login();
						  </script>
					</li>
					<li>
						<select name="" id="" class="form-control">
							<option value="" selected>- 학교 선택 -</option>
							<c:forEach items="${universityDtoList}" var="universityDtoList">
								<option value="${universityDtoList.universitySeq}">${universityDtoList.universityName}
								</option>
							</c:forEach>
					</select></li>
				</ul>
			</div>
		</div>
	</nav>

</div>