<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<%@include file="/inc/camsnsAsset.jsp" %>
<style>

	#tbl1 { width: 1440px; margin: 30px auto;}
	#tbl1 th, #tbl1 td { text-align: center; }
	
	#tbl1 td:nth-child(2) { text-align: left; }
	
	#tbl1 th:nth-child(1) { width: 80px;}
	#tbl1 th:nth-child(2) { width: 300px; }
	#tbl1 th:nth-child(3) { width: 100px; }
	#tbl1 th:nth-child(4) { width: 50px; }
	#tbl1 th:nth-child(5) { width: 150px; }
	#tbl1 th:nth-child(6) { width: 100px; }
	#tbl1 th:nth-child(7) { width: 100px; }
	
	#tbl2 { width: 500px; margin: 20px auto; }
	#tbl2 td { padding: 0px 2px; }
	#tbl2 td:nth-child(1) { width: 120px; }
	#tbl2 td:nth-child(2) { width: 280px; }
	#tbl2 td:nth-child(3) { width: 100px; }
	
	#searchMsg { text-align: center; }
	
</style>
<script>

	//계정 수정하는 함수
	function snsBoardUpdate(snsBoardSeq){
		location.href="/spring/admin/adminupdate.action?adminID="+adminID;
	}

	
	//로그인 한 level 이 9999 이면 삭제 함수 생성
	<c:if test="${adminLevel == 9999}">
	function adminDelete(adminID){
		if(confirm("삭제하시겠습니까?")){
			location.href="/spring/admin/admindelete.action?adminID="+adminID;
		}
	}
	</c:if>

</script>

</head>
<body>
	<h1>관리자 관리</h1>
	<table id="tbl1" class="table table-striped">
		<tr>
			<th>순번</th>
			<th>제목</th>
			<th>작성자</th>
			<th>소속</th>
			<th>등록날짜</th>
			<th>Blind</th>
			<th>보이기</th>
		</tr>
		<c:if test="${empty boardlist || boardlist.size() == 0}">
			<tr>
				<td colspan="5">게시물이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${boardlist}" var="dto">
		<tr>
			<td>${dto.snsboardSeq}</td>
			<td>${dto.snsboardSubject}</td>
			<td>${dto.userEmailIdFk}</td>
			<td>${dto.universityName}</td>
			<td>${dto.snsboardRegdate}</td>
			<td>${dto.snsboardBlind}</td>
			<td>${dto.snsboardStat}</td>
			
		</tr>
		</c:forEach>
		
	</table>
	<div id="pagebar" style="text-align: center;">
		${pagebar}
	</div>
	<div id="search">
		<!-- 자기 자신을 호출 -->
		<form method="GET" action="/camsns/admin/adminSnsboardList.action">
			<table id="tbl2">
				<tr>
					<td>
						<select name="column" id="column" class="form-control">
							<option 
								value="adminID" 
								<c:if test="${sdto.column == 'adminID'}">selected</c:if>
								>아이디
							</option>
							<option 
								value="adminName"
								<c:if test="${sdto.column == 'adminName'}">selected</c:if>
								>이름
							</option>
							<option 
								value="adminDepartment"
								<c:if test="${sdto.column == 'adminDepartment'}">selected</c:if>
								>부서
							</option>
							<option 
								value="universityName"
								<c:if test="${sdto.column == 'universityName'}">selected</c:if>
								>소속대학
							</option>
						</select>
					</td>
					<td><input type="text" name="word" id="word" class="form-control" required placeholder="검색어를 입력하세요." value="${sdto.word}"></td>
					<td><input type="submit" value="검색하기" class="btn btn-warning"></td>
				</tr>
			</table>
		</form>
	</div>
	
	
</body>
</html>