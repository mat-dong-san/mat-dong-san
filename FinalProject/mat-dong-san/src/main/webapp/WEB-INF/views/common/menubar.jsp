<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      border-bottom: 1px solid rgb(235, 235, 235);
   }
   #goMain{
   	  float: left;
   }
   .goMenuButton{
      background: white;
      float: right;
      margin: 25px;
      color: rgb(34, 34, 34);
      font-size: 15px;
   }
   .goMenuButton:hover{
      cursor: pointer;
   }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div id="menubarDiv">
      <span id="6" class="goMenuButton" onclick="location.href='#'" style="color: rgb(136, 136, 136);font-size: 13px; margin: 25px 5px; margin-right: 15px;">회원가입</span>
      <span id="5" class="goMenuButton" onclick="location.href='#'" style="color: rgb(136, 136, 136);font-size: 13px; margin: 25px 5px;">로그인</span>
      <span id="4" class="goMenuButton" onclick="location.href='#'">마이페이지</span>
      <span id="3" class="goMenuButton" onclick="location.href='#'">고객센터</span>
      <span id="2" class="goMenuButton" onclick="location.href='#'">중고장터</span>
      <span id="1" class="goMenuButton" onclick="location.href='#'">관심목록</span>
      <span id="goSearchHouse" class="goMenuButton" onclick="location.href='goSearchHomeMain.search'">방찾기</span>
      <span id="goMain" class="goMenuButton" onclick="location.href='${ pageContext.request.contextPath }'">메인으로(로고)</span>
   </div>
</body>
</html>