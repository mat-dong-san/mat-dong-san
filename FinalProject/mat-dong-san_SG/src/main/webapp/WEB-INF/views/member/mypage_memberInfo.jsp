<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
th, td {
	height: 50px;
	border: 1px solid black;
	text-align: center;
}

.table1 {
	width: 900px;
	border: 1px solid black;
	border-collapse: collapse;
	margin: 0px auto;
}

html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}

.div_table {
	margin: 0px auto;
	float: left;
	width: 800px
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
	margin: 0px auto;
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
	width: 100%;
	background: rgb(55, 55, 55);
	margin-top: 30px;
	color: rgb(160, 160, 160);
	float: left;
}

#headTable th {
	font-size: 30px;
	font-weight: 700;
}

#headTable td {
	text-align: left;
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

.table1 tr:nth-child(1) {
	font-weight: bold;
	background: grey;
}

.table1 tr {
	background: #FAFAFA;
}

.div2 {
	margin-top: 50px;
	margin-bottom: 50px;
	width: 1000px;
	margin-left: 50px;
}
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:include page="../common/menubar.jsp"/> --%>

	<div id="mypageContentDiv">
		<div class="mypageInfoIndexTitle" style="margin-top: 0;" id="index1">MY
			PAGE</div>
		<div style="width: 80%; margin-left: 10%">
			<hr>
			<c:url var="mypage" value="mypage.me" />
			<c:url var="mypage_memberManagement"
				value="goEstateAgentDetailPage.me" />
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
		<%-- <c:out value="${}님의 활동이력입니다."/> --%>
		<div>
			<br>
		</div>

		<div style="width: 1000px; margin: 0px auto;">
			<table id="membertable">
				<tr>
					<td><h2>이름 : ${member.us_name}</h2></td>
					<td><h2>ID : ${member.us_id}</h2></td>
				</tr>
			</table>
		</div>

		<div style="width: 2000px; margin: 0px auto;">
			<div class="div_table">
				<br>
				<table class="table1">
					<tr>
						<td colspan="6">매물 관리</td>
					</tr>
					<tr>
						<td width="590px">제목</td>
						<td width="70px">타입</td>
						<td width="700px">주소</td>
						<td width="300px">거래 종류</td>
						<td width="150px">기능</td>
					</tr>
					<c:forEach var="p" items="${productList}">
						<c:if test="${p.us_id eq us_id }">
							<tr>
								<td>${ fn:substringBefore(p.p_content, '///')}</td>
								<td>${ p.p_kind }</td>
								<td>${ p.p_addr }</td>
								<c:if test="${p.p_charter == null}">
									<td>월세 : ${p.p_deposit} / ${ p.p_rent }</td>
								</c:if>
								<c:if test="${ p.p_deposit == null}">
									<td>전세 : ${ p.p_charter }</td>
								</c:if>
								<td class="td11">
									<!-- 	<input type="button" value="상세보기" onclick="goDetailPage(this)"> 수정 -->
									<input type="button" value="상세보기" onclick=""> <input
									type="hidden" value="${ p.p_id }">
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<!-- 매물 페이징 처리 -->
				<div>
					<!-- [이전] -->
					<c:if test="${ ppi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
					<c:if test="${ ppi.currentPage > 1 }">
						<c:url var="before1" value="goMemberDetailPage.me">
							<c:param name="productCurrentPage"
								value="${ ppi.currentPage - 1 }" />
							<c:param name="us_id" value="${us_id}" />
							<c:if test="${ searchValue ne null }">
								<c:param name="productSearchCondition"
									value="${ productSearchCondition }" />
								<c:param name="productSearchValue"
									value="${ productSearchValue }" />
							</c:if>
						</c:url>
						<a href="${ before1 }">[이전]</a> &nbsp;
				</c:if>

					<!-- 페이지 -->
					<c:forEach var="p1" begin="${ ppi.startPage }"
						end="${ppi.endPage-1}">
						<c:if test="${ p1 eq ppi.currentPage }">
							<font color="red" size="4"><b>[${ p1 }]</b></font>
						</c:if>
						<c:if test="${ p1 ne ppi.currentPage }">
							<c:url var="pagination1" value="goMemberDetailPage.me">
								<c:param name="productCurrentPage" value="${ p1 }" />
								<c:param name="us_id" value="${us_id}" />
								<c:if test="${ searchValue ne null }">
									<c:param name="productSearchCondition"
										value="${ productSearchCondition }" />
									<c:param name="productSearchValue"
										value="${ productSearchValue }" />
								</c:if>
							</c:url>
							<a href="${ pagination1 }">${ p1 }</a> &nbsp;
					</c:if>
					</c:forEach>

					<!-- [다음] -->
					<c:if test="${ ppi.currentPage >= ppi.maxPage-1 }">
					[다음]
				</c:if>
					<c:if test="${ ppi.currentPage < ppi.maxPage-1 }">
						<c:url var="after1" value="goMemberDetailPage.me">
							<c:param name="productCurrentPage"
								value="${ ppi.currentPage + 1 }" />
							<c:param name="us_id" value="${us_id}" />
							<c:if test="${ productSearchValue ne null }">
								<c:param name="productSearchCondition"
									value="${ productSearchCondition }" />
								<c:param name="productSearchValue"
									value="${ productSearchValue }" />
							</c:if>
						</c:url>
						<a href="${ after1 }">[다음]</a>
					</c:if>
				</div>

				<div class="div2">
					<select id="productSearchCondition" name="productSearchCondition">
						<!-- 검색 컬럼 -->
						<option value="선택">선택</option>
						<option value="웜룸">원룸</option>
						<option value="투룸">투룸</option>
						<option value="쓰리룸">쓰리룸</option>
					</select> <input type="search" id="productSearchValue"
						value="${productSearchValue}" placeholder="검색어를 입력하세요">
					<button onclick="searchProduct(this);">검색</button>
					<input type="hidden" id="id1" value="${ us_id }">
				</div>

				<script type="text/javascript">
					// 매물 검색
					function searchProduct(thisInfo) {
						var us_id = $(thisInfo).parent().children(":last")
								.val();
						var productSearchCondition = $(
								"#productSearchCondition").val();
						var productSearchValue = $("#productSearchValue").val();
						location.href = "goMemberDetailPage.me?productSearchCondition="
								+ productSearchCondition
								+ "&productSearchValue="
								+ productSearchValue
								+ "&us_id=" + us_id;
					}
				</script>
			</div>
			
			<table class="table1">
				<tr>
					<td colspan="5">댓글</td>
				</tr>
				<tr>
					<td style="width: 5%">no</td>
					<td>카테고리</td>
					<td>제목</td>
					<td>내용</td>
					<td>기능</td>
				</tr>
				<tr>
					<td>1</td>
					<td>중고 장터</td>
					<td>물건 팝니다.</td>
					<td>삽니다.</td>
					<td><input type="button" value="상세보기" onclick=""></td>
				</tr>
				<tr>
					<td>2</td>
					<td>매물 올리기</td>
					<td>집 올립니다.</td>
					<td>집 구조가 궁금합니다.</td>
					<td><input type="button" value="상세보기" onclick=""></td>
				</tr>
				<tr>
					<td>3</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>

			<div class="div2">
				<form action="<%=request.getContextPath()%>/search.no">
					<select name="opt">
						<!-- 검색 컬럼 -->
						<%-- 	    	<option value="all" <%= selectedOpt[0] %>>전체 목록</option> --%>
						<option value="">중고 장터</option>
						<option value="">매물 올리기</option>
					</select> <input type="text" name="" value="" placeholder="검색어를 입력하세요">
					<button type="submit">검색</button>
				</form>
			</div>
			<table class="table1">
				<tr>
					<td colspan="5">중고 장터</td>
				</tr>
				<tr>
					<td style="width: 5%">no</td>
					<td>카테고리</td>
					<td>상품명</td>
					<td>가격</td>
					<td>기능</td>
				</tr>
				<tr>
					<td>1</td>
					<td>게임/취미</td>
					<td>a90</td>
					<td>5000원</td>
					<td><input type="button" value="상세보기" onclick=""></td>
				</tr>
				<tr>
					<td>1</td>
					<td>디지털/가전</td>
					<td>노트북</td>
					<td>100000원</td>
					<td><input type="button" value="상세보기" onclick=""></td>
				</tr>
				<tr>
					<td>3</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>

			<table class="table1">
				<tr>
					<td colspan="4">1대1문의하기</td>
				</tr>
				<tr>
					<td style="width: 5%">no</td>
					<td style="width: 30%">제목</td>
					<td>내용</td>
					<td>기능</td>
				</tr>
				<tr>
					<td>1</td>
					<td>질문</td>
					<td>질문이에요.</td>
					<td><input type="button" value="상세보기" onclick=""></td>
				</tr>
				<tr>
					<td>2</td>
					<td>질문2</td>
					<td>질문이에요2</td>
					<td><input type="button" value="상세보기" onclick=""></td>
				</tr>
				<tr>
					<td>3</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<!-- 		<script type="text/javascript">
				function topList(){
					$.ajax({
						url:'',
						success: function(data){
							$tableBody = $('#tb tbody');
							$tableBody.html('');
							
							for(var i in data){
								var $tr = $('<tr>');
								var $ = $('<td>').text(data[i].);
								var $ = $('<td>').text(data[i].);
								var $ = $('<td>').text(data[i].);
								var $ = $('<td>').text(data[i].);
								var $ = $('<td>').text(data[i].);
								
								if(data[i].originalFileName != null){
									$bFile = $('<td>').text("O");
								}
								
								$tr.append($);
								$tr.append($);
								$tr.append($);
								$tr.append($);
								$tr.append($);
								$tableBody.append($tr);
							}
						}
					});
				}
			</script> -->
			<div class="div2">
				<form action="<%=request.getContextPath()%>/search.no">
					<select name="opt">
						<!-- 검색 컬럼 -->
						<%-- 	    	<option value="all" <%= selectedOpt[0] %>>전체 목록</option> --%>
						<option value="">디지털/가전</option>
						<option value="">가구/인테리어</option>
						<option value="">유아동/유아도서</option>
						<option value="">생활/가공식품</option>
						<option value="">스포츠/레저</option>
						<option value="">여성잡화</option>
						<option value="">여성의류</option>
						<option value="">남성패션/잡화</option>
					</select> <input type="text" name="" value="" placeholder="검색어를 입력하세요">
					<button type="submit">검색</button>
				</form>
			</div>
			<div class="div2">
				<form action="<%=request.getContextPath()%>/search.no">
					<select name="opt">
						<!-- 검색 컬럼 -->
						<%-- 	    	<option value="all" <%= selectedOpt[0] %>>전체 목록</option> --%>
						<option value="">제목</option>
					</select> <input type="text" name="" value="" placeholder="검색어를 입력하세요">
					<button type="submit">검색</button>
				</form>
			</div>
		</div>
		<br style="clear: both"> <input type="button" value="뒤로가기"
			onclick="history.back(-1);">
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
		/*    // 매물 상세페이지 이동 (수환이형이 만듬. 합치면 완성될듯) 수정.
		 function goDetailPage(thisInfo){
		 var us_id = $(thisInfo).parent().children(":last").val();
		 location.href = "searchRoomDetailPage.search?us_id=" + us_id;
		 } */
	</script>
</body>
</html>