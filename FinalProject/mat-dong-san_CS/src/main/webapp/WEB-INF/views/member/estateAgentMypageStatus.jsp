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
	width: 100%;
	height: 200px;
	position: absolute;
	bottom: 0;
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

.mypageInfoIndexTitle {
	padding-top: 40px;
	margin: 20px auto;
	width: 1140px;
	margin-top: 50px;
	font-size: 50px;
	height: 40px;
	border-top: 1px solid rgb(204, 204, 204);
}

.conracted-tabel {
	margin: auto;
	width: 700px;
	border-collapse: collapse;
	height: 300px;
	display: flex;
}

.content {
	padding: 5px;
	margin: auto;
	width: 800px;
	border-collapse: collapse;
	height: 30px;
}

#my_modal {
	display: none;
	width: 300px;
	padding: 20px 20px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
	text-align: center;
}

#my_modal .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

#modal-text{
	display:inline-flex;
	margin-top:20px;
	height:80px;
	width: 250px;
	text-align: center;
	margin-bottom: 20px;
}
modal-btn{
	display: flex;
	position: relative;
	margin-top: 15px;
	text-align: center;
	
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
		
		<h2>신청받은 매물/방현황</h2>
		<div class="conracted-tabel">
		<table border="1"id="tb">
			<tr style="background: grey;">
				<th>no</th>
				<th width="300" >등록 받은 날짜</th>
				<th width="300">신청한 회원 아이디</th>
				<th width="300">확인/취소</th>
				<th width="300">신고하기</th>
			</tr>
			<tr class="content">
				<td align="center">1</td>
				<td align="center">2020-11-10</td>
				<td align="center">yong1</td>
				<td align="center">
					<input class="tabelBtn" type="button" value="확인">
					<input class="tabelBtn" type="button" value="취소">
				</td>
				<td align="center"><input class="tabelBtn" type="button" value="신고하기"></td>
			</tr>
				<tr class="content">
				<td align="center">2</td>
				<td align="center">2022-05-03</td>
				<td align="center">yong2</td>
				<td align="center">
					<input class="tabelBtn" type="button" value="확인">
					<input class="tabelBtn" type="button" value="취소">
				</td>
				<td align="center"><input class="tabelBtn" type="button" value="신고하기"></td>
			</tr>
				<tr class="content">
				<td align="center">3</td>
				<td align="center">2020-05-03</td>
				<td align="center">yong3</td>
				<td align="center">
					<input class="tabelBtn" type="button" value="확인">
					<input class="tabelBtn" type="button" value="취소">
				</td>
				<td align="center"><input class="tabelBtn" type="button" value="신고하기"></td>
			</tr>
				<tr class="content">
				<td align="center">4</td>
				<td align="center">2020-12-01</td>
				<td align="center">yong4</td>
				<td align="center">
					<input class="tabelBtn" type="button" value="확인">
					<input class="tabelBtn" type="button" value="취소">
				</td>
				<td align="center"><input class="tabelBtn" type="button" value="신고하기"></td>
			</tr>
				<tr class="content">
				<td align="center">5</td>
				<td align="center">2020-10-10</td>
				<td align="center">yong5</td>
				<td align="center">
					<input class="tabelBtn" type="button" value="확인">
					<input class="tabelBtn" type="button" value="취소">
				</td>
				<td align="center"><input class="tabelBtn" type="button" value="신고하기"></td>
			</tr>
			
	
		</table>

	</div>
	
			<h2>관리중인 매물</h2>
		<div class="conracted-tabel">
			<table   border="1" id="tb">
				<tr style="background: grey;">
					<th>no</th>
					<th width="450">신청받은 등록 번호</th>
					<th width="350">회원 정보</th>
					<th width="300">취소하기</th>
				</tr>
				<tr class="content">
					<td align="center">1</td>
					<td align="center">11-158-1635</td>
					<td align="center">yong1</td>
					<td align="center"><input type="button" id="popup_open_btn"
						value="취소하기"></td>
				</tr>
				<tr class="content">
					<td align="center">2</td>
					<td align="center">22-158-1635</td>
					<td align="center">yong1</td>
					<td align="center"><input type="button" id="popup_open_btn"
						value="취소하기"></td>
				</tr>
				<tr class="content">
					<td align="center">3</td>
					<td align="center">33-158-1635</td>
					<td align="center">yong1</td>
					<td align="center"><input type="button" id="popup_open_btn"
						value="취소하기"></td>
				</tr>
				<tr class="content">
					<td align="center">4</td>
					<td align="center">44-158-1635</td>
					<td align="center">yong1</td>
					<td align="center"><input type="button" id="popup_open_btn"
						value="취소하기"></td>
				</tr>
				<tr class="content">
					<td align="center">5</td>
					<td align="center">55-158-1635</td>
					<td align="center">yong1</td>
					<td align="center"><input type="button" id="popup_open_btn"
						value="취소하기"></td>
				</tr>
			</table>
		</div>
</div>
		
	<!-- 풋터  -->
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


	<!-- 모달창   -->
		<div id="my_modal">
			<a class="modal_close_btn">닫기</a>
			<form action="submit" id="modal-div" method="get">
				<div>
					<label>중개사에게 하고 싶은말</label> <input type="text" id="modal-text"placeholder="내용을 입력해주세요">
				</div>
				<input id="modal-btn"type="submit" value="신청하기">
			</form>
		</div>

		<script>
			function modal(id) {
				var zIndex = 9999;
				var modal = document.getElementById(id);

				var bg = document.createElement('div');
				bg.setStyle({
					position : 'fixed',
					zIndex : zIndex,
					left : '0px',
					top : '0px',
					width : '100%',
					height : '100%',
					overflow : 'auto',
					backgroundColor : 'rgba(0,0,0,0.4)'
				});
				document.body.append(bg);

				modal.querySelector('.modal_close_btn').addEventListener(
						'click', function() {
							bg.remove();
							modal.style.display = 'none';
						});

				modal
						.setStyle({
							position : 'fixed',
							display : 'block',
							boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

							zIndex : zIndex + 1,

							top : '50%',
							left : '50%',
							transform : 'translate(-50%, -50%)',
							msTransform : 'translate(-50%, -50%)',
							webkitTransform : 'translate(-50%, -50%)'
						});
			}

	
			document.getElementById('popup_open_btn').addEventListener('click',
					function() {
						modal('my_modal');
					});
			

		</script>
</body>
</html>