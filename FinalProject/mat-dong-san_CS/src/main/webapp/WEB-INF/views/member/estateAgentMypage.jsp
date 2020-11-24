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
	/*    width: 100%; */
	/*    height: 100%; */
	/*    background-color:#ffa5001c; */
}

#mypageContentDiv {
	margin: 70px 300px auto 300px;
	text-align: center;
}

#b_m_wrapper {
	background-color: white;
	width: 1140px;
	margin: 0 auto;
	padding-top: 20px;
	border-bottom: 1px solid rgb(204, 204, 204);
}

.sub_wrapper {
	margin-top: 20px;
	border-top: 1px solid rgb(204, 204, 204);
	display: flex;
}

#side_area {
	/* float: left; */
	display: block;
}

.title_txt {
	font-weight: bold;
	vertical-align: center;
	padding-top: 20px;
	margin-top: 0;
	margin-bottom: 0;
}

.c_search {
	float: right;
	border: 1px solid #ddd;
	height: 20px;
}

.btn_tool {
	border: 1px solid #ddd;
	white-space: nowrap;
	border-radius: 2px;
	font-size: 13px;
	line-height: 29px;
	height: 30px;
}

a {
	color: #333;
	text-decoration: none;
	cursor: pointer;
}

#webfolderAppNameLink {
	font-size: 14px;
	color: #333;
	vertical-align: middle;
}

.txt-1 {
	letter-spacing: -0.5px;
	font: 14px;
	color: #333;
	height: 32px;
	border-top: 1px solid #ddd;
	/*     border-bottom: 1px solid #ddd; */
	text-align: left;
	padding: 0 16px;
	white-space: nowrap;
	font-weight: normal;
	font-size: 13px;
	width: 10px;
}

.txt-2 {
	letter-spacing: -0.5px;
	font: 14px;
	color: #333;
	height: 32px;
	border-top: 1px solid #ddd;
	/*     border-bottom: 1px solid #ddd; */
	text-align: left;
	padding: 0 16px;
	white-space: nowrap;
	font-weight: normal;
	font-size: 13px;
	width: 100%;
	/*     display: inline-block; */
	/*     vertical-align: middle; */
}

#txt-2 {
	display: block;
	padding-top: 7px;
}

#r {
	width: 10px;
}

.txt-m {
	letter-spacing: -0.5px;
	font: 14px;
	color: #333;
	height: 32px;
	border-top: 1px solid #ddd;
	/*     border-bottom: 1px solid #ddd; */
	text-align: right;
	padding: 0 16px;
	white-space: nowrap;
	font-weight: normal;
	font-size: 13px;
	width: 96%;
}

.txt-h {
	letter-spacing: -0.5px;
	font: 14px;
	color: #ddd;
}

.btn_function .txt {
	position: relative;
	color: #fff;
	font-size: 15px;
}

.btn_function {
	position: relative;
	display: block;
	height: 44px;
	font-size: 14px;
	letter-spacing: -1px;
	line-height: 47px;
	padding: 0px;
	text-align: center;
	background: #00a1b9;
	border-radius: 4px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
	transition: all .2s;
}

.lnb h1 {
	position: relative;
	padding: 4px 24px 4px 40px;
	min-height: 19px;
	font-size: 14px;
	color: #333;
	vertical-align: middle;
}

.txt {
	min-height: 19px;
	font-size: 16px;
	color: #333;
	vertical-align: middle;
}

.table-1 {
	margin-top: 10px;
}

#headd {
	padding-top: 500px;
}

#center {
	margin-left: 20px;
}

.b_paging {
	background: white;
	border: 1px solid rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

#modifyBtn {
	padding: 10px;
	margin-bottom: 50px;
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
	margin-top: 80px;
	height: 35px;
	/* padding: 10px; */
	font-size: 20px;
}

#mypageInfoIndexDiv div {
	width: 25%;
}

#mypageInfoIndexDiv div:hover {
	cursor: pointer;
}

#mypageModify {
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
	/*    width: 1140px; */
	font-size: 12px;
	text-align: left;
	line-height: 8px;
}

.mypageInfoIndexTitle {
	padding-top: 40px;
	margin: 20px auto;
	/*    width: 1140px; */
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

#goBoard {
	padding: 20px;
	border: 1px solid gray;
}

#footTableDiv2 {
	text-align: center;
}

#footTableDiv3 {
	text-align: center;
}

#tableDiv>table {
	margin: 0 auto;
}

#footTableDiv2>tbody>tr td {
	padding-bottom: 25px;
}

#footTableDiv3>tbody>tr td {
	padding-bottom: 25px;
}

#m_div1 {
	border-right: 2px solid rgb(204, 204, 204);
	width: 25%;
}

#m_div2 {
	width: 75%;
	padding-bottom: 50px;
	z-index: 1;
}

#m_div3 {
	width: 75%;
	padding-bottom: 50px;
	z-index: 2;
}

.fstbox {
	margin-top: 30px;
	line-height: 100px;
	font-size: 1.5em;
}

.fstbox:hover {
	background: silver;
}

.sidebar_box {
	height: 100px;
	border: 1px solid silver;
	width: 250px;
}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp" />

	<div id="mypageContentDiv">

		<div class="mypageInfoIndexTitle" style="margin-top: 0;" id="index1">MY
			PAGE</div>

		<div id="mypageInfoIndexDiv">

			<!-- 중개사 마이페이지  -->
			<div onclick='location.href="EstateAgentMyPage.me"'>중개사정보수정</div>
			<div onclick='location.href="EstateAgentMyPageContacted.me"'>연락한회원</div>
			<div onclick='location.href="EstateAgentMyPageProperty.me"'>내
				매물정보</div>
			<div onclick='location.href="EstateAgentMyPageStatus.me"'>매물 신청
				현황</div>
			<div onclick='location.href="EstateAgentMyPageUsed.me"'>내 중고거래</div>
		</div>



		<div id="b_m_wrapper">
			<div class="sub_wrapper">
				<div id="m_div1">
					<div id="side_area" class="go_content1">
						<div class="sidebar_box fstbox" id="memberModifyInfo">개인정보</div>
						<div class="sidebar_box fstbox" id="estateAgentModifyInfo">중개사정보</div>

					</div>
				</div>

				<div id="m_div2">
					<div id="center">
						<div id="C_area">
							<h2>
								<a href="#" id="headd">개인정보수정</a>
							</h2>


						</div>
					</div>

					<form action="updateMember.me" method="post">
						<input type="hidden" name="us_id" id="us_id"
							value="${ loginUser.us_id }">

						<div class="profilegorup">
							<div class="imageBox" style="background: #BDBDBD;">
								<img class="profile" src="./resources/images/profile.PNG">
							</div>
							<div class="fileBox">
								<label for="fileupload">프로필 수정</label> <input type="file"
									name="uploadFile" style="width: 190px;">
							</div>
						</div>
						<div id="tableDiv">
							<table id="footTableDiv2">
								<tr>
									<td>본인 성명</td>
									<td><input type="text" name="us_name" id="us_name"
										value="${ loginUser.us_name }"></td>
								</tr>
								<tr>
									<td>휴대폰 번호</td>
									<td><input type="tel" name="us_phone" id="us_phone"
										value="${ loginUser.us_phone }"></td>
								</tr>
								<tr>
									<td>이메일 주소</td>
									<td><input type="email" name="us_email" id="us_email"
										value="${ loginUser.us_email }"></td>
								</tr>
							</table>
						</div>
						<div id="modifyBtn">
							<input type="button" value="취소" style="font-size: 2em;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="확인"
								style="font-size: 2em;">
						</div>
					</form>
					<button type="button" onclick="location.href='${ mdelete }'">회원탈퇴</button>
				</div>
				<div id="m_div3">
					<div id="center">
						<div id="C_area">
							<h2>
								<a href="#" id="headd">중개사정보수정</a>
							</h2>


						</div>
					</div>

					<form action="updateEstateAgent.me" method="post" enctype="multipart/form-data">
						<input type="hidden" name="us_id" id="e_us_id"
							value="">

						<div class="profilegorup">
							<div class="imageBox" style="background: #BDBDBD;">
								<img class="profile" id="e_picture"
									src="./resources/images/profile.PNG">
							</div>
							<div class="fileBox">
								<label for="fileupload">프로필 수정</label> <input type="file"
									name="fileName" id="e_uploadFile" style="width: 190px;">
							</div>
						</div>
						<div id="tableDiv">
							<table id="footTableDiv3">
								<tr>
									<td>중개사 이름</td>
									<td><input type="text" name="e_name" id="e_name" value=""></td>
								</tr>
								<tr>
									<td>대표 번호</td>
									<td><input type="text" name="e_phone" id="e_phone" value=""></td>
								</tr>
								<tr>
									<td>소개설명</td>
									<td><textarea name="content" id="e_content" rows="5" cols="33"></textarea></td>
								</tr>
								<tr>
									<td>중계전문분야</td>
									<td><input type="checkbox" name="field" id="e_field"
										value="아파트">아파트 <input type="checkbox" name="field"
										id="e_field2" value="원룸">원룸 <input type="checkbox"
										name="field" id="e_field3" value="오피스텔">오피스텔</td>
								</tr>
								<tr>
									<td>사업자등록번호</td>
									<td><input type="text" name="e_reg_num" id="e_reg_num"></td>
								</tr>

								<tr>
									<td>우편번호</td>
									<td><input type="text" name="post"
										class="postcodify_postcode5" id="e_addr" value="" size="6">
										<button type="button" id="postcodify_search_button">검색</button>
									</td>
								</tr>
								<tr>
									<td>도로명 주소</td>
									<td><input type="text" name="address1" id="e_addr2"
										class="postcodify_address" value="" size="30"></td>
								</tr>
								<tr>
									<td>상세 주소</td>
									<td><input type="text" name="address2" id="e_addr3"
										class="postcodify_extra_info" value="" size="30"></td>
								</tr>

							</table>
						</div>
						<div id="modifyBtn">
							<input type="button" value="취소" style="font-size: 2em;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="확인"
								style="font-size: 2em;">
						</div>
						<button type="button" onclick="location.href='${ edelete }'">중개사탈퇴</button>
					</form>


				</div>


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

	<script>
		$(document).ready(function() {
			$('#m_div3').css('display', 'none');
		});

		$("#memberModifyInfo").click(function() {

			$('#m_div3').css('display', 'none');
			$('#m_div2').css('display', 'block');

		});

		$("#estateAgentModifyInfo").click(function() {

			$('#m_div2').css('display', 'none');
			$('#m_div3').css('display', 'block');

			var us_id = $('#us_id').val();
			
			$('#e_us_id').val(us_id);
			
			$.ajax({
				url : 'selectEstateAgentInfo.me',
				success : function(data) {
					console.log(data);
					$('#e_name').val(data.e_name);
					$('#e_phone').val(data.e_phone);

					var e_content = data.e_content.split('/');
					var e_content2 = "";
					for ( var i in e_content ) {
					    e_content2 += e_content[i] +"\n";
					}
					$('#e_content').val(e_content2);
					$('#e_picture').attr("src", "./resources/images/"+e_picture);
		
					var e_field = data.e_field.split(',');
					for ( var i in e_field) {
						if(e_field[i] == "아파트"){
							$('#e_field').attr("checked",true);
						}else if(e_field[i] == "원룸"){
							$('#e_field2').attr("checked",true);
						}else if(e_field[i] == "오피스텔"){
							$('#e_field3').attr("checked",true);
						}
						
					}
					
					
					$('#e_reg_num').val(data.e_reg_num);
					
					var e_addr = data.e_addr.split('/');
					
					$('#e_addr').val(e_addr[0]);

					$('#e_addr2').val(e_addr[1]);

					$('#e_addr3').val(e_addr[2]);
					
				}
			});

		});
	</script>
</body>
</html>