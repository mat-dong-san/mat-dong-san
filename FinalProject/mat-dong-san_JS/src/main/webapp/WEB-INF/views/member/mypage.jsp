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

#modifyBtn{
	padding: 10px;
	
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
	left: 0;
	right: 0;
	bottom: 0;
	height: 200px;
	background: rgb(55, 55, 55);
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


</style>
</head>
<body>
	<c:import url="../common/menubar.jsp" />


	<div id="mypageContentDiv">

		<div class="mypageInfoIndexTitle" style="margin-top: 0;"
			id="index1">MY PAGE</div>
		
		<div id="mypageInfoIndexDiv">
			<div onclick='location.href="#index1"'>정보수정</div>
			<div onclick='location.href="#index2"'>연락한부동산</div>
			<div onclick='location.href="#index3"'>내 매물정보</div>
			<div onclick='location.href="#index4"'>내 중고거래</a>
			</div>
		</div>

		<div id="mypageModify">
			<table id="footTableDiv">
				
				<tr>
					<td>본인 성명</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>이메일 주소</td>
					<td><input type="text"></td>
					<td><input type="button" value="중복확인"></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td><input type="text"></td>
				</tr>
			</table>
		</div>
		
		<div id="modifyBtn">
			<input type="button" value="취소" style="font-size: 2em;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="확인" style="font-size: 2em;">
		</div>


		<div id="footInfoDiv">
			<div id="searchRoomNumDiv">
				<input type="text" placeholder="매물번호 검색"> <input
					type="button" value="검색"> <span
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