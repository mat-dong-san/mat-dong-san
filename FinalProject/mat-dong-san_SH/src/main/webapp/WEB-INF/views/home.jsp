<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	#mainRootDiv{
		position: fixed;
		bottom: 0;
		left: 0;
		right: 0;
		top: 70px;
		text-align: center;
		overflow: auto;
	}
	#searchAddrDiv{
		width: 1180px;
		margin: 0 auto;
		padding-top: 180px;
		padding-bottom: 140px;
	}
	#searchLabel{
		font-size: 46px;
		font-weight: 300;
	}
	#searchButton{
		outline: 0;
	    border: 0;
	    height: 43px;
	    width: 89px;
	    margin: 2px;
	    background: rgb(21, 100, 249);
	    letter-spacing: -0.3px;
	    color: white;
	    font-size: 16;
	}
	#searchInput{
		outline: 0;
	    border: 0;
	    width: 670px;
	    margin-left: 30px;
	    height: 43px;
	}
	#searchDiv{
		border: 1px solid rgb(208, 210, 214);
		margin: 0 auto;
		width: 800px;
		margin-top: 50px;
		height: 47px;
	}
	#recommendationDiv{
		width: 1180px;
   		margin: 0 auto;
    	border-top: 1px solid rgb(238, 238, 238);
    	padding-top: 35px;
	}
	#recomTitle{
		font-size: 25px;
		font-weight: 500;
		margin-top: 10px;
	}
	#recomSub{
		font-size: 16px;
	    font-weight: 300;
	    margin-bottom: 45px;
	    margin-top: 20px;
	}
	#boardListContainer{
		width: 1180px;
		margin: 0 auto;
		margin-top: 30px;
		padding-top: 40px;
		margin-bottom: 100px;
		font-size: 15px;
		letter-spacing: -0.5px;
		font-weight: 300;
	}
	#boardListContainer>div>div{
		margin: 2px 10px;
		border-bottom: 1px solid rgb(238, 238, 238);
	}
	.recomContentDiv{
		width: 185px;
    	height: 172px;
    	border-radius: 5px;
    	border: 1px solid rgb(238, 238, 238);
    	display: inline-flex;
    	flex-direction: column;
	}
	.recomContentDiv:hover{
		cursor: pointer;
	}
	.boardListClass{
		width: 440px;
		height: 180px;
		display: inline-flex;
		flex-direction: column;
		text-align: left;
	}
	.boardTitle{
		font-size: 17px;
		letter-spacing: 1px;
		font-weight: 600;
	}
	.boardMoreBtn{
		float: right;
		outline: 0;
		border: 0;
		height: 30px;
	}
	.boardMoreBtn:hover{
		cursor: pointer;
		letter-spacing: -0.5px;
	}
	.boardListClass>div:nth-child(n+2):hover{
		cursor: pointer;
		background: rgb(238, 238, 238);
	}
	
</style>
</head>
<body>
<%-- <h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P> --%>
	<c:import url="common/menubar.jsp" />
	<div id="mainRootDiv">
		<div id="searchAddrDiv">
			<label id="searchLabel">어느 <span style="color: rgb(21, 100, 249);">동네</span>에서 살고싶으신가요?</label>
			<br>
			<div id="searchDiv">
				<form action="goSearchHomeMain.search" method="get">
					<input id="searchInput" name="searchInput" type="text" placeholder="찾고싶은 지역을 검색해주세요">
					<input id="searchButton" type="submit" value="검색">
				</form>
			</div>
		</div>
		<div id="recommendationDiv">
			<div id="recomTitle">이 집 어때?</div>
			<div id="recomSub">새로 올라온 집을 추천합니다</div>
			<c:forEach var="p" items="${ product }">
				<div class="recomContentDiv" onclick="goDetailPage(this)">
					<img alt="${ p.p_picture }" src="resources/buploadFiles/${ fn:substring(p.p_picture,1,21) }" width="99%" height="120px">
					<label style="font-size: 17px; font-weight: 600">
						<c:if test="${ p.p_deal == '전세' }">
		        			${ p.p_charter }
			        	</c:if>
			        	<c:if test="${ p.p_deal == '월세' }">
			        		${ p.p_deposit }/${ p.p_rent }
			        	</c:if>
					</label>
					<label style="font-size:12px">${ p.p_addr }</label>
					<input type="hidden" value="${ p.p_id }">
				</div>
			</c:forEach>
		</div>
		
		<div style="border: 1px solid rgb(238, 238, 238); margin-top: 80px; margin-bottom: 30px;"></div>
		
		<div id="boardListContainer">
			<div id="mainQnADiv" class="boardListClass">
				<div><span class="boardTitle">QnA</span><button class="boardMoreBtn">더 보기</button></div>
				<div>방을 어떻게 찾을 수 있나요?</div>
				<div>매물 올리기는 어떻게 하나요?</div>
				<div>악성 댓글 및 허위 매물 신고하는 방법</div>
				<div>중고거래 이용법</div>
				<div>검색이 정상적으로 되지 않을때</div>
			</div>
			<div id="mainTradeListDiv" class="boardListClass">
				<div><span class="boardTitle">중고거래</span><button class="boardMoreBtn">더 보기</button></div>
				<div>2년 사용한 중고 책상 나눔 합니다.</div>
				<div>이사가면서 새로 구매하게되어 장농 판매합니다.</div>
				<div>책상 쓸만한거 삽니다.</div>
				<div>행거 처분</div>
				<div>쇼파 판매중입니다. 10만원</div>
			</div>
		</div>
	</div>
	<script>
	/* 디테일 페이지 이동하기 */
  	function goDetailPage(thisInfo){
  		var p_id = $(thisInfo).children(":last").val();
  		location.href="searchRoomDetailPage.search?p_id="+p_id;
  	}
  	</script>
</body>
</html>
