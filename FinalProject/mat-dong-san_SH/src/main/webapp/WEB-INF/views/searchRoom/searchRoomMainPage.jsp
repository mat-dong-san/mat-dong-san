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
   		z-index: 1;/* 
   		width: 200px;
   		height: 200px; */
   		top:140px;
   		border: 1px solid rgb(212, 212, 212);
   		background: white;
   		flex-direction: column;
   		padding: 10px;
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
	  <button id="productFilter" class="filter">거래 종류</button>
	  <button id="productPay" class="filter">가격대</button>
	  <button id="rentFilter" class="filter">건물 유형</button>
	  <button id="otherFilter" class="filter">기타 옵션</button>
	  
	  <c:url var="goDetailPage" value="searchRoomDetailPage.search" />
	  <div id="roomFilterDiv" class="filterDiv" style="left: 280px;">
	  		방 종류
	  		<label><input type="checkbox" id="roomTypeOne" name="roomType" onclick="checkFilterFun(); checkOneForce(this);" value="원룸">원룸</label>
	  		<label><input type="checkbox" id="roomTypeTwo" name="roomType" onclick="checkFilterFun(); checkOneForce(this);" value="투룸">투룸</label>
	  		<label><input type="checkbox" id="roomTypeThree" name="roomType" onclick="checkFilterFun(); checkOneForce(this);" value="쓰리룸">쓰리룸</label>
	  </div>
	  <div id="productFilterDiv" class="filterDiv" style="left: 335px;">
	  		거래 종류
	  		<label><input id="monthly" name="tradeType" type="checkbox" onclick="checkFilterFun(); checkOneForce(this); rentTypeCheck(this);" value="월세">월세</label>
	  		<label><input id="charter" name="tradeType" type="checkbox" onclick="checkFilterFun(); checkOneForce(this); rentTypeCheck(this);" value="전세">전세</label>
	  </div>
	  <div id="productPayDiv" class="filterDiv" style="left: 400px;">
	  		가격대
	  		<div id="charterDiv">
	  			전세
	  			<div>
			  		<span>
			  			<select id="minCharter" style="width: 100px;" onchange="checkFilterFun();">
			  				<option value="0">0</option>
			  				<option value="5000">5000</option>
			  				<option value="15000">15000</option>
			  				<option value="25000">25000</option>
			  			</select>
			  		</span>
			  			~
			  		<span>
			  			<select id="maxCharter" style="width: 100px;" onchange="checkFilterFun();">
			  				<option value="5000">5000</option>
			  				<option value="15000">15000</option>
			  				<option value="25000">25000</option>
			  				<option value="10000000">제한 없음</option>
			  			</select>
			  		</span>
		  		</div>
	  		</div>
	  		<div>
	  			월세
	  			<div id="monthlyDiv">
			  		<span>
			  			<select id="minMonthly" style="width: 100px;" onchange="checkFilterFun();">
			  				<option value="0">0</option>
			  				<option value="20">20</option>
			  				<option value="30">30</option>
			  				<option value="40">40</option>
			  			</select>
			  		</span>
			  			~
			  		<span>
			  			<select id="maxMonthly" style="width: 100px;" onchange="checkFilterFun();">
			  				<option value="20">20</option>
			  				<option value="30">30</option>
			  				<option value="40">40</option>
			  				<option value="10000000">제한 없음</option>
			  			</select>
			  		</span>
		  		</div>
	  		</div>
	  </div>
	  <div id="rentFilterDiv" class="filterDiv" style="left: 450px;">
	  		건물 유형
	  		<label><input id="build1" type="checkbox" name="buildType" onclick="checkFilterFun(); checkOneForce(this);" value="단독주택">단독주택</label>
	  		<label><input id="build2" type="checkbox" name="buildType" onclick="checkFilterFun(); checkOneForce(this);" value="다가구주택">다가구주택</label>
	  		<label><input id="build3" type="checkbox" name="buildType" onclick="checkFilterFun(); checkOneForce(this);" value="빌라">빌라/연립/다세대</label>
	  		<label><input id="build4" type="checkbox" name="buildType" onclick="checkFilterFun(); checkOneForce(this);" value="상가주택">상가주택</label>
	  </div>
	  <div id="otherFilterDiv" class="filterDiv" style="left: 500px; flex-direction: row;">
	  		
	  		<div style="display:flex; flex-direction: column">주차여부
	  			<label><input id="parkAll" type="radio" name="parkType" checked="checked" onclick="checkFilterFun();" value="무관">무관</label>
	  			<label><input id="parkAble" type="radio" name="parkType" onclick="checkFilterFun();" value="가능">가능</label>
	  			<label><input id="parkDidable" type="radio" name="parkType" onclick="checkFilterFun();" value="불가능">불가능</label>
	  		</div>
	  		<div style="display:flex; flex-direction: column">반려동물
	  			<label><input id="petAll" type="radio" name="petType" checked="checked" onclick="checkFilterFun();" value="무관">무관</label>
	  			<label><input id="petAble" type="radio" name="petType" onclick="checkFilterFun();" value="가능">가능</label>
	  			<label><input id="petDisable" type="radio" name="petType" onclick="checkFilterFun();" value="불가능">불가능</label>
	  		</div>
	  		<div style="display:flex; flex-direction: column">엘레베이터
	  			<label><input id="eleAll" type="radio" name="eleType" checked="checked" onclick="checkFilterFun();" value="무관">무관</label>
	  			<label><input id="eleAble" type="radio" name="eleType" onclick="checkFilterFun();" value="있음">있음</label>
	  			<label><input id="eleDisable" type="radio" name="eleType" onclick="checkFilterFun();" value="없음">없음</label>
	  		</div>
	  		
	  </div>
	  
	  <script>

			/* 필터링 변경했을때 동작하기 위한 함수 */
			function checkFilterFun(){
				var one = "empty";
				if($('#roomTypeOne').prop('checked')){
					one = $('#roomTypeOne').val();
				};
				var two = "empty";
				if($('#roomTypeTwo').prop('checked')){
					two = $('#roomTypeTwo').val();
				};
				var three = "empty";
				if($('#roomTypeThree').prop('checked')){
					three = $('#roomTypeThree').val();
				};
				var monthly = "empty";
				if($('#monthly').prop('checked')){
					monthly = $('#monthly').val();
				};
				var charter = "empty";
				if($('#charter').prop('checked')){
					charter = $('#charter').val();
				};
				var build1 = "empty";
				if($('#build1').prop('checked')){
					build1 = $('#build1').val();
				};
				var build2 = "empty";
				if($('#build2').prop('checked')){
					build2 = $('#build2').val();
				};
				var build3 = "empty";
				if($('#build3').prop('checked')){
					build3 = $('#build3').val();
				};
				var build4 = "empty";
				if($('#build4').prop('checked')){
					build4 = $('#build4').val();
				};
				var minCharter = $('#minCharter').select().val();
				var maxCharter = $('#maxCharter').select().val();
				var minMonthly = $('#minMonthly').select().val();
				var maxMonthly = $('#maxMonthly').select().val();
				var parkType = $('input[name=parkType]:checked').val();
				var petType = $('input[name=petType]:checked').val();
				var eleType = $('input[name=eleType]:checked').val();
				var searchInput = $('#searchAddr').val();
				
				
				$.ajax({
					url: 'goSearchFilter.search',
					data: 
					{
						one: one, two:two, three:three,
						monthly:monthly, charter:charter,
						build1:build1, build2:build2, build3:build3, build4:build4,
						minCharter:minCharter, maxCharter:maxCharter,
						minMonthly:minMonthly, maxMonthly:maxMonthly,
						parkType:parkType, petType:petType, eleType:eleType,
						searchInput:searchInput
					},
					dataType: 'json',
					success: function(data){
						
						console.log(data);
						console.log(data[0]);
						console.log(data[1]);
						
					 	var $listHouseDiv = $("#listHouseDiv"); 
						$listHouseDiv.html(""); 
						
						/* 전체 매물수 표기 */
						var $div1 = $('<div>').text("전체 매물 수 : " + data[0].listCount);
						$listHouseDiv.append($div1);
						
						/* 매물 div */
						
					 	for(var i = 0; i < data[1].length; i++){
							
							var $div2 = $("<div class='productContent'>");
							$div2.attr('onclick','location.href="${ goDetailPage }"');
							var $img = $("<img alt="+data[1][i].p_picture+" src=''>");
							var $span1 = $("<span>").text(data[1][i].p_kind);
							var $span2 = $("<span>").text(data[1][i].p_deal);
							var $span3 = $("<span>");
							if(data[1][i].p_deal == '전세'){
								$span3.text(data[1][i].p_charter);
							} else {
								$span3.text(data[1][i].p_deposit+"/"+data[1][i].p_rent);
							}
							var $span4 = $("<span>").text(data[1][i].p_content);
							var $span5 = $("<span>").text(data[1][i].p_addr);
							
							$div2.append($img);
							$div2.append($span1);
							$div2.append($span2);
							$div2.append($span3);
							$div2.append($span4);
							$div2.append($span5);
							$listHouseDiv.append($div2);
							
						}
						
						/* 페이징 */
						
						$div3 = $("<div>");

						/* 이전페이지 */
						if(data[0].currentPage <= 1){
							$div3.text("[이전]");
							$div3.append("&nbsp;");
						} else {
							var $beforeA = $("<a>").text("[이전]");
							$beforeA.attr('href',"#");
							$beforeA.attr('onclick',"filterPaging('p');");
							$div3.append($beforeA);
							$div3.append("&nbsp;");
						}
						
						/* 페이지 */
						for(var i = data[0].startPage; i <= data[0].endPage; i++){
							if(data[0].currentPage == i){
								$font = $("<font color='red' size='4'>").text("["+i+"]");
								$div3.append($font);
								$div3.append("&nbsp;");
							} else {
								var $pageA = $("<a>").text(i);
								$pageA.attr('href',"#");
								$pageA.attr('onclick',"filterPaging("+i+");");
								$div3.append($pageA);
								$div3.append("&nbsp;");
							}
						}
						
						/* 다음 페이지 */
						if(data[0].currentPage >= data[0].maxPage){
							$div3.append("[다음]");
							$div3.append("&nbsp;");
						} else {
							var $afterA = $("<a>").text("[다음]");
							$afterA.attr('href',"#");
							$afterA.attr('onclick',"filterPaging(2);");
							$div3.append($afterA);
							$div3.append("&nbsp;");
						}
						/* "goSearchHomeMain.search?roomTypeArray="+roomTypeArray+"&searchInput="+searchInput+"&page="+data[0].currentPage + 1 */
						$listHouseDiv.append($div3);
						
					}
			
				});
				
				
			};
			
			
			function filterPaging(cP){
				var one = "empty";
				if($('#roomTypeOne').prop('checked')){
					one = $('#roomTypeOne').val();
				};
				var two = "empty";
				if($('#roomTypeTwo').prop('checked')){
					two = $('#roomTypeTwo').val();
				};
				var three = "empty";
				if($('#roomTypeThree').prop('checked')){
					three = $('#roomTypeThree').val();
				};
				var monthly = "empty";
				if($('#monthly').prop('checked')){
					monthly = $('#monthly').val();
				};
				var charter = "empty";
				if($('#charter').prop('checked')){
					charter = $('#charter').val();
				};
				var build1 = "empty";
				if($('#build1').prop('checked')){
					build1 = $('#build1').val();
				};
				var build2 = "empty";
				if($('#build2').prop('checked')){
					build2 = $('#build2').val();
				};
				var build3 = "empty";
				if($('#build3').prop('checked')){
					build3 = $('#build3').val();
				};
				var build4 = "empty";
				if($('#build4').prop('checked')){
					build4 = $('#build4').val();
				};
				var minCharter = $('#minCharter').select().val();
				var maxCharter = $('#maxCharter').select().val();
				var minMonthly = $('#minMonthly').select().val();
				var maxMonthly = $('#maxMonthly').select().val();
				var parkType = $('input[name=parkType]:checked').val();
				var petType = $('input[name=petType]:checked').val();
				var eleType = $('input[name=eleType]:checked').val();
				var searchInput = $('#searchAddr').val();
				
				if(cP == 'p'){
					console.log('이전');
					var page = Number("<c:out value='${pageInfo.currentPage}' />") - 1;
				} else if (cP == 'n'){
					console.log('다음');
					var page = Number("<c:out value='${pageInfo.currentPage}' />") + 1;
				} else {
					var page = Number(cP);
				}
				
				
				location.href=
					"goPagingMainPage.search?page="+page+"&searchInput="+searchInput+"&one="+one+"&two="+two+"&three="+three+"&monthly="+monthly+"&charter="+charter+"&build1="+build1+"&build2="+build2+"&build3="+build3+"&build4="+build4+"&minCharter="+minCharter+"&maxCharter="+maxCharter+"&minMonthly="+minMonthly+"&maxMonthly="+maxMonthly+"&parkType="+parkType+"&petType="+petType+"&eleType="+eleType;
						
			}
			
	  		/* 페이지 들어올때 관련 체크박스 체크하기 */
	  		$(function(){
	  			
	  			/* 방 종류 체크하기 */
	  		 	var roomType = [];
	  			roomType.push("<c:out value='${filter.roomType[0]}' />");
	  			roomType.push("<c:out value='${filter.roomType[1]}' />");
	  			roomType.push("<c:out value='${filter.roomType[2]}' />");
				
	  			var inputRoomType = document.getElementsByName('roomType');
	  			for(var i = 0; i < inputRoomType.length; i++){
	  				for(var j = 0; j < roomType.length; j++){
	  					if(inputRoomType[i].getAttribute('value') == roomType[j]){
	  						var checkValue = 'input[value='+roomType[j]+']'
	  						$(checkValue).prop("checked",true);
	  					}
	  				}
	  			} 
	  			
	  			/* 거래 종류 체크하기 */
	  		 	var tradeType = [];
	  			tradeType.push("<c:out value='${filter.tradeType[0]}' />");
	  			tradeType.push("<c:out value='${filter.tradeType[1]}' />");
	  			
	  			var inputTradeType = document.getElementsByName('tradeType');
	  			for(var i = 0; i < inputTradeType.length; i++){
	  				for(var j = 0; j < tradeType.length; j++){
	  					if(inputTradeType[i].getAttribute('value') == tradeType[j]){
	  						var checkValue = 'input[value='+tradeType[j]+']'
	  						$(checkValue).prop("checked",true);
	  					}
	  				}
	  			} 
	  			
	  			/* 건물 종류 체크하기 */
	  		 	var buildType = [];
	  			buildType.push("<c:out value='${filter.buildType[0]}' />");
	  			buildType.push("<c:out value='${filter.buildType[1]}' />");
	  			buildType.push("<c:out value='${filter.buildType[2]}' />");
	  			buildType.push("<c:out value='${filter.buildType[3]}' />");
	  			
	  			var inputBuildType = document.getElementsByName('buildType');
	  			for(var i = 0; i < inputBuildType.length; i++){
	  				for(var j = 0; j < buildType.length; j++){
	  					if(inputBuildType[i].getAttribute('value') == buildType[j]){
	  						var checkValue = 'input[value='+buildType[j]+']'
	  						$(checkValue).prop("checked",true);
	  					}
	  				}
	  			} 
	  			
	  			/* 가격대 기본으로 표기하기 */
	  		 	var minCharter = "<c:out value='${filter.minCharter}' />";
	  			var maxCharter = "<c:out value='${filter.maxCharter}' />";
	  			var minMonthly = "<c:out value='${filter.minMonthly}' />";
	  			var maxMonthly = "<c:out value='${filter.maxMonthly}' />";
	  			
	  			$('#minCharter').val(minCharter);
	  			$('#maxCharter').val(maxCharter);
	  			$('#minMonthly').val(minMonthly);
	  			$('#maxMonthly').val(maxMonthly); 
	  			
	  			/* 기타옵션 표기하기 */
	  		 	var parkType = "<c:out value='${filter.parkType}' />";
	  			var petType = "<c:out value='${filter.petType}' />";
	  			var eleType = "<c:out value='${filter.eleType}' />";
	  			var jQparkType = "input:radio[name = parkType]:input[value="+parkType+"]"
	  			var jQpetType = "input:radio[name = petType]:input[value="+petType+"]"
	  			var jQeleType = "input:radio[name = eleType]:input[value="+eleType+"]"
	  			$(jQparkType).attr("checked", true);
	  			$(jQpetType).attr("checked", true);
	  			$(jQeleType).attr("checked", true); 
	  			
	  			
	  		});
	  		
	  		/* 최소1개는 체크되어있게 확인하기 */
	  		function checkOneForce(thisName){
	  			
	  			// name 값 가져옴
	  			var name = thisName.getAttribute('name');
	  			// id 값 가져옴
	  			var id = thisName.getAttribute('id');
	  			
	  			// 체크된 값의 길이를 가져오기위해 사용
	  			var jQueryUsedName = 'input:checkbox[name='+name+']:checked';
	  			// jQuery에서 아이디 사용
	  			var jQueryUseId = '#'+id;
	  			
	  			if($(jQueryUsedName).length < 1){
	  				$(jQueryUseId).prop('checked',true);
	  			};
	  			
	  		}
	  
	  		
	  		/* 전세,월세 체크해제되어있으면 가격대 안뜨게 하기 */
	  		function rentTypeCheck(thisName){
	  			// id 값 가져옴
	  			var id = thisName.getAttribute('id');
	  			var divId = id + 'Div';
	  			// jQuery에서 아이디 사용
	  			var jQueryUseId = '#'+id;
	  			var jQueryDivUseId = '#'+divId;
	  			
	  			if($(jQueryUseId).prop('checked')){
	  				console.log('체크됨');
	  				$(jQueryDivUseId).css('display','block');
	  			} else {
	  				console.log('체크안됨');
	  				$(jQueryDivUseId).css('display','none');
	  			}
	  			
	  		}
	  		
	  		/* 버튼 클릭시 창 div 창 띄우기 */
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
	        
     	</c:forEach>
     	
     	<!-- 페이징 -->
     	<div>
     		<!-- 이전 -->
     		<c:if test="${ pageInfo.currentPage <= 1 }">
     			[이전]
     		</c:if>
     		<c:if test="${ pageInfo.currentPage > 1 }">
     			<c:url var="before" value="goSearchHomeMain.search">
     				<c:param name="page" value="${ pageInfo.currentPage - 1 }" />
     				<c:param name="searchInput" value="${ searchInput }" />
     			</c:url>
     			<a href="#" onclick="filterPaging('p')">[이전]</a>
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
						<a href="#" onclick="filterPaging(${ p })">${ p }</a>
					</c:if>
			</c:forEach>
     		
     		<!-- 다음 -->
     		<c:if test="${ pageInfo.currentPage >= pageInfo.maxPage }">
     			[다음]
     		</c:if>
     		<c:if test="${ pageInfo.currentPage < pageInfo.maxPage }">
     			<c:url var="next" value="goSearchHomeMain.search">
     				<c:param name="page" value="${ pageInfo.currentPage + 1 }" />
     				<c:param name="searchInput" value="${ searchInput }" />
     			</c:url>
     			<a href="#" onclick="filterPaging('n')">[다음]</a>
     		</c:if>
     	</div>
     	
     </div>
     <div id="map" class="divBorder"></div>
  </div>
  
 
<script>

	/* 지도 관련 스크립트 */
	
	var geocoder = new kakao.maps.services.Geocoder();
	var bounds = new kakao.maps.LatLngBounds();

	var position = [];
	var addr_s = [];
	var point = [];
	
	for(var i = 2; i < 12; i++){
		var deposit = $('#listHouseDiv>div:nth-child('+i+')>span:nth-child(3)').text();
		var rent = $('#listHouseDiv>div:nth-child('+i+')>span:nth-child(4)').text();
		var address = $('#listHouseDiv>div:nth-child('+i+')>span:nth-child(6)').text();
		
		// 주소를 담은 배열
		addr_s.push({
			ad: address,
			re: address + "/" + rent
		});
	}
	// 좌표를 담자
	for(var i = 0; i < 10; i++){
		geocoder.addressSearch(addr_s[i].re.substr(0,addr_s[i].re.indexOf("/")), callback);
	}
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	
	mapOption = {
	    center: new kakao.maps.LatLng(37.5888243531423, 127.020126449752), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	function callback(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	position.push(
		    		{
		    			content: "<div style='padding:5px; font-size:15px; width:240px;'>"+result[0].address_name+"</div>",
		    			latlng: new kakao.maps.LatLng(result[0].y, result[0].x)
		    		}
	    	)
	    	point.push(new kakao.maps.LatLng(result[0].y, result[0].x));
	    	
	    	for (i = 0; i < point.length; i++) {
	    	    
	    	    // LatLngBounds 객체에 좌표를 추가합니다
	    	    bounds.extend(point[i]);
	    	}
	    	
	    	function setBounds() {
	    	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    	    map.setBounds(bounds);
	    	}
	    	setBounds();
	    	
	    	if(position.length == 9 || position.length == 10){
	    		
	    		for (var i = 0; i < position.length; i ++) {
	    		    // 마커를 생성합니다
	    		    var marker = new kakao.maps.Marker({
	    		        map: map, // 마커를 표시할 지도
	    		        position: position[i].latlng // 마커의 위치
	    		    });

	    		    // 마커에 표시할 인포윈도우를 생성합니다 
	    		    var infowindow = new kakao.maps.InfoWindow({
	    		        content: position[i].content // 인포윈도우에 표시할 내용
	    		    });

	    		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    		    kakao.maps.event.addListener(marker, 'click', function() {
						
	    		    	// detail 페이지 이동
	    		    	location.href="${ goDetailPage }"; 
		    		});
	    		}

	    		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	    		function makeOverListener(map, marker, infowindow) {
	    		    return function() {
	    		        infowindow.open(map, marker);
	    		    };
	    		}

	    		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	    		function makeOutListener(infowindow) {
	    		    return function() {
	    		        infowindow.close();
	    		    };
	    		}
	    		
	    	}
	    }
	};
	
	
  	
</script>
 
</body>
</html>