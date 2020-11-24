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

#modifyBtn {
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
	width: 100%;
	height: 200px;
	position: relative;
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

.imageBox {
	position: relative;
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profilegorup {
	width: 400px;
	margin: 20px auto;
	padding: 55px;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.fileBox {
	text-align: center;
	margin: 5px auto;
}

.modalWrap {
	display: none;
	width: 550px;
	height: 600px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: white;
	z-index: 2;
}

.backgroundModal {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

.dmList1{
	font-size: inherit;
	margin-top: 50px;
	color: red;
}

.dmList {
	text-align: left;
}
.dmListOption{
	width: 400px;
	height: 35px;
	margin-left:19px;
	margin-bottom: 20px;
}
.textarea1{
	position:relative;
	display: flex;
	margin-left: 75px;
	margin-bottom: 20px;
}
.dmSpan{
	margin-bottom: 20px;
}
li{ 
	margin: 5px;
}
.dm2{
	margin: 10px;
	margin-bottom: 20px;
}
#deleteMemberModalOpen{
	width: 550px;
	height: 65px;
	font-size: larger;
	background: skyblue;
}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp" />


	<div id="mypageContentDiv">

		<div class="mypageInfoIndexTitle" style="margin-top: 0;" id="index1">MY
			PAGE</div>

		<div id="mypageInfoIndexDiv">
			<div onclick='location.href="memberMyPage.me"'>정보수정</div>
			<div onclick='location.href="memberMyPageContacted.me"'>연락한부동산</div>
			<div onclick='location.href="memberMyPageProperty.me"'>내 매물정보</div>
			<div onclick='location.href="memberMyPageStatus.me"'>매물 신청 현황</div>
			<div onclick='location.href="memberMyPageUsed.me"'>내 중고거래</div>

		</div>


				<!-- 프로필 이미지 -->
				<div class="profilegorup">
					<div class="imageBox" style="background: #BDBDBD;">
						<img class="profile" src="./resources/images/profile.PNG">
					</div>
					<div class="fileBox">
						<label for="fileupload">프로필 수정</label> <input type="file"
							name="uploadFile" id="upLoadFile" style="width: 190px;">
					</div>
				</div>
		<div class="memberMyPageFormDiv">
			<form action="updateMember.me" method="post">
				<input type="hidden" name="us_id" id="us_id" value="${ loginUser.us_id }">
				<div id="mypageModify">
					<table id="footTableDiv">
						<tr>
							<td>본인 성명</td>
							<td><input type="text" name="us_name" id="us_name" value="${ loginUser.us_name }"></td>
						</tr>
						<tr>
							<td>휴대폰 번호</td>
							<td><input type="tel" name="us_phone" id="us_phone" value="${ loginUser.us_phone }"></td>
						</tr>
						<tr>
							<td>이메일 주소</td>
							<td><input type="email" name="us_email" id="us_email" value="${ loginUser.us_email }"></td>
						</tr>
					</table>
				</div>

				<div id="modifyBtn">
					<input type="button" value="취소" style="font-size: 2em;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="확인"
						style="font-size: 2em;">
					
				</div>
			</form>
			
			
			<input type="submit"  id="deleteMemberModal" value="회원탈퇴" style="font-size: 2em;">
				
				
			<div class="backgroundModal"></div>
				<div class="modalWrap">
				<div class="modal_close"><a href="#">close</a></div>
				<div>
					<div class="dm1">
						<h2>회원 탈퇴</h2>
					</div>
					<hr>
					<div class="dm2">
						<h2 class="dmList1">회원 탈퇴를 신청하기전에 아래 안내 사항을 한번 더 확인해주세요</h2>
						<ol class="dmList">
							<li> 회원 탈퇴시, 현재 로그인된 아이디는 즉시 탈퇴 처리 됩니다.
							<li> 회원 탈퇴시, 회원 전용 웹 서비시 이용이 불가합니다.
							<li> 탈퇴시 회원 정보 및 찜 서비스, 등록한 게시물 이용 기록이 모두 삭제됩니다.
							<li> 회원 정보및 서비스 이용 기록은 모두 삭제되며,삭제된 데이터는 복구되지 않습니다.
							<li> 광고를 위한 매물이 등록되어 있을 경우 , 탈퇴 시 모든 정보는 삭제됩니다.
						</ol>
						<select class="dmListOption">
							<option> 탈퇴 사유를 선택해주세요</option>
							<option value="0">더 이상 이용하지 않음</option>
							<option value="1">탈퇴 후 재가입 하려고</option>
							<option value="2">원하는 정보가 없어서</option>
							<option value="3">사용하기 불편해서</option>
						</select>
						<textarea class="textarea1" rows="5" cols="60" placeholder="다른 사유가 있다면 입력해주세요"></textarea>
						<label class="dmCheck">
							<input name="" type="checkbox">
							<span class="dmSpan">안내사항을 모두 확인하였으며,이에 동의합니다.</span>
						</label>
					</div>
					<form action="memberDelete.me" method="post">
						<input type="hidden" name="us_id" id="us_id" value="${ loginUser.us_id }">
						<input type="submit"  id="deleteMemberModalOpen" value="회원탈퇴" style="font-size: 2em;">
					</form>
				</div>
				</div>	
		    </div>


		<div id="footInfoDiv">
			<div id="searchRoomNumDiv">
				<span style="cursor: pointer; background: white;"
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
	
	 window.onload = function() {
		 
		    function onClick() {
		        document.querySelector('.modalWrap').style.display ='block';
		        document.querySelector('.backgroundModal').style.display ='block';
		    }   
		    function offClick() {
		        document.querySelector('.modalWrap').style.display ='none';
		        document.querySelector('.backgroundModal').style.display ='none';
		    }
		 
		    document.getElementById('deleteMemberModal').addEventListener('click', onClick);
		    document.querySelector('.modal_close').addEventListener('click', offClick);
		 
		};
	</script>
</body>
</html>