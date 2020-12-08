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
#ca_btn {
	font-weight: bold;
	outline: none;
	color: white;
   	background: rgb(21 100 249/ 88%);
	padding: 5px 9px;
	color: white;
	border-radius: 5px;
}
#acBtn {
	font-weight: bold;
	outline: none;
	color: white;
   	background: rgb(21 100 249/ 88%);
	padding: 5px 9px;
	color: white;
	border-radius: 5px;
}
#caBtn {
	font-weight: bold;
	outline: none;
	color: white;
   	background: rgb(21 100 249/ 88%);
	padding: 5px 9px;
	color: white;
	border-radius: 5px;
}
#ca_btn:hover {
	background:#555;
}
#acBtn:hover {
	background:#555;
}
#caBtn:hover {
	background:#555;
}
#searchCondition2 {
	width: 100px;
	height: 20px;
	padding-left: 5px;
	font-size: 15px;
	color: gray;
	border: 1px solid white;
	border-right: 1px solid silver;
}
.searchButton2 {
	outline: 0;
	border: 0;
	height: 35px;
	width: 70px;
	margin-left: 12px;
	border-left: 1px solid silver;
}
.searchInput2 {
	outline: 0;
	border: 0;
	margin-left: 10px;
	width: 127px;
	height: 30px;
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
	height: 35px;
	width: 70px;
	margin-left: 8px;
	border-left: 1px solid silver;
}

.searchInput {
	outline: 0;
	border: 0;
	margin-left: 3px;
	width: 127px;
	height: 30px;
}

.searchDiv {
	border: 1px solid silver;
	margin: 0 auto;
	width: 324px;
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
}
.sub_wrapper {
	margin-top: 20px;
	border-top: 1px solid rgb(204, 204, 204);
	display: flex;
}
a {
	color: #333;
	text-decoration: none;
	cursor: pointer;
	font-weight: bold;
}
.txt-1 {
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
	padding-top: 4px;
	padding-bottom: 4px;
	white-space: nowrap;
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
	padding-bottom: 10px;
	white-space: nowrap;
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
	width: 300px;
	height: 240px;
}
.txt-5 {
	letter-spacing: -0.5px;
	color: #333;
	height: 32px;
	border-top: 1px solid #ddd;
	/*     border-bottom: 1px solid #ddd; */
	text-align: left;
	padding: 0 16px;
	padding-bottom: 4px;
	padding-top: 4px;
	white-space: nowrap;
	font-weight: normal;
	font-size: 1.0em;
	width: 500px;
}
#txt-2 {
	display: block;
	padding-top: 7px;
}
.txt-h {
	letter-spacing: -0.5px;
	font: 14px;
	color: #ddd;
}
.table-1 {
	margin-top: 10px;
}
#headd {
	padding-top: 500px;
	margin-right: 20px;
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

.fileBox {
	text-align: center;
	margin: 5px auto;
}

#goBoard {
	padding: 20px;
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
	height: 600px;
}

#m_div3 {
	width: 75%;
	height: 600px;
	padding-bottom: 50px;
	z-index: 2;
}

#m_div4 {
	width: 75%;
	padding-bottom: 50px;
	z-index: 3;
	height: 600px;
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
	width: 250px;
	border: 1px solid silver;
	border-radius: 10px;
	font-size: 2em;
}

#p_picture {
	width: 90px;
	height: 90px;
}

#tr:hover {
	background-color: silver;
}

#tr2:hover {
	background-color: silver;
}

textarea {
	border-color: silver;
	border-width: 2px;
	width: 800px;
	height: 240px;
}

#back:hover {
	background-color: silver;
}

#p_id2 {
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
				<div id="m_div1">
					<div id="side_area" class="go_content1">
						<div class="sidebar_box fstbox" id="estateProperty">매물관리</div>
						<div class="sidebar_box fstbox" id="estateApplication">매물신청</div>

					</div>
				</div>

				<div id="m_div2">
					<c:if test="${e eq '1'}">
							<br><br><br><br>
						<h1>등록한 중개사가없습니다 ಠ‸ಠ  </h1>
					</c:if>
					<c:if test="${e ne '1'}">
					<div id="center">
						<div id="C_area">
							<h2>
								<font id="headd">매물관리</font>
							</h2>
						</div>
					</div>
					<div class="table-1">
						
							<c:if test="${ empty list }">
							<table id="tb">
								<tr id="tr">
									<th class="txt-1"><span>매물</span></th>
									<th class="txt-5"><span>관리내용 </span></th>
									<th class="txt-1"><span>유형 </span></th>
									<th class="txt-1"><span>종류</span></th>
									<th class="txt-1"><span>등록날짜</span></th>
									<th class="txt-1"><span>관리</span></th>
								</tr>
							</table>
							<table id="tb">
									
									<tr id="tr">
										<th class="txt-4"><span></span></th>
										<th class="txt-4"><span>(c"ತ,_ತ) 매물 리스트가 없습니다 </span></th>
										<th class="txt-4"><span></span></th>
										
									</tr>
							</table>
							</c:if>
							<c:if test="${ !empty list }">
							<table id="tb">

									<tr id="tr">

											<th class="txt-1"><span>매물</span></th>
											<th class="txt-5"><span>관리내용 </span></th>
											<th class="txt-1"><span>유형 </span></th>
											<th class="txt-1"><span>종류</span></th>
											<th class="txt-1"><span>등록날짜</span></th>
											<th class="txt-1"><span>관리</span></th>
										</tr>
									<c:forEach var="list" items="${ list }">
										
										<tr id="tr">	
											
											
											<td class="txt-1">${ list.p_id }
												<input type="hidden" name="a_id" id="a_id" value="${ list.a_id }">
												<input type="hidden" name="a_status" id="a_status" value="${ list.a_status }">
												<input type="hidden" name="a_date" id="a_date" value="${ list.a_date }">
												<input type="hidden" name="p_id" id="p_id" value="${ list.p_id }">
												<input type="hidden" name="pr_id" id="pr_id" value="${ list.pr_id }">
												<input type="hidden" name="e_id" id="e_id" value="${ list.e_id }">
												<input type="hidden" name="p_addr" id="p_addr" value="${ list.p_addr }">
												<input type="hidden" name="p_field" id="p_field" value="${ list.p_field }">
												<input type="hidden" name="p_floor" id="p_floor" value="${ list.p_floor }">
												<input type="hidden" name="p_size" id="p_size" value="${ list.p_size }">
												<input type="hidden" name="p_str" id="p_str" value="${ list.p_str }">
												<input type="hidden" name="p_kind" id="p_kind" value="${ list.p_kind }">
												<input type="hidden" name="p_room" id="p_room" value="${ list.p_room }">
												<input type="hidden" name="p_s_size" id="p_s_size" value="${ list.p_s_size }">
												<input type="hidden" name="p_d_size" id="p_d_size" value="${ list.p_d_size }">
												<input type="hidden" name="p_layer" id="p_layer" value="${ list.p_layer }">
												<input type="hidden" name="p_deal" id="p_deal" value="${ list.p_deal }">
												<input type="hidden" name="p_charter" id="p_charter" value="${ list.p_charter }">
												<input type="hidden" name="p_rent" id="p_rent" value="${ list.p_rent }">
												<input type="hidden" name="p_deposit" id="p_deposit" value="${ list.p_deposit }">
												<input type="hidden" name="p_cost" id="p_cost" value="${ list.p_cost }">
												<input type="hidden" name="p_cost_item" id="p_cost_item" value="${ list.p_cost_item }">
												<input type="hidden" name="p_en_d" id="p_en_d" value="${ list.p_en_d }">
												<input type="hidden" name="p_content" id="p_content" value="${ list.p_content }">
												<input type="hidden" name="p_heat" id="p_heat" value="${ list.p_heat }">
												<input type="hidden" name="p_dir" id="p_dir" value="${ list.p_dir }">
												<input type="hidden" name="p_park" id="p_park" value="${ list.p_park }">
												<input type="hidden" name="p_elevator" id="p_elevator" value="${ list.p_elevator }">
												<input type="hidden" name="p_verandar" id="p_verandar" value="${ list.p_verandar }">
												<input type="hidden" name="p_pet" id="p_pet" value="${ list.p_pet }">
												<input type="hidden" name="p_built_in" id="p_built_in" value="${ list.p_built_in }">
												<input type="hidden" name="p_option" id="p_option" value="${ list.p_option }">
												<input type="hidden" name="p_picture" id="p_picture" value="${ list.p_picture }">
												<input type="hidden" name="p_reg_d" id="p_reg_d" value="${ list.p_reg_d }">
												<input type="hidden" name="p_reg_status" id="p_reg_status" value="${ list.p_reg_status }">
												<input type="hidden" name="p_del_yn" id="p_del_yn" value="${ list.p_del_yn }">
												<input type="hidden" name="us_id" id="us_id" value="${ list.us_id }">
												<input type="hidden" name="us_name" id="us_name" value="${ list.us_name }">
												<input type="hidden" name="us_phone" id="us_phone" value="${ list.us_phone }">
												<input type="hidden" name="us_email" id="us_email" value="${ list.us_email }">
												<input type="hidden" name="us_picture" id="us_picture" value="${ list.us_picture }">
											</td>
											
											<td class="txt-5"><c:out value="${fn:substring(list.p_content, 0, 20)}"/><c:out value="....."/></td>
											<td class="txt-1">${ list.p_field }</td>
											<td class="txt-1">${ list.p_kind }</td>
											<td class="txt-1">${ list.p_reg_d }</td>
											<th class="txt-1"><input type="button" id="ca_btn" value="취소"></th>
										</tr>
									</c:forEach>

							</table>
							</c:if>

					</div><br><br>
					<div class="pagingArea" align="center">
					
						<c:if test="${ searchValue eq null }">
							<c:set var="loc" value="/estateMypageProperty.es" scope="page"/>
						</c:if>
						<c:if test="${ searchValue ne null }">
							<c:set var="loc" value="/searchProperty.es" scope="page"/>
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
								<option value="p_id">매물번호</option>
								<option value="p_field">유형</option>
								<option value="p_kind">종류</option>
							</select>
							<input id="searchValue" class="searchInput" name="searchInput" type="text" placeholder="매물검색" value="${searchValue}">
							<input class="searchButton" type="button" onclick="searchBoard();" value="검색">
							
						</div>
					</div>
					</c:if>
					<script type="text/javascript">
						function searchBoard(){
							var searchCondition = $("#searchCondition").val();
							var searchValue = $("#searchValue").val();
							location.href="searchProperty.es?searchCondition="+searchCondition+"&searchValue="+searchValue;
						}
					</script>
				</div>
				
				<div id="m_div3">
					<div id="center">
							<div id="C_area">
								<h2>
									<font id="headd">매물</font>
								</h2>
							</div>
						</div>
					<div class="table-1">
						<table>
							<tr>
								<td class="txt-1"><p id="us_name2"></p></td>
								<td class="txt-1"><p id="us_phone2"></p></td>
								<td class="txt-1"><p id="us_email2"></p></td>
								<td class="txt-1"><p id="p_reg_d2"></p></td>
								<td class="txt-1"></td>
								
							</tr>
						</table>
						<table>
							<tr>	
								<td class="txt-1"><p id="p_addr2"></p></td>
								<td class="txt-1"></td>
								<td class="txt-1"></td>
								<td class="txt-1"></td>
								<td class="txt-1"></td>
								<td class="txt-1"></td>
								
							</tr>
						</table>
						<table>
							<tr>
								<td class="txt-1"><p id="p_field2"></p></td>
								<td class="txt-1"><p id="p_str2"></p></td>
								<td class="txt-1"><p id="p_kind2"></p></td>
								<td class="txt-1"><p id="p_deal2"></p></td>
								<td class="txt-2"></td>
								<td class="txt-1"><a href="#" id="p_id2">매물상세정보</a></td><td class="txt-1"></td><td class="txt-1"></td>	
							</tr>
						</table>
						<table>
							<tr>
								<td class="txt-3"><textarea name="content" id="p_content2" rows="5" cols="33" style="font-size: 16px;" readonly></textarea></td>
							</tr>
							<tr>
								<td class="txt-1" id="back"><span>뒤로가기 </span></td>
							</tr>
							
						</table>
						
					</div>
				
				</div>
				
				<div id="m_div4">
					
				
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
	
		var searchCondition = "";
		var searchValue = "";
		var currentPage = 1;
		var back = 0;
		
		$(document).ready(function() {
			$('#m_div3').css('display', 'none');
			$('#m_div4').css('display', 'none');
		});

		$("#estateProperty").click(function() {
			location.href="estateMypageProperty.es";

		});
			
		$("#tb").children().children().children('td').click(function() {
			
			var us_name = $(this).parent().children().children('#us_name').val();
			var us_phone = $(this).parent().children().children('#us_phone').val();
			var us_email = $(this).parent().children().children('#us_email').val();
			var p_addr = $(this).parent().children().children('#p_addr').val();
			var p_field = $(this).parent().children().children('#p_field').val();
			var p_kind = $(this).parent().children().children('#p_kind').val();
			var p_deal = $(this).parent().children().children('#p_deal').val();
			var p_str = $(this).parent().children().children('#p_str').val();
			var p_reg_d = $(this).parent().children().children('#p_reg_d').val();
			var p_id = $(this).parent().children().children('#p_id').val();
			var p_content = $(this).parent().children().children('#p_content').val();
			
			if(p_id != ""){
				$('#m_div2').css('display', 'none');
				$('#m_div3').css('display', 'block');
			}
			
			var p_content2 = p_content.replace(/<br>/g, "\n");
			
			$('#us_name2').text('매물주 : ' + us_name);
			$('#us_phone2').text('전화번호 : ' + us_phone);
			$('#us_email2').text('이메일 : ' + us_email);
			$('#p_addr2').text('위치 : ' + p_addr);
			$('#p_field2').text('유형 : ' + p_field);
			$('#p_kind2').text('종류 : ' + p_kind);
			$('#p_str2').text('구조 : ' + p_str);
			$('#p_deal2').text('거래 : ' + p_deal);
			$('#p_reg_d2').text('등록날짜 : ' + p_reg_d);
			$("#p_id2").attr("href", "productDetail.pr?p_id="+p_id);
			$('#p_content2').val(p_content2);
			back = 0;
			
		});
		
		$("#back").click(function() {
			if(back == 0){
				$('#m_div2').css('display', 'block');
				$('#m_div3').css('display', 'none');
			}else {
				$('#m_div4').css('display', 'block');
				$('#m_div3').css('display', 'none');
			}
		
		});
		
		
		$(document).on('click', '#tr2 td:not(:nth-last-child(1))', function(){
			
			var p_id = $(this).parent().children().children('#p_id3').val();
			var p_addr = $(this).parent().children().children('#p_addr3').val();
			var p_content = $(this).parent().children().children('#p_content3').val();
			var p_field = $(this).parent().children().children('#p_field3').val();
			var p_deal = $(this).parent().children().children('#p_deal3').val();
			var p_str = $(this).parent().children().children('#p_str3').val();
			var p_kind = $(this).parent().children().children('#p_kind3').val();
			var p_reg_d = $(this).parent().children().children('#p_reg_d3').val();
			var us_name = $(this).parent().children().children('#us_name3').val();
			var us_email = $(this).parent().children().children('#us_email3').val();
			var us_phone = $(this).parent().children().children('#us_phone3').val();
			var p_content2 = p_content.replace(/<br>/g, "\n");
			$('#us_name2').text('매물주 : ' + us_name);
			$('#us_phone2').text('전화번호 : ' + us_phone);
			$('#us_email2').text('이메일 : ' + us_email);
			$('#p_addr2').text('위치 : ' + p_addr);
			$('#p_field2').text('유형 : ' + p_field);
			$('#p_kind2').text('방 : ' + p_kind);
			$('#p_str2').text('구조 : ' + p_str);
			$('#p_deal2').text('거래 : ' + p_deal);
			$('#p_reg_d2').text('등록날짜 : ' + p_reg_d);
			$("#p_id2").attr("href", "productDetail.pr?p_id="+p_id);
			$('#p_content2').val(p_content2);
			$('#m_div2').css('display', 'none');
			$('#m_div4').css('display', 'none');
			$('#m_div3').css('display', 'block');
			back = 1;	
			
			
		});
		
		$(document).on('click', '#acBtn, #caBtn', function(){
			
			var id = $(this).attr('id');
			
			if(id == "acBtn") {
				var a_id = $(this).attr('a_id');
				var p_id = $(this).attr('p_id');
				if (confirm("수락하시겠습니까?") == true){
					$.ajax({
						url: 'acceptApplication.es',
						data: {a_id:a_id, p_id:p_id},
						success: function(data) {
							console.log(data);
							if(data == 1) {
								alert('수락되었습니다');
								estateApplication(currentPage, searchCondition, searchValue);
								
							}
						}
					});
					   
				}else{
					return false;
				}
				
			}else if(id == "caBtn") {
				var a_id = $(this).attr('a_id');
				var p_id = $(this).attr('p_id');
				if (confirm("취소하시겠습니까?") == true){
					$.ajax({
						url: 'cancelApplication.es',
						data: {a_id:a_id, p_id:p_id},
						success: function(data) {
							console.log(data);
							if(data == 1) {
								alert('취소되었습니다');
								estateApplication(currentPage, searchCondition, searchValue);
								
							}
						}
					});
					   
				}else{
					return false;
					     
				}
			}
		});
		
		function searchBoard2(){
			var searchCondition2 = $("#searchCondition2").val();
			var searchValue2 = $("#searchValue2").val();
			searchCondition = searchCondition2;
			searchValue = searchValue2;
			estateApplication(currentPage, searchCondition, searchValue);
			
		}
		
		
		$("#tb").children().children().children().children('#ca_btn').click(function() {
			var p_id = $(this).parent().parent().children().children('#p_id').val();
			var a_id = $(this).parent().parent().children().children('#a_id').val();
			
			if (confirm("관리취소하시겠습니까?") == true){
				  $.ajax({
						url: 'cancelProperty.es',
						data: {p_id:p_id, a_id:a_id},
						success: function(data) {
							console.log(data);
							if(data == 1) {
								alert('취소되었습니다');
								location.reload();
								
							}
						}
				  });
				   
			 }else{
				   return false;
				     
			 }
			
		});
		
		
		$("#estateApplication").click(function() {
			$('#m_div2').css('display', 'none');
			$('#m_div3').css('display', 'none');
			$('#m_div4').css('display', 'block');
			currentPage = 1;
			estateApplication(currentPage, '', '');
			
			
		});
		
		
		
		function estateApplication(page, searchCondition, searchValue) {
			var path = '${pageContext.request.contextPath}';
			var testEval = "";
			$.ajax({
				url: 'estateApplication.es',
				data: {page:page, searchCondition:searchCondition, searchValue:searchValue},
				success: function(data) {
					console.log(data);
					
					if(data == "1") {
					
						testEval +='<br><br><br><br><h1>등록한 중개사가없습니다 ಠ‸ಠ  </h1>';
						
					}else if(data.pi.listCount == 0) {

						testEval +='<div id="center"><div id="C_area"><h2><font id="headd">매물신청</font></h2></div></div>';
						testEval +='<div class="table-1"><table id="tb"><tr id="tr"><th class="txt-1"><span>매물</span></th><th class="txt-5"><span>관리내용 </span></th><th class="txt-1"><span>유형 </span></th>';
						testEval +='<th class="txt-1"><span>종류</span></th><th class="txt-1"><span>등록날짜</span></th><th class="txt-1"><span>신청</span></th></tr></table>';
						testEval +='<table id="tb2"><tr id="tr"><th class="txt-4"><span></span></th><th class="txt-4"><span>(c"ತ,_ತ) 신청 리스트가 없습니다</span></th><th class="txt-4"><span></span></th></tr></table></div>';
						testEval +='<br><br><div class="pagingArea" align="center"><div class="pg_prev"></div>&nbsp;<div class="pg_current" style="background:#999;">1</div>&nbsp;<div class="pg_next"></div></div>';
						testEval +='<br><br><div id="searchArea" align="center"><div class="searchDiv"><select id="searchCondition2" name="searchCondition2">';
						testEval +='<option>-------</option><option value="p_id">매물번호</option><option value="p_field">유형</option><option value="p_kind">종류</option></select>';
						testEval +='<input id="searchValue2" class="searchInput2" name="searchInput" type="text" placeholder="매물검색" value="">';
						testEval +='<input class="searchButton2" type="button" onclick="searchBoard2();" value="검색"></div></div>';
						
					}else {
						$.each(data, function(key, value) {
							
							if(key == "estateApplication" && key.listCount != 0) {

								testEval +='<div id="center"><div id="C_area"><h2><font id="headd">매물신청</font></h2></div></div>';
								testEval +='<div class="table-1"><table id="tb2"><tr id="tr">';
								testEval +='<th class="txt-1"><span>매물</span></th><th class="txt-5"><span>관리내용 </span></th><th class="txt-1"><span>유형 </span></th>';
								testEval +='<th class="txt-1"><span>종류</span></th><th class="txt-1"><span>등록날짜</span></th><th class="txt-1"><span>신청</span></th></tr>';
								
								for (var i = 0; i < value.length; i++) {
									
									
									testEval += '<tr id="tr2"><td class="txt-1">'+ value[i].p_id +'<input type="hidden" id="p_id3" value="'+ value[i].p_id +'"><input type="hidden" id="p_addr3" value="'+ value[i].p_addr +'"><input type="hidden" id="p_content3" value="'+ value[i].p_content +'"><input type="hidden" id="p_field3" value="'+ value[i].p_field +'"><input type="hidden" id="p_deal3" value="'+ value[i].p_deal +'">';
									testEval += '<input type="hidden" id="p_str3" value="'+ value[i].p_str +'"><input type="hidden" id="p_kind3" value="'+ value[i].p_kind +'"><input type="hidden" id="p_reg_d3" value="'+ value[i].p_reg_d +'"><input type="hidden" id="us_name3" value="'+ value[i].us_name +'"><input type="hidden" id="us_phone3" value="'+ value[i].us_phone +'"><input type="hidden" id="us_email3" value="'+ value[i].us_email +'">';
									testEval += '</td><td class="txt-5">'+ value[i].p_content.substr(0, 20) +'...</td><td class="txt-1">'+ value[i].p_field +'</td><td class="txt-1">'+ value[i].p_kind +'</td><td class="txt-1">'+ value[i].p_reg_d +'</td><td class="txt-1"><input type="button" id="acBtn" class="acBtn" a_id="'+ value[i].a_id +'" p_id="'+ value[i].p_id +'" value="수락"> / <input type="button" id="caBtn" class="caBtn" a_id="'+ value[i].a_id +'" p_id="'+ value[i].p_id +'" value="취소"></td></tr>';
								}
								
								testEval +='</table></div>';
								
								
							} else if (key == "pi" && key.listCount != 0) {
								testEval += '<br><br><div class="pagingArea" align="center">';
								testEval += '<a class="pg_prev" href="javascript:void(0);" onclick="goPage('+ (value.currentPage-1) +');"></a>';
								
								for(var p = value.startPage; p <= value.endPage; p++) {
									if(p == value.currentPage){
										testEval += '&nbsp;<a class="pg_current" href="javascript:void(0);" style="color: white; background:#999;">'+ p +'</a>';										
									}else {
										testEval += '&nbsp;<a class="pg_current" href="javascript:void(0);" style="color: #444;" onclick="goPage('+ p +');">'+ p +'</a>';
									}
									
								}	
								testEval +='&nbsp;<a class="pg_next" href="javascript:void(0);" onclick="goPage('+ (value.currentPage+1) +');"></a></div>'; 
								
								testEval +='<br><br><div id="searchArea" align="center"><div class="searchDiv"><select id="searchCondition2" name="searchCondition2">';
								testEval +='<option>-------</option><option value="p_id">매물번호</option><option value="p_field">유형</option><option value="p_kind">종류</option></select>';
								testEval +='<input id="searchValue2" class="searchInput2" name="searchInput" type="text" placeholder="매물검색" value="">';
								testEval +='<input class="searchButton2" type="button" onclick="searchBoard2();" value="검색"></div></div>';
								
								
							} else {
								
							}
							
						});
						
					}
					$('#m_div4').html(testEval);
				}
			});
		
		}
		function goPage(page){
			currentPage = page;
			estateApplication(currentPage, searchCondition, searchValue);
		};
		
	</script>
</body>
</html>