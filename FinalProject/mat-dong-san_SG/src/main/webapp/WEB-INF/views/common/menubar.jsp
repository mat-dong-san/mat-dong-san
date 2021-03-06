<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>


<!--정적파일(css/ javascript) 불러오기-->
<link href="<c:url value='/resources/css/navbar_css.css' />" type="text/css" rel="stylesheet">
<script src="./resources/js/navbar_js.js"></script>	


</head> 
<style>
	
	
</style>
</head>
<body>
	
	<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 만들기 -->
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<h1 align="center">맛동산</h1>
	<br>
	
	<div class="loginArea" align="right">
		<c:if test="${ empty sessionScope.loginUser }">
			
			<button type="button" onclick="location.href='loginView.me'">로그인</button>
			<button type="button" onclick="location.href='enrollView.me'">회원가입</button>
			
		</c:if>
		
		<c:if test="${ !empty sessionScope.loginUser }">
		
			<c:url var="findRoom" value="findRoom.bo"/>
			<c:url var="postRoomForm" value="postRoomForm.bo"/>
			<c:url var="interest" value="interest.bo"/>
			<c:url var="market" value="market.bo"/>	
			<c:url var="customer" value="customer.bo"/>
			<c:url var="mypage" value="mypage.me"/>
	        
			<h3 align="right">
			<c:out value="${ loginUser.us_name }님 환영합니다."/> <!-- c:out 활용 -->
			<c:url var="logout" value="logout.me"/>
			<button onclick="location.href='${logout}'">로그아웃</button>
			
			</h3>
		</c:if>
	</div>
	<ul class="navbar_menu">
		<li onclick="location.href='${findRoom}'">방찾기</li>
		<li onclick="location.href='${postRoomForm}'">매물올리기</li>
		<li onclick='${interest}'>관심목록</li>
		<li onclick='${market}'>중고장터</li>
		<li onclick='${customer}'>고객센터</li>
		<li onclick="location.href='${mypage}'">마이페이지</li>
	</ul>
	<!-- 위처럼 c:url을 통해서 지정할 수도 있지만 지금까지 해왔던 것처럼 바로 href에 url을 넣어도 상관없음 -->
	
</body>
</html>