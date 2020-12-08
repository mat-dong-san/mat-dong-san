<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<<<<<<< HEAD
<P>  The time on the server is ${serverTime}. </P>

<a href="searchHouseMain.search">방찾기 테스트</a>
<a href="boardNoticeList.board">고객 센터로</a>
=======
<P>  The time on the server is ${serverTime}. </P> --%>
	<c:import url="common/menubar.jsp" />
	<div id="mainRootDiv">
		<div id="searchAddrDiv">
			<label id="searchLabel">어느 <span style="color: rgb(21, 100, 249);">동네</span>에서 살고싶으신가요?</label>
			<br>
			<div id="searchDiv">
				<form action="SearchHomeMain.search" method="get">
					<input id="searchInput" name="searchInput" type="text" placeholder="찾고싶은 지역을 검색해주세요">
					<input id="searchButton" type="submit" value="검색">
				</form>
			</div>
		</div>
		<div id="recommendationDiv">
			<div id="recomTitle">이 집 어때?</div>
			<div id="recomSub">새로 올라온 집을 추천합니다</div>
			<div class="recomContentDiv">
				<img alt="매물 사진" src="">
				<label>500/30</label>
			</div>
			<div class="recomContentDiv">
				<img alt="매물 사진" src="">
				<label>5000</label>
			</div>
			<div class="recomContentDiv">
				<img alt="매물 사진" src="">
				<label>1500/40</label>
			</div>
			<div class="recomContentDiv">
				<img alt="매물 사진" src="">
				<label>5500/80</label>
			</div>
			<div class="recomContentDiv">
				<img alt="매물 사진" src="">
				<label>27000</label>
			</div>
			<div class="recomContentDiv">
				<img alt="매물 사진" src="">
				<label>14000</label>
			</div>
		</div>
		
		<div style="border: 1px solid rgb(238, 238, 238); margin-top: 80px; margin-bottom: 30px;"></div>
		
		<div id="boardListContainer">
			<div id="mainQnADiv" class="boardListClass">
				<div><span class="boardTitle">QnA</span><button class="boardMoreBtn">더보기</button></div>
				<div>방을 어떻게 찾을 수 있나요?</div>
				<div>매물 올리기는 어떻게 하나요?</div>
				<div>악성 댓글 및 허위 매물 신고하는 방법</div>
				<div>중고거래 이용법</div>
				<div>검색이 정상적으로 되지 않을때</div>
			</div>
			<div id="mainTradeListDiv" class="boardListClass">
				<div><span class="boardTitle">중고거래</span><button class="boardMoreBtn">더보기</button></div>
				<div>2년 사용한 중고 책상 나눔 합니다.</div>
				<div>이사가면서 새로 구매하게되어 장농 판매합니다.</div>
				<div>책상 쓸만한거 삽니다.</div>
				<div>행거 처분</div>
				<div>쇼파 판매중입니다. 10만원</div>
			</div>
		</div>
	</div>
>>>>>>> parent of 408f50c... 오케이오케
</body>
</html>
