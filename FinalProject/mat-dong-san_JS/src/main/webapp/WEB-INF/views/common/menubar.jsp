<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
   #menubarDiv{
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      height: 70px;
      background: lightgray;
   }
   
   .goMenuButton{
      background: white;
   }
   .goMenuButton:hover{
      cursor: pointer;
   }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>


   <div id="menubarDiv">
      <span id="goMain" class="goMenuButton" onclick="location.href='${ pageContext.request.contextPath }'">메인으로(로고)</span>
      <span id="goSearchHouse" class="goMenuButton" onclick="location.href='goSearchHomeMain.search'">방찾기</span>
      <span id="1" class="goMenuButton" onclick="location.href='#'">관심목록</span>
      <span id="2" class="goMenuButton" onclick="location.href='used.board'">중고장터</span>
      <span  class="goMenuButton" id="helpDeskGo" onclick="location.href='boardNoticeList.board'">고객센터</span>
      <span id="4" class="goMenuButton" onclick="location.href='#'">마이페이지</span>
      <span id="5" class="goMenuButton" onclick="location.href='#'">로그인</span>
      <span id="6" class="goMenuButton" onclick="location.href='#'">회원가입</span>
      
      <div class="loginArea" align="right">
			<c:if test="${ empty sessionScope.loginUser }">
				
				<span id="" class="goMenuButton" onclick="location.href='loginView.me'">로그인</span>
				<span id="" class="goMenuButton" onclick="location.href='enrollView.me'">회원가입</span>
				
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
			
				<c:url var="storage" value="productStorage.pr"/>
				
				<h5 align="right">
					<c:out value="${ loginUser.us_name }님 환영합니다."/> <!-- c:out 활용 -->
					<c:url var="logout" value="logout.me"/>
					<span id="" class="goMenuButton" onclick="location.href='${logout}'">로그아웃</span>
					
				</h5>
			</c:if>
		</div>
      
      
      
      
      
      
      
      
      
   </div>
   
   
   
</body>
</html>