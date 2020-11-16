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

th, td {
	height: 50px;
	border: 1px solid black;
	text-align: center;
	
}
td:nth-child(2){
	cursor: pointer;
}
 table{
 	width: 70%;
    border: 1px solid black;
    border-collapse: collapse;
    margin: 0px auto;
 }
 
 table tr:nth-child(1){
	font-weight: bold;
	background: grey;
}

table tr{
	background:#FAFAFA;
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
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<jsp:include page="../common/menubar.jsp"/> --%>
	
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
	
		<!-- 프로필 이미지 -->
		<div class="profilegorup">
			<div class="imageBox" style="background: #BDBDBD;">
				<img class="profile" id="gdsImg1" src="resources/images/sitelogo.png">
			</div>
			<div class="fileBox">
				<label for="fileupload">프로필 수정</label>
				<input id="gdsImg" type="file" name="uploadFile" >
			</div>
		</div>
		
		<script>
			$("#gdsImg").change(function(){
				if(this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$("#gdsImg1").attr("src", data.target.result);             
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
		</script>
		
		<div>
				<table>
					<tr>
						<th>	
							아이디
						</th>
						<th>	
							이름
						</th>
						<th>
							전화번호
						</th>
						<th>
							기능
						</th>
					</tr>
					<tr>
						<th>
							user1
						</th>
						<th>
							박찬호
						</th>
						<th>
							010-1111-2222
						</th>
						<c:url var="mypage_memberInfo" value="mypage_memberInfo.me" />
						<th>
							<input type="button" value="활동이력" onclick="location.href='${ mypage_memberInfo }'">
							<input type="button" value="계정삭제">
						</th>
					</tr>
					<tr>
						<th>
							user2
						</th>
						<th>
							박찬희
						</th>
						<th>
							010-1111-3333
						</th>
						<c:url var="mypage_memberInfo" value="mypage_memberInfo.me" />
						<th>
							<input type="button" value="활동이력" onclick="location.href='${ mypage_memberInfo }'">
							<input type="button" value="계정삭제">
						</th>
					</tr>
					<tr>
						<th>
							user3
						</th>
						<th>
							박찬해
						</th>
						<th>
							010-1111-4444
						</th>
						<c:url var="mypage_memberInfo" value="mypage_memberInfo.me" />
						<th>
							<input type="button" value="활동이력" onclick="location.href='${ mypage_memberInfo }'">
							<input type="button" value="계정삭제">
						</th>
					</tr>
					<tr>
						<th>
							user4
						</th>
						<th>
							박찬행
						</th>
						<th>
							010-1111-5555
						</th>
						<c:url var="mypage_memberInfo" value="mypage_memberInfo.me" />
						<th>
							<input type="button" value="활동이력" onclick="location.href='${ mypage_memberInfo }'">
							<input type="button" value="계정삭제">
						</th>
					</tr>
					<tr>
						<th>
							user5
						</th>
						<th>
							박찬흰
						</th>
						<th>
							010-1111-6666
						</th>
						<c:url var="mypage_memberInfo" value="mypage_memberInfo.me" />
						<th>
							<input type="button" value="활동이력" onclick="location.href='${ mypage_memberInfo }'">
							<input type="button" value="계정삭제">
						</th>
					</tr>
					<tbody></tbody>
				</table>
				<form action= "<%= request.getContextPath() %>/search.no">
				<select name="opt"> <!-- 검색 컬럼 -->
					<option value="">아이디</option>
					<option value="">이름</option>
			    </select>
				<input type="text" name="" value="" placeholder="검색어를 입력하세요">
			    <button type="submit">검색</button>
			</form>
		</div>
    	<br clear="all">
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