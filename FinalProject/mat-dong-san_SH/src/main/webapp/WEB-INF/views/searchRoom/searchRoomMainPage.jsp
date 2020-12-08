<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6575c609a2768f0806882eba14c4cb9&libraries=services,clusterer,drawing"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
   html, body{
      	height: 100%;
      	width: 100%;
      	margin: 0;
      	padding: 0;
   }
   .divBorder{border: 1px solid black;}
   
   #headDiv{
      	/* position: fixed;
       	left: 0;
       	right: 0;
       	top: 0;
       	height: 80px; */
      	display:inline-block;
       	width: 100%;
       	height: 80px;
       	background: orange;
   }
   #filterDiv{
      	/* position: fixed;
       	left: 0;
       	right: 0;
       	top: 80px;
       	height: 30px; */
       	display:inline-flex;
       	width: 100%;
       	height: 64px;
       	margin-top: 70px;
       	flex-direction: row;
   }
   #listHouseDiv{
      	position: absolute;
       	left: 0;
       	top: 0;
       	bottom: 0;
       	width: 450px;
       	overflow: auto;
       	background: lightgray;
       	padding-top: 20px;
   }
   #map{
      	position: absolute;
      	left: 450px;
      	top: 0;
      	right: 0;
      	bottom: 0;
      	border: 0;
   }
   #contentContainer{
      	position: fixed;
       	left: 0;
       	bottom: 0;
       	top: 134px;
       	right: 0;
   }
   #searchAddr{
   		height: 100%;
    	width: 220px;
    	border: 0;
    	outline: none;
    	font-size: 15px;
   }
   #searchBtn{
   		height: 100%;
   		width: 50px; 
   		border: 0; 
   		outline: none;
   }
   .productContent{
    	display: inline-flex;
    	width: 180px;
    	border: 1px solid black;
     	height: 250px;
     	margin: 15px;
      	flex-direction: column;
   }
   .productContent:hover{
   		cursor: pointer;
   }
   .filter{
   		border: 1px solid rgb(223, 223, 223);
   		outline: none;
   }
   .filterDiv{
   		position: fixed;
   		display: none;
   		z-index: 1;
   		width: 200px;
   		height: 200px;
   		border: 1px solid rgb(212, 212, 212);
   		background: white;
   		flex-direction: column;
   }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <c:import url="../common/menubar.jsp"/>
  <!-- <div id="headDiv">헤더(방찾기,고객센터,로그인,회원가입 등)</div> -->
  <div id="filterDiv">
	  <form action="goSearchHomeMain.search" method="get">
		<input type="text" id="searchAddr" name="searchInput" value="${ searchInput }" placeholder="찾고싶은 지역을 입력해주세요.">
		<input type="submit" value="검색" id="searchBtn">
	  </form>
	  <button id="roomFilter" class="filter">방 종류</button>
	  <button id="productFilter" class="filter">매물 종류</button>
	  <button id="rentFilter" class="filter">가격대</button>
	  <button id="sizeFilter" class="filter">방 크기</button>
	  <button id="manageExpenseFilter" class="filter">관리비</button>
	  <button id="floorFilter" class="filter">층수</button>
	  
	  <div id="roomFilterDiv" class="filterDiv" style="left: 300px;">
	  		방 종류
	  		<label><input type="checkbox">원룸</label>
	  		<label><input type="checkbox">투룸</label>
	  		<label><input type="checkbox">쓰리룸</label>
	  </div>
	  <div id="productFilterDiv" class="filterDiv" style="left: 320px;">
	  		매물 종류
	  		<label><input type="checkbox">원룸</label>
	  		<label><input type="checkbox">투룸</label>
	  		<label><input type="checkbox">쓰리룸</label>
	  </div>
	  <div id="rentFilterDiv" class="filterDiv" style="left: 340px;">
	  		가격대
	  		<label><input type="checkbox">원룸</label>
	  		<label><input type="checkbox">투룸</label>
	  		<label><input type="checkbox">쓰리룸</label>
	  </div>
	  <div id="sizeFilterDiv" class="filterDiv" style="left: 360px;">
	  		방크기
	  		<label><input type="checkbox">원룸</label>
	  		<label><input type="checkbox">투룸</label>
	  		<label><input type="checkbox">쓰리룸</label>
	  </div>
	  <div id="manageExpenseFilterDiv" class="filterDiv" style="left: 380px;">
	  		관리비
	  		<label><input type="checkbox">원룸</label>
	  		<label><input type="checkbox">투룸</label>
	  		<label><input type="checkbox">쓰리룸</label>
	  </div>
	  <div id="floorFilterDiv" class="filterDiv" style="left: 400px;">
	  		층수
	  		<label><input type="checkbox">원룸</label>
	  		<label><input type="checkbox">투룸</label>
	  		<label><input type="checkbox">쓰리룸</label>
	  </div>



	  <script>
		  	$('#filterDiv>button').click(function(){
		  		
		  		var btnId = $(this).attr('id');
		  		var DivId = '#' + btnId + 'Div';
		  		
		  		if($(DivId).css('display') == 'flex'){
		  			$(DivId).css('display','none');
		  		} else {
			  		$('#filterDiv>Div').css('display','none');
			  		$(DivId).css('display','flex');
		  		}
		  	});
	  </script>
  </div>
  
  <c:url var="goDetailPage" value="searchRoomDetailPage.search" />
  <div id="contentContainer">
     <div id="listHouseDiv">
     	<div>전체 매물 수 : ${ pageInfo.listCount } </div>
     	<c:forEach var="p" items="${ productList }">
     		
	        <div class="productContent" onclick="location.href='${ goDetailPage }'">
	        <img alt="${ p.p_picture }" src="">
	        <span>${ p.p_kind }</span>
	        <span>${ p.p_deal }</span>
	        <span>
	        	<c:if test="${ p.p_deal == '전세' }">
	        		${ p.p_charter }
	        	</c:if>
	        	<c:if test="${ p.p_deal == '월세' }">
	        		${ p.p_deposit }/${ p.p_rent }
	        	</c:if>
	        </span>
	        <span>${ p.p_content }</span>
	        <span>${ p.p_addr }</span>
	        </div>
	        <%-- <div class="productContent" onclick="location.href='${ goDetailPage }'"><img alt="사진" src=""><span>원룸</span><span>월세</span><span>500/20</span><span>부가설명</span></div>
	        <div class="productContent" onclick="location.href='${ goDetailPage }'"><img alt="사진" src=""><span>투룸</span><span>월세</span><span>1000/40</span><span>부가설명</span></div>
	        <div class="productContent" onclick="location.href='${ goDetailPage }'"><img alt="사진" src=""><span>쓰리룸</span><span>전세</span><span>15000</span><span>부가설명</span></div>
	        <div class="productContent" onclick="location.href='${ goDetailPage }'"><img alt="사진" src=""><span>투룸</span><span>전세</span><span>2000/50</span><span>부가설명</span></div>
	        <div class="productContent" onclick="location.href='${ goDetailPage }'"><img alt="사진" src=""><span>쓰리룸</span><span>월세</span><span>5000/60</span><span>부가설명</span></div> --%>
     	</c:forEach>
     	
     	<!-- 페이징 -->
     	<div>
     		<!-- 이전 -->
     		<c:if test="${ pageInfo.currentPage <= 1 }">
     			[이전] &nbsp;
     		</c:if>
     		<c:if test="${ pageInfo.currentPage > 1 }">
     			<c:url var="before" value="goSearchHomeMain.search">
     				<c:param name="page" value="${ pageInfo.currentPage - 1 }" />
     				<c:param name="searchInput" value="${ searchInput }" />
     			</c:url>
     			<a href="${ before }">[이전]</a> &nbsp;
     		</c:if>
     		
     		<!-- 페이지 -->
			<c:forEach var="p" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
					<c:if test="${ p eq pageInfo.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pageInfo.currentPage }">
						<c:url var="pagination" value="goSearchHomeMain.search">
							<c:param name="page" value="${ p }"/>
							<c:param name="searchInput" value="${ searchInput }" />
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
			</c:forEach>
     		
     		<!-- 다음 -->
     		<c:if test="${ pageInfo.currentPage >= pageInfo.maxPage }">
     			[다음] &nbsp;
     		</c:if>
     		<c:if test="${ pageInfo.currentPage < pageInfo.maxPage }">
     			<c:url var="next" value="goSearchHomeMain.search">
     				<c:param name="page" value="${ pageInfo.currentPage + 1 }" />
     				<c:param name="searchInput" value="${ searchInput }" />
     			</c:url>
     			<a href="${ next }">[다음]</a> &nbsp;
     		</c:if>
     	</div>
     	
     </div>
     <div id="map" class="divBorder"></div>
  </div>
  <script>  
  
     var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
     var options = { //지도를 생성할 때 필요한 기본 옵션
        //center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
        center: new kakao.maps.LatLng(37.566826, 126.9786567), //지도의 중심좌표.
        
        
        level: 4 //지도의 레벨(확대, 축소 정도)
     };
  
     var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
     
     var geocoder = new kakao.maps.services.Geocoder();
     
     // 주소로 좌표를 검색합니다
     geocoder.addressSearch('강남구 테헤란로14길 6', function(result, status) {
          // 정상적으로 검색이 완료됐으면 
          if (status === kakao.maps.services.Status.OK) {
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
              // 결과값으로 받은 위치를 마커로 표시합니다
             var marker = new kakao.maps.Marker({
                 map: map,
                 position: coords
             });
              // 인포윈도우로 장소에 대한 설명을 표시합니다
             var infowindow = new kakao.maps.InfoWindow({
                 content: '<div style="width:150px;text-align:center;padding:6px 0;">맛동산 전설의 시작</div>'
             });
             infowindow.open(map, marker);
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
             map.setCenter(coords);
         }
     });
  </script>
</body>
</html>