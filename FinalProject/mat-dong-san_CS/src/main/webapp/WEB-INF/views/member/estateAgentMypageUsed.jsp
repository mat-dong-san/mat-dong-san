<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#footTableDiv {
   width: 100%;
}

#footTableDiv tr {
   height: 50px;
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


#mypageModify {
   width: 500px;
   margin: 40px auto;
   border: 1px solid rgb(204, 204, 204);
   padding: 55px;
   text-align: center;
}



#footInfoDiv {
   width:100%;
   height:200px;
   position:absolute;
   bottom:0;
   background: rgb(55, 55, 55);
   text-align: center;
   margin-top: 30px;
   color: rgb(160, 160, 160);
}


#footDetailInfoDiv {
   margin: 0px auto;
   width: 1140px;
   font-size: 12px;
   text-align: left;
   line-height: 8px;
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

.property{
	position:relative;
	width:auto;
	margin: 40px auto;
	text-align: center;
	overflow:auto;
	height: 700px;
	margin-top:0;
	
}
.divList{
	width:1180px;
	overflow: auto;
	margin: 85px auto;
	left: 400px;
}
.PropertyContent{
	display:inline-flex;
	flex-direction:column;
	width:180px;
	border: 1px solid black; 
	padding: 10px; 
	height: auto; 
	min-height: 200px; 
	overflow: auto;
	margin: 20px;
	
}




</style>
</head>
<body>
   <c:import url="../common/menubar.jsp" />


   <div id="mypageContentDiv">

      <div class="mypageInfoIndexTitle" style="margin-top: 0;"
         id="index1">MY PAGE</div>

		<div id="mypageInfoIndexDiv">
			<div onclick='location.href="memberMyPage.me"'>정보수정</div>
			<div onclick='location.href="memberMyPageContacted.me"'>연락한부동산</div>
			<div onclick='location.href="memberMyPageProperty.me"'>내 매물정보</div>
			<div onclick='location.href="memberMyPageStatus.me"'>매물 신청 현황</div>
			<div onclick='location.href="memberMyPageUsed.me"'>내 중고거래</div>
			
				<!-- 중개사 마이페이지  -->
			<div onclick='location.href="EstateAgentMyPage.me"'>중개사정보수정</div>
			<div onclick='location.href="EstateAgentMyPageContacted.me"'>연락한회원</div>
			<div onclick='location.href="EstateAgentMyPageProperty.me"'>내 매물정보</div>
			<div onclick='location.href="EstateAgentMyPageStatus.me"'>매물 신청 현황</div>
			<div onclick='location.href="EstateAgentMyPageUsed.me"'>내 중고거래</div>
		</div>

		<c:url var="DetailPage" value="PropertyInformation" />
		<div class="property">
			<div class="divList">
				<div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>가전</span> <span>모니터</span> <span>50만원</span>
					<span>부가설명</span>
				</div>
				<div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>가구</span> <span>침대</span> <span>50만원</span>
					<span>부가설명</span>
				</div>
				<div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>가전</span> <span>핸드폰</span> <span>60만원</span>
					<span>부가설명</span>
				</div>
				<div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>의류</span> <span>패딩</span> <span>35만원</span>
					<span>부가설명</span>
				</div><div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>의류</span> <span>패딩</span> <span>35만원</span>
					<span>부가설명</span>
				</div><div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>의류</span> <span>패딩</span> <span>35만원</span>
					<span>부가설명</span>
				</div><div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>의류</span> <span>패딩</span> <span>35만원</span>
					<span>부가설명</span>
				</div><div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>의류</span> <span>패딩</span> <span>35만원</span>
					<span>부가설명</span>
				</div><div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>의류</span> <span>패딩</span> <span>35만원</span>
					<span>부가설명</span>
				</div><div class="PropertyContent"
					onclick="location.href='${ DetailPage }'">
					<img alt="사진" src=""> <span>의류</span> <span>패딩</span> <span>35만원</span>
					<span>부가설명</span>
				</div>
			</div>
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

   <script>
   
   </script>
</body>
</html>