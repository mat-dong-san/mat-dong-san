<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
   background: rgb(55, 55, 55);
   margin-top: 30px;
   color: rgb(160, 160, 160);
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

.mypageInfoIndexTitle {
   padding-top: 40px;
   margin: 20px auto;
   width: 1140px;
   margin-top: 50px;
   font-size: 50px;
   height: 40px;
   border-top: 1px solid rgb(204, 204, 204);
}

.productContent{
    display: inline-flex;
    width: 180px;
    border: 1px solid black;
    height: 250px;
    margin: 15px;
    float:left;
    flex-direction: column;
}

.productContent:hover{
	cursor: pointer;
}
#contentContainer{
	border: 4px solid grey;
	width : 1060px;
	height: 580px;
	margin: 0px auto;
}

}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:include page="../common/menubar.jsp"/> --%>
	<div>
		<h2 style="text-alight: center">매물 정보</h2>

		<div id="contentContainer">
			<c:forEach var="pa" items="${list}">
				<div class="productContent" onclick="goProductDetailPage(this)"
					style="text-align: left;">
					<img class="ProductImg" alt="${fn:split(pa.p_picture,'/')[0]}"
						src="resources/images/${ pa.us_id }/${ pa.p_id }/${fn:split(pa.p_picture,'/')[0]}">
					<span style="font-weight: bold;">${ fn:substringAfter(pa.p_content, '///')}</span>
					<span>${ pa.p_kind } / ${ pa.p_deal } : <c:if
							test="${ pa.p_deal == '월세'}">
							<span>[${ pa.p_deposit} / ${ pa.p_rent}] </span>
						</c:if> <c:if test="${ pa.p_deal == '전세'}">
							<span>[${ pa.p_charter }]</span>
						</c:if></span> <span>${ fn:substring(pa.p_addr,0,20)}</span> <input
						type="hidden" value="${ pa.p_id }">
				</div>
			</c:forEach>
		</div>
		<div>
			<!-- [이전] -->
			<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="goEstateAgentDetailPage.me">
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
						<c:url var="pagination" value="goEstateAgentDetailPage.me">
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
				<c:url var="after" value="goEstateAgentDetailPage.me">
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
			// 관리자-회원상세 페이지-매물상세 페이지 이동
			function goProductDetailPage(thisInfo) {
				var p_id = $(thisInfo).parent().children(":last").val();
				location.href = "goMemberDetailPage.me?p_id=" + p_id;
			}
		</script>

		<select id="searchCondition" name="searchCondition">
			<!-- 검색 컬럼 -->
			<option value="선택">선택</option>
			<option value="원룸">원룸</option>
			<option value="투룸">투룸</option>
			<option value="쓰리룸">쓰리룸</option>
		</select> <input type="search" id="searchValue" value="${searchValue}"
			placeholder="검색어를 입력하세요">
		<button onclick="searchMember();">검색하기</button>
		<script type="text/javascript">
			// 검색
			function searchMember() {
				var e_id = $("#e_id").val();
				var us_id = $("#us_id").val();
				var searchCondition = $("#searchCondition").val();
				var searchValue = $("#searchValue").val();
				location.href = "goEstateAgentDetailPage.me?searchCondition="
						+ searchCondition + "&searchValue=" + searchValue;
				 
				
			}
		</script>
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