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
#b_m_wrapper{
	background-color:white;
	height:880px;
}
 #side_area{
    width:240px;
    height:850px;
    float: left;
    padding:15px;
	border-right:1px solid #ddd;
	display: block;
	margin-right:20px;
    }
.title_txt{
		font-weight: bold;
		vertical-align: center;
		padding-top:20px;
		margin-top:0 ;
		margin-bottom:0;
}
.c_search{
		float: right;
   		border: 1px solid #ddd;
    	height:20px;
	}
	
.btn_tool{
        border: 1px solid #ddd;
        white-space: nowrap;
  	 	border-radius: 2px;
   		font-size: 13px;
   		line-height: 29px;
   		height: 30px;	 
}
	
a{
	color: #333;
	text-decoration:none; 
	cursor: pointer;
    
	}
#webfolderAppNameLink{
	font-sizxe: 14px;
    color: #333;
    verticaxl-align: middle;
	}
.txt-1{
	sletter-spacing: -0.5px;
    font:14px;
    color: #333;  
    height: 32px;
    border-top: 1px solid #ddd;
/*     border-bottom: 1px solid #ddd; */
    text-align: left;
    padding: 0 16px;
    white-space: nowrap;
    font-weight: normal;
    font-size: 13px;
    width:10px;
	}
.txt-2{
	sletter-spacing: -0.5px;
    font:14px;
    color: #333;  
    height: 32px;
    border-top: 1px solid #ddd;
/*     border-bottom: 1px solid #ddd; */
    text-align: left;
    padding: 0 16px;
    white-space: nowrap;
    font-weight: normal;
    font-size: 13px;
    width:100%;
/*     display: inline-block; */
/*     vertical-align: middle; */
	}
#txt-2{
	display:block;
	padding-top:7px;
}
	

#r{
	width: 10px;
}
 #m{
}    
.txt-m{
    letter-spacing: -0.5px;
    font:14px;
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
.txt-h{
    letter-spacing: -0.5px;
    font:14px;
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
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
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
.txt{
	
    min-height: 19px;
    font-size: 16px;
    color: #333;
    vertical-align: middle;
}    

.table-1{
	margin-top:10px;
}
#headd{
	padding-top:500px;
}
#tr{
	
	width:90%;
}

#center{
	margin-left:20px;
}
.b_paging{
	background:white;
	border:1px solid rgba(0,0,0,0.2);
	cursor:pointer;
	
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
   position:relative ;
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

.imageBox {
	position:relative;
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
.profilegorup{
    width: 400px;
    margin: 20px auto;
    padding: 55px;
    text-align: center;
    display: flex;
    	flex-direction: column;
    	justify-content: center;
    	align-items: center;
}
.fileBox{
	text-align: center;
	margin: 5px auto;
}

#goBoard{
	padding:20px;
	border: 1px solid gray;
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

		<!-- 프로필 이미지 -->
		<div class="profilegorup">
			<div class="imageBox" style="background: #BDBDBD;">
				<img class="profile" src="./resources/images/profile.PNG">
			</div>
			<div class="fileBox">
				<label for="fileupload">프로필 수정</label> <input type="file"name="uploadFile" style="width: 190px;">
			</div>
		</div>



		<div id="b_m_wrapper">
			<div id="side_area" class="go_content1">
				<!-- 자료실 이름 -->

				<section class="gnb_title">
					<h1>
						<a id="webfolderAppNameLink" href="#">마이페이지</a>
					</h1>
				</section>


				<!-- 전사 자료실 이름 -->
				
				<h1 title="접기">
					<span id="goBoard" class="txt">회원정보수정</span>
				</h1>
				
				<h1 title="접기">
					<span id="goBoard" class="txt">중개사정보수정</span>
				</h1>
				
				<h1 class="company" title="접기">
					<span class="txt"></span> <input type="hidden" value="">
				</h1>

			</div>

			<div id="center">
				<div id="C_area">
					<p class="title_txt">
						<a href="#" id="headd">회원정보수정</a>
					</p>

					<button id="searchBoard" class="c_search">검색</button>
					
				</div>

				<div class="table-1">
					<table>
						<tr>
							<th><a class="btn_tool">
									<span class="txt-h" onclick="location.href='/boardWrite.bo'">새글쓰기
								</span>&nbsp;
							</a></th>
							<th><a class="btn_tool"> <span class="txt-h"
									onclick="deleteClick();">삭제하기 </span>
							</a></th>
						</tr>
					</table>
				</div>
			</div>
			<div class="table-1">

				<table id="tb">
					<tr id="tr">
						<th class="txt-1"><span><input id="b_m_checkall"
								type="checkbox" onclick="allcheck();"></span></th>
						<th class="txt-1"><span>번호 </span></th>
						<th class="txt-1"><span>분류 </span></th>
						<th class="txt-2"><span id="txt-2">제목 </span></th>
						<th class="txt-m"><span>작성자 </span></th>
						<th class="txt-m"><span>작성일 </span></th>
						<th class="txt-m"><span>조회 </span></th>
					</tr>
					<tr>
						<td colspan='7'>조회된 리스트가 없습니다.</td>
					</tr>

					<tr id="tr2">
						<td class="txt-1"><input class="b_m_checkall" type="checkbox"></td>
						<td class="txt-1" id="tr_child"><input id="b_no"
							type="hidden" name="bNo" value=""></td>
						<td class="txt-1"><span></span>
						<td class="txt-2"></td>
						<td class="txt-m"></td>
						<td class="txt-m"></td>
						<td class="txt-m"></td>
					</tr>

				</table>
			</div>


		</div>




		<form action="updateEstateAgent.me" method="post">
			
		
			<input type="hidden" name="us_id" id="us_id"value="${ EstateAgent.us_id }">
			<div id="mypageModify">

				<table id="footTableDiv">


					<tr>
						<td>중개사 이름</td>
						<td><input type="text" value="${ EstateAgent.e_name }"></td>
					</tr>
					<tr>
						<td>이메일 주소</td>
						<td><input type="email"></td>
						<td><input type="button" value="중복확인"></td>
					</tr>
					<tr>
						<td>휴대폰 번호</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>중개사 번호</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>중개사 주소</td>
						<td><input type="text"></td>
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
   
   </script>
</body>
</html>