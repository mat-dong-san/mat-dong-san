<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
html, body {
   padding: 0;
   margin: 0;
   width: 100%;
   height: 100%;
}

#mypageContentDiv {
   margin-top: 70px;
   position: absolute;
   text-align: center;
   top: 0;
   left: 0;
   right: 0;
   bottom: 0;
   background: #ffa5001c;
   overflow: auto;
}

#mypageInfoIndexDiv {
   display: flex;
   width: 1140px;
   margin: 0px auto;
   margin-top: 50px;
   height: 35px;
   padding: 10px;
   font-size: 17px;
   border-bottom: 1px solid rgb(204, 204, 204);
}

#mypageInfoIndexDiv div {
   width: 25%;
}

#mypageInfoIndexDiv div:hover {
   cursor: pointer;
}

#footInfoDiv {
   left: 0;
   right: 0;
   bottom: 0;
   height: 200px;
   background: rgb(55, 55, 55);
   margin-top: 30px;
   color: rgb(160, 160, 160);
}

#headTable th {
   font-size: 30px;
   font-weight: 700;
}

#headTable td {
   text-align: left;
}

#bodyTable {
   width: 100%;
}

#bodyTable tr {
   height: 50px;
}

.mypageInfoIndexTitle {
   padding-top: 40px;
   margin: 20px auto;
   width: 1140px;
   margin-top: 50px;
   font-size: 50px;
   height: 40px;
   border-top: 1px solid rgb(204, 204, 204);
}

.productContent{
    display: inline-flex;
    width: 180px;
    border: 1px solid black;
    height: 250px;
    margin: 15px;
    float:left;
    flex-direction: column;
}

.productContent:hover{
	cursor: pointer;
}
#contentContainer{
	border: 4px solid grey;
	width : 1060px;
	height: 580px;
	margin: 0px auto;
}

}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:include page="../common/menubar.jsp"/> --%>
	
	<div id="mypageContentDiv">
	    <div class="mypageInfoIndexTitle" style="margin-top: 0;"id="index1">MY PAGE</div>
		<div style="width:80%; margin-left:10%">
			<hr>
			<c:url var="mypage" value="mypage.me"/>
			<c:url var="mypage_brokerManagement" value="mypage_brokerManagement.me"/>
			<c:url var="mypage_propertyManagement" value="mypage_propertyManagement.me"/>
			<c:url var="mypage_reported" value="mypage_reported.me"/>	
			<div id="mypageInfoIndexDiv">
				<div onclick='location.href="${mypage}"'>회원 관리</div>
				<div onclick='location.href="${mypage_brokerManagement}"'>중개사 관리</div>
				<div onclick='location.href="${mypage_propertyManagement}"'>매물 관리</div>
				<div onclick='location.href="${mypage_reported}"'>신고함</div>
			</div>
		</div>
		<br><br>
	    <div>
	    	<div id="contentContainer">
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>쓰리룸</span><span>너희중개사</span><span>매매</span><span>27000</span><span>부가설명</span></div>
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>원룸</span><span>우리중개사</span><span>월세</span><span>500/20</span><span>부가설명</span></div>
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>투룸</span><span>너희중개사</span><span>월세</span><span>1000/40</span><span>부가설명</span></div>
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>쓰리룸</span><span>너희중개사</span><span>전세</span><span>15000</span><span>부가설명</span></div>
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>투룸</span><span>너희중개사</span><span>전세</span><span>2000/50</span><span>부가설명</span></div>
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>쓰리룸</span><span>우리중개사</span><span>월세</span><span>5000/60</span><span>부가설명</span></div>
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>투룸</span><span>너희중개사</span><span>전세</span><span>2000/50</span><span>부가설명</span></div>
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>쓰리룸</span><span>우리중개사</span><span>월세</span><span>5000/60</span><span>부가설명</span></div>
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>투룸</span><span>너희중개사</span><span>전세</span><span>2000/50</span><span>부가설명</span></div>
		        <div class="productContent" onclick=""><img alt="사진" src=""><span>쓰리룸</span><span>우리중개사</span><span>월세</span><span>5000/60</span><span>부가설명</span></div>
	    	</div>
			<form action= "<%= request.getContextPath() %>/search.no">
				<select name="opt"> <!-- 검색 컬럼 -->
		<%-- 	    	<option value="all" <%= selectedOpt[0] %>>전체 목록</option> --%>
					<option value="">원룸</option>
					<option value="">투룸</option>
					<option value="">쓰리룸</option>
			    </select>
				<input type="text" name="" value="" placeholder="검색어를 입력하세요">
			    <button type="submit">검색</button>
			</form>
			<form action= "<%= request.getContextPath() %>/search.no">
				<input type="text" name="" value="" placeholder="검색어를 입력하세요"> /
				<input type="text" name="" value="" placeholder="검색어를 입력하세요">
			    <button type="submit">월세 또는 전세로 검색하기?</button>
			</form>
			<form action= "<%= request.getContextPath() %>/search.no">
				<input type="date">
				<input type="date">
			    <button type="submit">날짜로 검색하기?</button>
			</form>
		</div>
		<div id="footInfoDiv">
         <div id="searchRoomNumDiv">
            <span
               style="cursor: pointer; background: white;"
               onclick="location.href='#detailHeaderDiv'">맨 위로</span>
         </div>
         <div id="footDetailInfoDiv">
            <p>(주)맛동산</p>
            <p>대표: 김수환, 김용연, 백성강, 이정서, 정창섭</p>
            <p>사업자 번호: 220-11-48751-4872442142</p>
            <p>주소: 서울시 강남구 역삼동</p>
            <br>
            <p>고객센터: 070-1253-8253 평일: 09:00 ~ 18:00 (공휴일 휴무)</p>
            <p>팩스: 02-111-2222</p>
         </div>
      	</div>
   </div>
</body>
</html>