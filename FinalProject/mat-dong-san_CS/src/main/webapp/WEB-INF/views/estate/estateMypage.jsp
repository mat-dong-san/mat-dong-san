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
#deleteMemberModalOpen {
   width: 550px;
   height: 65px;
   font-size: larger;
   background: skyblue;
}
.dmSpan {
   margin-bottom: 20px;
}

.textarea1 {
   position: relative;
   display: flex;
   margin-left: 73px;
   margin-bottom: 20px;
}
.dmListOption {
   width: 400px;
   height: 35px;
   margin-left: 19px;
   margin-bottom: 20px;
}

.tableDivLabel {
   width: 450px;
   margin-bottom: 8px;
   color: rgb(34, 34, 34);
   font-size: 15px;
   line-height: 20px;
   display: flex;
}
.cancelBtn{
   width: 218px;
   height: 50px;
   font-size: 15px;
   color: rgb(34,34,34);
   border: 1px solid rgb(204,204,204);
   background: rgb(255,255,255);

}
.modalWrap {
   text-align: center;
   display: none;
   width: 550px;
   height: 600px;
   position: absolute;
   top: 80%;
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
   height: 1500px;
   background-color: rgba(0, 0, 0, 0.5);
   top: 0;
   left: 0;
   z-index: 1;
}
.dmList1 {
   font-size: inherit;
   margin-top: 50px;
   color: red;
}
.dmList {
   text-align: left;
}
.dmSpan {
   margin-bottom: 20px;
}
.modal_close {
   width: 26px;
   height: 26px;
   position: absolute;
   top: -30px;
   right: 0;
}
.dm2 {
   margin: 10px;
   margin-bottom: 20px;
}

.modal_close>a {
   display: block;
   width: 100%;
   height: 100%;
   background: url(https://img.icons8.com/metro/26/000000/close-window.png);
   text-indent: -9999px;
}
#deleteMemberModal {
   height: 40px;
   color: rgb(102,102,102);
   font-size: 14px;
   text-decoration: underline;
   border: 0px;
   background: rgb(255,255,255);
}

.confirmBtn{
   width: 218px;
   height: 50px;
   font-size: 15px;
   color: rgb(255,255,255);
   border: 1px solid rgb(204,204,204);
   background: rgb(26,90,232);
   margin-left: 15px;

}
.searchBtn{
   width: 88px;
   height: 42px;
   font-size: 15px;
   font-weight:bold;
   color: rgb(255,255,255);
   border: 1px solid rgb(204,204,204);
   background: rgb(26,90,232, 90%);
   margin-left: 10px;

}
input[type=checkbox]{
	vertical-align:-3px;
	width:30px;
	height: 20px;
}
.tableDivImput {
   height: 46px;
   padding: 0px 15px;
   color: rgb(68, 68, 68);
   font-size: 15px;
   border: 1px solid rgb(208, 210, 214);
   border-radius: 0px;
   background: rgb(255, 255, 255);
   outline: none;
   box-sizing: border-box;
   appearance: none;
   width: 500px;
}

.postcodify_postcode5 {
   height: 37px;
   color: rgb(68, 68, 68);
   font-size: 15px;
   border: 1px solid rgb(208, 210, 214);
   border-radius: 0px;
   background: rgb(255, 255, 255);
   outline: none;
   appearance: none;
   width: 100px;
}
.postcodify_address {
   height: 46px;
   padding: 0px 15px;
   color: rgb(68, 68, 68);
   font-size: 15px;
   border: 1px solid rgb(208, 210, 214);
   border-radius: 0px;
   background: rgb(255, 255, 255);
   outline: none;
   box-sizing: border-box;
   appearance: none;
   width: 500px;
}
.postcodify_extra_info {
   height: 46px;
   padding: 0px 15px;
   color: rgb(68, 68, 68);
   font-size: 15px;
   border: 1px solid rgb(208, 210, 214);
   border-radius: 0px;
   background: rgb(255, 255, 255);
   outline: none;
   box-sizing: border-box;
   appearance: none;
   width: 500px;
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

a {
	color: #333;
	text-decoration: none;
	cursor: pointer;
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
	width: 33%;
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
   width: 740px;
   margin: 20px auto;
   padding: 55px;
   text-align: center;
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
   border-top: 1px solid #ddd;
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
	font-size: 0.7em;
}

#m_div2 {
	width: 75%;
	padding-bottom: 50px;
	z-index: 1;
}

#m_div3 {
	width: 75%;
	height: 1350px;
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
	border-radius: 10px;
	font-size: 2em;
}
.file_input_textbox {
    float:left;
    height:29px;
}
.file_input_div {
    position:relative;
    width:80px;
    height:36px;
    overflow:hidden;
}
.file_input_img_btn {
    padding:0 0 0 5px;
}
.file_input_hidden {
    font-size:29px;
    position:absolute;
    right:0px;
    top:0px;
    opacity:0;
    filter: alpha(opacity=0);
    -ms-filter: alpha(opacity=0);
    cursor:pointer;
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
			<div class="nav-item" onclick='location.href="mypageView.es"'>정보수정</div>
			<div class="nav-item" onclick='location.href="estateMypageContacted.es"'>쪽지함</div>
			<div class="nav-item" onclick='location.href="estateMypageProperty.es"'>매물관리/신청</div>

		</div>

		<div id="b_m_wrapper">
			<div class="sub_wrapper">
				<div id="m_div1">
					<div id="side_area" class="go_content1">
						<div class="sidebar_box fstbox" id="memberModifyInfo">개인정보</div>
						<div class="sidebar_box fstbox" id="estateModifyInfo">중개사정보</div>

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

						<input type="hidden" name="us_id" id="us_id"
							value="${ loginUser.us_id }">

						<div class="profilegorup">
							<div class="imageBox" style="background: #BDBDBD;">
								<img class="profile" id="us_picture_img" src="./resources/images/${loginUser.us_id}/${loginUser.us_picture}">
							</div>
							<div class="fileBox">
								<input type="text" name="us_picture" id="fileName" value="${loginUser.us_picture}" class="file_input_textbox" readonly >
								<div class="file_input_div">
								    <img src="resources/images/open.jpg" class="file_input_img_btn" alt="open" />
								    
								    
								    <form id="fileForm" method="post" enctype="multipart/form-data">
										<input type="file" id="us_fileName" name="uploadfile" class="file_input_hidden">
								    </form>
								    
								    
								</div>
							
							</div>
						
						<div id="tableDiv">
							<div id="footTableDiv2">

				               <div>
				                  <h1 class="tableDivLabel">본인 성명</h1>
				                  <div>
				                     <input type="text" name="us_name" id="us_name"
				                        class="tableDivImput" value="${ loginUser.us_name }">
				                  </div>
				               </div>
				               <div>
				                  <h1 class="tableDivLabel">휴대폰 번호</h1>
				                  <div>
				                     <input type="tel" name="us_phone" id="us_phone"
				                        class="tableDivImput" value="${ loginUser.us_phone }">
				                  </div>
				               </div>
				               <div>
				                  <h1 class="tableDivLabel">이메일 주소</h1>
				                  <div>
				                     <input type="email" name="us_email" id="us_email"
				                        class="tableDivImput" value="${ loginUser.us_email }">
				                  </div>
				               </div>
				            </div>
						</div>
						<br>
						<div id="modifyBtn">
							<input type="button" class="cancelBtn" value="취소" style="font-size: 2em;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="button" class="confirmBtn" value="확인" id="updateMember" style="font-size: 2em;">
						</div>
						</div>
						
						<input type="submit" id="deleteMemberModal" value="회원탈퇴" style="font-size: 2em;">
						
				</div>
				
				
				
				<div id="m_div3">
				
					
					<c:if test="${ empty e }">
						<br><br><br><br>
						<h1>등록한 중개사가없습니다 ಠ‸ಠ  </h1>
					</c:if>
					<c:if test="${ !empty e }">
					<div id="center">
						<div id="C_area">
							<h2>
								<a href="#" id="headd">중개사정보수정</a>
							</h2>
						</div>
					</div>
					
						<input type="hidden" name="e_id" id="e_id" value="">
						<div class="profilegorup">
							<div class="imageBox" style="background: #BDBDBD;">
								<img class="profile" id="e_picture_img" src="">
							</div>
							<div class="fileBox">
								
								<input type="text" id="fileName2" class="file_input_textbox" readonly >
								<div class="file_input_div">
								    <img src="resources/images/open.jpg" class="file_input_img_btn" alt="open" />
								    
								    <form id="fileForm2" method="post" enctype="multipart/form-data">
								    	<input type="file" id="e_fileName" name="uploadfile2" class="file_input_hidden">
								    </form>
								</div>
								
							</div>
						
						<div id="tableDiv">
							<div id="footTableDiv2">
								<div>
									<h1 class="tableDivLabel">중개사 이름</h1>
									<div>
										<input type="text" name="e_name" id="e_name" value="" class="tableDivImput" readonly>
									</div>	
								</div>
								<div>
									<h1 class="tableDivLabel">대표 번호</h1>
									<div>
										<input type="text" name="e_phone" id="e_phone" class="tableDivImput" value="">
									</div>
								</div>
								<div>
									<h1 class="tableDivLabel">사업자 등록번호</h1>
									<div>
										<input type="text" name="e_reg_num" id="e_reg_num" class="tableDivImput">
									</div>
								</div>
								<div>
									<h1 class="tableDivLabel">소개 설명</h1>
									<div>
										<textarea name="content" id="e_content" rows="10" cols="71" style="border: 1px solid rgb(208, 210, 214); background: rgb(255, 255, 255);"></textarea>
									</div>
								</div>
								<div>
									<h1 class="tableDivLabel">중개 전문분야</h1>
									<div style="text-align: left; border: 1px solid rgb(204,204,204);">
										<input type="checkbox" name="field" id="e_field" value="아파트">아파트 
										<input type="checkbox" name="field" id="e_field2" value="원룸">원룸 
										<input type="checkbox" name="field" id="e_field3" value="오피스텔">오피스텔
									</div>
								</div>
								

								<br>
								<div>
									<h1 class="tableDivLabel">우편 번호</h1>
									<div style="text-align:left;">
										<input type="text" name="post" class="postcodify_postcode5" id="e_addr" value="" size="6">
										<button type="button" class="searchBtn" id="postcodify_search_button">검색</button>
									</div>
								</div>
								<div>
									<h1 class="tableDivLabel">도로명 주소</h1>
									<div>
										<input type="text" name="address1" id="e_addr2" class="postcodify_address" value="" size="30">
									</div>
								</div>
								<div>
									<h1 class="tableDivLabel">상세 주소</h1>
									<div>
										<input type="text" name="address2" id="e_addr3" class="postcodify_extra_info" value="" size="30">
									</div>
								</div>
								<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
								<script>
									$(function(){
										$("#postcodify_search_button").postcodifyPopUp();
									});
								</script>

							</div>
							
						</div>
						<br>
						<div id="modifyBtn">
							<input type="button" class="cancelBtn" value="취소" style="font-size: 2em;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="button" class="confirmBtn" value="확인" id="updateEstate" style="font-size: 2em;">
						</div>
						</div>
						<button type="button" id="deleteMemberModal" onclick="validate2();" style="font-size: 2em;">중개사탈퇴</button>

					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	 <div class="backgroundModal"></div>
      <div class="modalWrap">
         <div class="modal_close">
            <a href="#">close</a>
         </div>
         <div>
            <div class="dm1">
               <h2>회원 탈퇴</h2>
            </div>
            <hr>
            <div class="dm2">
               <h2 class="dmList1">회원 탈퇴를 신청하기전에 아래 안내 사항을 한번 더 확인해주세요</h2>
               <ol class="dmList">
                  <li>회원 탈퇴시, 현재 로그인된 아이디는 즉시 탈퇴 처리 됩니다.
                  <li>회원 탈퇴시, 회원 전용 웹 서비시 이용이 불가합니다.
                  <li>탈퇴시 회원 정보 및 찜 서비스, 등록한 게시물 이용 기록이 모두 삭제됩니다.
                  <li>회원 정보및 서비스 이용 기록은 모두 삭제되며,삭제된 데이터는 복구되지 않습니다.
                  <li>광고를 위한 매물이 등록되어 있을 경우 , 탈퇴 시 모든 정보는 삭제됩니다.
               </ol>
               <select class="dmListOption">
                  <option>탈퇴 사유를 선택해주세요</option>
                  <option value="0">더 이상 이용하지 않음</option>
                  <option value="1">탈퇴 후 재가입 하려고</option>
                  <option value="2">원하는 정보가 없어서</option>
                  <option value="3">사용하기 불편해서</option>
               </select>
               <textarea class="textarea1" rows="5" cols="56"
                  placeholder="다른 사유가 있다면 입력해주세요"></textarea>
               <label class="dmCheck"> <input name="" type="checkbox">
                  <span class="dmSpan">안내사항을 모두 확인하였으며,이에 동의합니다.</span>
               </label>
            </div>
            <button type="button" id="deleteMemberModalOpen" onclick="validate();">회원탈퇴</button>
            
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
		 window.onload = function() {
	
	         function onClick() {
	            document.querySelector('.modalWrap').style.display = 'block';
	            document.querySelector('.backgroundModal').style.display = 'block';
	         }
	         function offClick() {
	            document.querySelector('.modalWrap').style.display = 'none';
	            document.querySelector('.backgroundModal').style.display = 'none';
	         }
	
	         document.getElementById('deleteMemberModal').addEventListener(
	               'click', onClick);
	         document.querySelector('.modal_close').addEventListener('click',
	               offClick);
	
	      };
		function readURL(input) {
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	                $('#us_picture_img').attr('src', e.target.result);
	                $('#fileName').val(input.files[0].name);
	            }
	          reader.readAsDataURL(input.files[0]);
	        }
	    }
		
		function readURL2(input) {
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	                $('#e_picture_img').attr('src', e.target.result);
	                $('#fileName2').val(input.files[0].name);
	            }
	          reader.readAsDataURL(input.files[0]);
	        }
	    }
		
		$('#us_fileName').change(function() {
			readURL(this);
		});
		
		$('#e_fileName').change(function() {
			readURL2(this);
		});
		
		$(document).ready(function() {
			$('#m_div3').css('display', 'none');
		});

		$("#memberModifyInfo").click(function() {

			$('#m_div3').css('display', 'none');
			$('#m_div2').css('display', 'block');

		});

		$("#estateModifyInfo").click(function() {
			$('#m_div2').css('display', 'none');
			$('#m_div3').css('display', 'block');
			var e_id = $('#e_id').val();
			var us_id = $('#us_id').val();
			$.ajax({
				url : 'selectEstateInfo.es',
				success : function(data) {
					console.log(data);
					if(data == "1"){
						alert('중개사정보가 없습니다');
					}else {
						$('#e_id').val(data.e_id);
						$('#e_name').val(data.e_name);
						$('#e_phone').val(data.e_phone);
						$('#fileName2').val(data.e_picture);
						var e_content = data.e_content.replace(/<br>/g, "\n");
						$('#e_content').val(e_content);
						$('#e_picture_img').attr("src", "./resources/images/"+ us_id + "/" + data.e_picture);
						
						
						var e_field = data.e_field.split(',');
						for ( var i in e_field) {
							if (e_field[i] == "아파트") {
								$('#e_field').attr("checked", true);
							} else if (e_field[i] == "원룸") {
								$('#e_field2').attr("checked", true);
							} else if (e_field[i] == "오피스텔") {
								$('#e_field3').attr("checked", true);
							}
						}
						$('#e_reg_num').val(data.e_reg_num);
						var e_addr = data.e_addr.split('/');
						$('#e_addr').val(e_addr[0]);
						$('#e_addr2').val(e_addr[1]);
						$('#e_addr3').val(e_addr[2]);
						
					}
				}
			});
		});
		
		
		$('#updateMember').click(function() {
			var	us_id = $('#us_id').val();
			var us_name = $('#us_name').val();
			var us_phone = $('#us_phone').val();
			var us_email = $('#us_email').val();
			var us_picture = $('#fileName').val();
			var formData = new FormData($('#fileForm')[0]);

			if (confirm("정보수정하시겠습니까?") == true){
				
				$.ajax({
					type: "POST",
					enctype: 'multipart/form-data',
					url : 'uploadFileMember.es',
					data: formData,
					processData: false,
					contentType: false,
					cache: false,
					success : function(data) {
						console.log(data);
						if(data == "1"){
						}
					}
				});
				$.ajax({
					url : 'updateMember.es',
					data: {us_id:us_id, us_name:us_name, us_phone:us_phone, us_email:us_email, us_picture:us_picture},
					success : function(data) {
						console.log(data);
						if(data == "1"){
							alert('업데이트성공');
						}
					}
				});
			}else{
				return false;
			}
			
		});
		
		
		
		$('#updateEstate').click(function() {
			var e_picture = $('#fileName2').val();
			var	e_id = $('#e_id').val();
			var e_name = $('#e_name').val();
			var e_phone = $('#e_phone').val();
			var e_content = $('#e_content').val();
			
			var e_field = new Array();
			
	        $('input[name=field]:checked').each(function() {
	        	e_field.push($(this).val());
	        })
	        
			var e_reg_num = $('#e_reg_num').val();
			var e_addr = $('#e_addr').val();
			var e_addr2 = $('#e_addr2').val();
			var e_addr3 = $('#e_addr3').val();
			var formData = new FormData($('#fileForm2')[0]);
			
			if (confirm("정보수정하시겠습니까?") == true){
				
				$.ajax({
					type: "POST",
					enctype: 'multipart/form-data',
					url : 'uploadFileEstate.es',
					data: formData,
					processData: false,
					contentType: false,
					cache: false,
					success : function(data) {
						console.log(data);
						if(data == "1"){
						}
					}
				});
				$.ajax({
					url : 'updateEstate.es',
					data: {e_id:e_id, e_name:e_name, e_phone:e_phone, e_content:e_content, e_picture:e_picture, e_field:e_field,
						e_reg_num:e_reg_num, e_addr:e_addr, e_addr2:e_addr2, e_addr3:e_addr3},
					traditional: true,		
					success : function(data) {
						console.log(data);
						if(data == "1"){
							alert('업데이트성공');
						}
					}
				});
			}else{
				return false;
			}
			
			
		});
		
		
		
		function validate() {
			if (confirm("정말탈퇴하시겠습니까?") == true){
				alert('탈퇴되었습니다');
				location.href="mdelete.es";
				
			}else{
				return false;
			     
			}
		}
		
		function validate2() {
			if (confirm("탈퇴하시겠습니까?") == true){
				var e_id = $('#e_id').val();
				alert('탈퇴되었습니다');
				location.href="edelete.es?e_id="+ e_id;
				
			}else{
				return false;
			     
			}
		}
	</script>
</body>
</html>