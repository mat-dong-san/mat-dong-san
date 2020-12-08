<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

.pagingArea { clear:both; }
.pagingArea { /* 기본페이지 */
	
    height:19px !important;
    font-size:13px;
    color:#333;
    line-height:33px;
    padding:0;
    background:#fff;
    border:0;
    border-radius:2px;
    -moz-border-radius:2px;
    -webkit-border-radius:2px;
    text-align:center;
    display:inline-block;
}
.pg_current { /* 현재페이지 */
    width:30px !important;
    height:30px !important;
    font-size:13px;
    font-weight:bold;
    line-height:33px;
    margin:0;
    padding:0;
    color: white;
    background:#F2F2F2;
    border:0;
    border-radius:2px;
    -moz-border-radius:2px;
    -webkit-border-radius:2px;
    text-align:center;
    display:inline-block;
}
.pg_current:hover { 
    background:#999;
}
.pg_prev { /* 이전 */
    position:relative;
    top:50%;
    width:28px !important;
    height:28px !important;
    background:#fff;
    border:1px solid #ccc;
    border-radius:2px;
    -moz-border-radius:2px;
    -webkit-border-radius:2px;
    text-indent:-9999px;
    display:inline-block;
}
.pg_prev:after {
    position:absolute;
    top:10px;
    left:13px;
    content:"";
    width:6px;
    height:6px;
    border-top:1px solid transparent;
    border-right:1px solid transparent;
    border-bottom:1px solid #777;
    border-left:1px solid #777;
    transform:rotate(45deg);
}
.pg_prev:hover {
    background:#fff;
    border:1px solid #333;
}
.pg_next { /* 다음 */
    position:relative;
    top:50%;
    width:28px !important;
    height:28px !important;
    background:#fff;
    border:1px solid #ccc;
    border-radius:2px;
    -moz-border-radius:2px;
    -webkit-border-radius:2px;
    text-indent:-9999px;
    display:inline-block;
}
.pg_next:after {
    position:absolute;
    top:10px;
    right:13px;
    content:"";
    width:6px;
    height:6px;
    border-top:1px solid #777;
    border-right:1px solid #777;
    border-bottom:1px solid transparent;
    border-left:1px solid transparent;
    transform:rotate(45deg);
}
.pg_next:hover {
    background:#fff;
    border:1px solid #333;
}
#searchCondition {
	width: 100px;
	height: 20px;
	padding-left: 5px;
	font-size: 15px;
	color: gray;
	border: 1px solid white;
	border-right: 1px solid silver;

}
.searchButton {
	outline: 0;
	border: 0;
	height: 45px;
	width: 70px;
	border-left: 1px solid silver;
}
.searchInput {
	outline: 0;
	border: 0;
	margin-left: 11px;
	width: 180px;
	height: 40px;
}
.searchDiv {
	border: 1px solid silver;
	margin: 0 auto;
	width: 377px;
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
#tr:hover {
	background-color: silver;
}
#tr2:hover {
	background-color: silver;
}

#back:hover {
	background-color: silver;
}

a {
	color: #333;
	text-decoration: none;
	cursor: pointer;
}


.txt-1 {
	letter-spacing: -0.5px;
	color: #333;
	height: 32px;
	border-top: 1px solid #ddd;
	/*     border-bottom: 1px solid #ddd; */
	text-align: center;
	padding: 0 16px;
	padding-top: 20px;
	padding-bottom: 20px;
	white-space: nowrap;
	font-weight: normal;
	font-size: 1.0em;
	width: 100px;
}

.txt-2 {
	letter-spacing: -0.5px;;
	color: #333;
	height: 32px;
	border-top: 1px solid #ddd;
	/*     border-bottom: 1px solid #ddd; */
	text-align: left;
	padding: 0 16px;
	padding-top: 10px;
	padding-bottom: 10px; white-space : nowrap;
	font-weight: normal;
	width: 100%;
	white-space: nowrap;
	font-size: 1.0em;
	/*     display: inline-block; */
	/*     vertical-align: middle; */
}
.txt-3 {
	letter-spacing: -0.5px;;
	color: #333;
	height: 32px;
	border-top: 1px solid #ddd;
	/*     border-bottom: 1px solid #ddd; */
	text-align: left;
	padding: 0 24px;
	padding-top: 10px;
	padding-bottom: 10px; white-space : nowrap;
	font-weight: normal;
	white-space: nowrap;
	font-size: 1.0em;
	/*     display: inline-block; */
	/*     vertical-align: middle; */
}
.txt-4 {
	letter-spacing: -0.5px;
	color: #333;
	height: 32px;
	border-top: 1px solid #ddd;
	/*     border-bottom: 1px solid #ddd; */
	text-align: center;
	padding: 0 16px;
	padding-bottom: 4px;
	padding-top: 4px;
	white-space: nowrap;
	font-weight: bold;
	font-size: 1.4em;
	width: 400px;
	height: 360px;
}
#txt-2 {
	display: block;
	padding-top: 7px;
}

.txt-h {
	letter-spacing: -0.5px;
	color: #ddd;
}

.txt {
	min-height: 19px;
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

#headTable th {
	font-weight: 700;
	margin-bottom
	:
	50px;
}
	#headTable

	th
{
	font-weight
	:
	700;
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
	width: 100%;
	height: 600px;
	padding-bottom: 50px;
	z-index: 1;
}

#m_div3 {
	width: 100%;
	height: 600px;
	padding-bottom: 50px;
	z-index: 2;
}

textarea {
	border-color: silver;
	border-width: 2px;
	width: 1080px;
	height: 440px;
}
#p_id2{
	text-decoration: underline;

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
			<div onclick='location.href="mypageView.es"'>정보수정</div>
			<div onclick='location.href="estateMypageContacted.es"'>쪽지함</div>
			<div onclick='location.href="estateMypageProperty.es"'>매물관리/신청</div>
		</div>

		<div id="b_m_wrapper">
			<div class="sub_wrapper">

				<div id="m_div2">
					<c:if test="${e eq '1'}">
						<br><br><br><br>
						<h1>등록한 중개사가없습니다 ಠ‸ಠ  </h1>
					</c:if>
					<c:if test="${e ne '1'}">
					<div class="table-1">
						
							<c:if test="${ empty list }">
							<table id="tb">
								<tr id="tr3">

									<th class="txt-1"><span>보낸이 </span></th>
									<th class="txt-2"><span>내용 </span></th>
									<th class="txt-1"><span>보낸날짜 </span></th>
									<th class="txt-1"><span>참고매물 </span></th>

								</tr>
							</table>
							<table id="tb">
								
									<tr id="tr">
										<th class="txt-4"><span></span></th>
										<th class="txt-4"><span>(c"ತ,_ತ) 쪽지가 없습니다  </span></th>
										<th class="txt-4"><span></span></th>
										
									</tr>
								
							</table>
							</c:if>
							<table id="tb">
								<c:if test="${ !empty list }">
									<tr id="tr3">

										<th class="txt-1"><span>보낸이 </span></th>	
										<th class="txt-2"><span>내용 </span></th>
										<th class="txt-1"><span>보낸날짜 </span></th>
										<th class="txt-1"><span>참고매물 </span></th>
	
									</tr>
									<c:forEach var="list" items="${ list }">
										<tr id="tr2">	
											
											<td class="txt-1">${ list.us_name }
												<input type="hidden" name="us_name" id="us_name" value="${ list.us_name }">
												<input type="hidden" name="us_phone" id="us_phone" value="${ list.us_phone }">
											</td>

											<td class="txt-2">
											<c:out value="${fn:substring(list.un_content, 0, 7)}"/><c:out value="..."/>
	       			 							
											<input type="hidden" name="un_content" id="un_content" value="${ list.un_content }">
											
											</td>
											<td class="txt-1">${ list.un_send_d }<input type="hidden" name="un_send_d" id="un_send_d" value="${ list.un_send_d }"></td>
											<td class="txt-1">${ list.p_id }<input type="hidden" name="p_id" id="p_id" value="${ list.p_id }"></td>
										</tr>
									</c:forEach>

								</c:if>
							</table>

					</div><br><br>
					<div class="pagingArea" align="center">
					
						<c:if test="${ searchValue eq null }">
							<c:set var="loc" value="/estateMypageContacted.es" scope="page"/>
						</c:if>
						<c:if test="${ searchValue ne null }">
							<c:set var="loc" value="/searchNote.es" scope="page"/>
						</c:if>
					
						<!--  이전 -->
						<c:if test="${ pi.currentPage <= 1 }">
							<div class="pg_prev"></div>
						</c:if>			
						<c:if test="${ pi.currentPage > 1 }">
							<c:url value="${ loc }" var="blistBack">
							<!-- loc : 현재 로케이션 -->
								<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
								
								<c:if test="${ searchValue ne null }" >
									<c:param name="searchCondition" value="${ searchCondition }" />
									<c:param name="searchValue" value="${ searchValue }" />
								</c:if>
								
								
							</c:url>
							<a class="pg_prev" href="${ blistBack }"></a>
						</c:if>			
					
						<!-- [이전][다음] -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<div class="pg_current" style="color: #white; background:#999;">${ p }</div>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="blistCheck" value="${ loc }">
									<c:param name="currentPage" value="${ p }"/>
			
									
									<!-- 검색 페이징 -->
									<c:if test="${ searchValue ne null }" >
										<c:param name="searchCondition" value="${ searchCondition }" />
										<c:param name="searchValue" value="${ searchValue }" />
									</c:if>
									
								</c:url>
								<a class="pg_current" href="${ blistCheck }" style="color: #444;">${ p }</a>
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<div class="pg_next"></div>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url value="${ loc }" var="blistNext">
								<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
								
								<!-- 검색 페이징 -->
								<c:if test="${ searchValue ne null }" >
									<c:param name="searchCondition" value="${ searchCondition }" />
									<c:param name="searchValue" value="${ searchValue }" />
								</c:if>
								
								
							</c:url>
							<a class="pg_next" href="${ blistNext }"></a>
						</c:if>	
					
					</div>
					<br><br>
					<div id="searchArea" align="center">
						<div class="searchDiv">
							<select id="searchCondition" name="searchCondition">
								<option>-------</option>
								<option value="us_name">보낸이</option>
								<option value="p_id">매물번호</option>
							</select>
							<input id="searchValue" class="searchInput" name="searchInput" type="text" placeholder="쪽지검색" value="${searchValue}">
							<input class="searchButton" type="button" onclick="searchBoard();" value="검색">
							
						</div>
							
					</div>
					</c:if>
					<script type="text/javascript">
						function searchBoard(){
							var searchCondition = $("#searchCondition").val();
							var searchValue = $("#searchValue").val();
							location.href="searchNote.es?searchCondition="+searchCondition+"&searchValue="+searchValue;
						}
					</script>

				</div>
				<div id="m_div3">
					<div class="table-1">
						
						<table>
							<tr>
								<td class="txt-1"><p id="us_name2"></p></td>
								
								<th class="txt-1"><p id="us_phone2"></p></th>
								
								<th class="txt-1"></th>
								<th class="txt-1"></th>
								<th class="txt-1"></th>
								<th class="txt-1"></th>
							
								<th class="txt-1"><p id="un_send_d2"></th>
								<td class="txt-1"><a href="#" id="p_id2">참고매물</a></td>	
							
								
							</tr>
							
						</table>
						<table>
							<tr>
								<td class="txt-3"><textarea name="content" id="un_content2" rows="5" cols="33" style="font-size: 16px;" readonly></textarea></td>
							</tr>
							<tr>
								<td class="txt-1" id="back"><span>뒤로가기 </span></td>
							</tr>
							
						</table>
						
						
						

					</div>
				
				
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
	
		$("#tb").children().children().children('td').click(function() {
			
			$('#m_div2').css('display', 'none');
			$('#m_div3').css('display', 'block');
			
			var us_name = $(this).parent().children().children('#us_name').val();
			var us_phone = $(this).parent().children().children('#us_phone').val();
			var un_content = $(this).parent().children().children('#un_content').val();
			var un_send_d = $(this).parent().children().children('#un_send_d').val();
			var p_id = $(this).parent().children().children('#p_id').val();
			
			var un_content2 = un_content.replace(/<br>/g, "\n");
			$('#us_name2').text('보낸이 : ' + us_name);
			$('#us_phone2').text('전화번호 : ' + us_phone);
			$('#un_content2').val(un_content2);
			$('#un_send_d2').text('날짜 : ' + un_send_d);
			$("#p_id2").attr("href", "productDetail.pr?p_id="+p_id);
			
		});
		
		$("#back").click(function() {
			$('#m_div2').css('display', 'block');
			$('#m_div3').css('display', 'none');
			
		});
		
	</script>
</body>
</html>