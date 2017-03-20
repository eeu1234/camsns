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
					<li class="active"><a href="#">메인으로</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
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