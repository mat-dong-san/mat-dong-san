<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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

table {
	width: 1100px;
	border: 1px solid black;
	border-collapse: collapse;
	margin: 0px auto;
}

table tr:nth-child(1) {
	font-weight: bold;
	background: grey;
}

table tr:nth-child(2) {
	background: #D8D8D8;
}
table tr:nth-child(3) {
	background: #D8D8D8;
}
table tr:nth-child(4) {
	background: #D8D8D8;
}
table tr:nth-child(5) {
	background: #D8D8D8;
}

table tr:nth-child(6) {
	background: #D8D8D8;
}

table tr {
	background: #FAFAFA;
}

#mypageContentDiv {
	margin-top: 70px;
	position: absolute;
	text-align: center;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
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
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<div id="mypageContentDiv">
		<div class="mypageInfoIndexTitle" style="margin-top: 0;" id="index1">MY
			PAGE</div>
		<div style="width: 80%; margin-left: 10%">
			<hr>
			<c:url var="mypage" value="mypage.me" />
			<c:url var="mypage_brokerManagement"
				value="goEstateAgentListPage.me" />
			<c:url var="mypage_propertyManagement"
				value="mypage_propertyManagement.me" />
			<c:url var="mypage_reported" value="mypage_reported.me" />
			<div id="mypageInfoIndexDiv">
				<div onclick='location.href="${mypage}"'>회원 관리</div>
				<div onclick='location.href="${mypage_brokerManagement}"'>중개사
					관리</div>
				<div onclick='location.href="${mypage_propertyManagement}"'>매물
					관리</div>
				<div onclick='location.href="${mypage_reported}"'>신고함</div>
			</div>
		</div>

		<div>
			<br> <br>
			<table>
				<tr>
					<th width="250px">아이디</th>
					<th width="150px">이름</th>
					<th width="400px">전화번호</th>
					<th width="350px">기능</th>
				</tr>
				<c:forEach var="m" items="${list}">
					<tr>
						<td>${ m.us_id }</td>
						<td>${ m.us_name }</td>
						<td>${ m.us_phone }</td>
						<td class="td11"><input type="button" value="활동이력"
							onclick="goMemberDetailPage(this)"> <input type="button"
							value="계정삭제" onclick="deleteMember(this)"> <input
							type="hidden" id="id1" value="${ m.us_id }"></td>
					</tr>
				</c:forEach>
			</table>
			<!-- 페이징 처리 -->
			<div>
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="mypage.me">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
						<c:if test="${ searchValue ne null }">
							<c:param name="searchCondition" value="${ searchCondition }" />
							<c:param name="searchValue" value="${ searchValue }" />
						</c:if>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
				<!-- 페이지 -->
				<c:if test="${ pi.endPage > 0 }">
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage-1 }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="mypage.me">
								<c:param name="currentPage" value="${ p }" />
								<c:if test="${ searchValue ne null }">
									<c:param name="searchCondition" value="${ searchCondition }" />
									<c:param name="searchValue" value="${ searchValue }" />
								</c:if>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
					</c:forEach>
				</c:if>

				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage-1 }">
						[다음]
					</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage-1 }">
					<c:url var="after" value="mypage.me">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
						<c:if test="${ searchValue ne null }">
							<c:param name="searchCondition" value="${ searchCondition }" />
							<c:param name="searchValue" value="${ searchValue }" />
						</c:if>
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>
			</div>

			<script>
				// 관리자-회원상세 페이지
				function goMemberDetailPage(thisInfo) {
					var us_id = $(thisInfo).parent().children(":last").val();
					location.href = "goMemberDetailPage.me?us_id=" + us_id;
				}
				// 일반회원탈퇴
				function deleteMember(thisInfo) {
					var us_id = $(thisInfo).parent().children(":last").val();
					
/* 					if (confirm("정말 삭제하시겠습니까??") == true) {
						location.href = "deleteNormalMember.me?us_id=" + us_id;
					} else {
						return false;
					} */
					
					if (confirm("삭제하시겠습니까?") == true){
	                    $.ajax({
	                        url: 'deleteNormalMember.me',
	                        data: {us_id:us_id},
	                        success: function(data) {
	                            console.log(data);
	                            if(data == "1") {
	                            	alert('삭제되었습니다.');
	                                location.reload();
	                            }
	                        }
	                    });

	                }else{
	                    return false;
	                }
				} 
			</script>

			<select id="searchCondition" name="searchCondition">
				<!-- 검색 컬럼 -->
				<option value="아이디">아이디</option>
				<option value="이름">이름</option>
			</select> <input type="search" id="searchValue" value="${searchValue}"
				placeholder="검색어를 입력하세요">
			<button onclick="searchMember();">검색하기</button>

			<script type="text/javascript">
				// 검색
				function searchMember() {
					var searchCondition = $("#searchCondition").val();
					var searchValue = $("#searchValue").val();
					location.href = "mypage.me?searchCondition="
							+ searchCondition + "&searchValue=" + searchValue;
				}
			</script>
		</div>
		<br clear="all">
		<div id="footInfoDiv">
			<div id="searchRoomNumDiv">
				<span style="cursor: pointer; background: white;"
					onclick="location.href='#detailHeaderDiv'">맨 위로 </span>
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
		var searchCondition = "";
		var searchValue = "";
		var currentPage = 1;
	</script>
</body>
</html>