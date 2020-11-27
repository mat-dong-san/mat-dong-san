<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6575c609a2768f0806882eba14c4cb9&libraries=services,clusterer,drawing"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html,body{
		padding: 0;
		margin: 0;
		width: 100%;
		height: 100%;
	}
	
	#detailContentDiv{
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
	#headTable th{
		font-size: 30px;
    	font-weight: 700;
	}
	#headTable td{
		text-align: left;
	}
	#bodyTable{
		width: 100%;
	}
	#bodyTable tr{
		height: 50px;
	}
	#footTableDiv{
		width: 100%;
	}
	#footTableDiv tr{
		height: 50px;
	}
	#DetailInfoIndexDiv{
		display: flex;
    	width: 1140px;
    	margin: 0px auto;
    	height: 35px;
    	padding: 10px;
    	font-size: 17px;
    	border-bottom: 1px solid rgb(204, 204, 204);
	}
	#DetailInfoIndexDiv div{
		width: 25%;
	}
	#DetailInfoIndexDiv div:hover{
		cursor: pointer;
	}
	#productRentInfo{
		width: 850px;
    	margin: 0px auto;
    	border-top: 1px solid rgb(204, 204, 204);
	}
	#productRentInfo td+td{
		border-left: 1px solid rgb(238, 238, 238);
	}
	#productRentInfo td{
		padding: 15px;
		border-bottom: 1px solid rgb(204, 204, 204);
	}
	#monthRentInfo{
		width: 750px;
    	margin: 40px auto;
    	border: 1px solid rgb(204, 204, 204);
    	padding: 55px;
    	text-align: left;
	}
	#detailMap{
		width: 850px;
		margin: 0px auto;
		height: 500px;
	}
	#relativeOtherRoomInfo{
		margin: 0px auto;
		width: 1140px;
		text-align: left;
		height: 550px;
    	overflow: hidden;
   		max-height: 1130px;
	}
	#footInfoDiv{
		left: 0;
		right: 0;
		bottom: 0;
		height: 200px;
		background: rgb(55, 55, 55);
		margin-top: 30px;
		color: rgb(160, 160, 160);
	}
	#searchRoomNumDiv{
		margin: 0px auto;
		width: 1140px;
		text-align: right;
	}
	#footDetailInfoDiv{
		margin: 0px auto;
		width: 1140px;
		font-size: 12px;
		text-align: left;
		line-height: 8px;
	}
	.detailDiv{
		width: 1140px;
		margin: 0px auto;
	}
	.detailInfoIndexTitle{
		padding-top: 60px;
		margin: 20px auto;
		width: 1140px;
		margin-top: 50px;
		font-size: 22px;
		height: 40px;
		border-top: 1px solid rgb(204, 204, 204);
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
   	.goManage{
   		width: 70px;
   		background: red;
   		color: white"
   	}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div id="detailContentDiv">
		<div id="detailHeaderDiv" class="detailDiv">
			<table id="headTable">
				<tr>
					<td></td>
					<td>${ product.p_addr }</td>
					<td><div class="goManage">신고하기</div></td>
				</tr>
				<tr>
					<th colspan="2" style="text-align:left">
					<c:if test=""></c:if>
					<c:if test="${ product.p_deal == '전세' }">
		        		${ product.p_charter }
		        	</c:if>
		        	<c:if test="${ product.p_deal == '월세' }">
		        		${ product.p_deposit }/${ product.p_rent }
		        	</c:if>
					</th>
					<th></th>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div id="detailBodyDiv" class="detailDiv">
			<table id="bodyTable" style="text-align: left;">
				<tr>
					<td>해당층/건물층</td>
					<td>${ product.p_layer }/${ product.p_floor }</td>
					<td>전용/공급면적</td>
					<td>${ product.p_d_size }/${ product.p_s_size }</td>
					<td>방 수</td>
					<td>${ product.p_kind }</td>
					<td>방향</td>
					<td>${ product.p_dir }</td>
				</tr>
				<tr>
					<td>난방종류</td>
					<td>${ product.p_heat }</td>
					<td>빌트인</td>
					<td>${ product.p_built_in }</td>
					<td>주차여부</td>
					<td>${ product.p_park }</td>
					<td>베란다/발코니</td>
					<td>${ product.p_verander }</td>
				</tr>
				<tr>
					<td>엘레베이터</td>
					<td>${ product.p_elevator }</td>
					<td>반려동물</td>
					<td>${ product.p_pet }</td>
					<td>건물유형</td>
					<td>${ product.p_field }</td>
					<td>관리비</td>
					<td>${ product.p_cost }만</td>
				</tr>
				<tr>
					<td>구조</td>
					<td>${ product.p_str }</td>
					<td>전세대출</td>
					<td>${ product.p_loan }</td>
					<td>입주가능일</td>
					<td>${ product.p_en_d }</td>
					<td>최초등록일</td>
					<td>${ product.p_reg_d }</td>
				</tr>
				<tr style="height: 100px;">
					<td>옵션</td>
					<td colspan="7" style="text-align: left;">${ product.p_option }</td>
				</tr>
				<tr style="height: 350px;">
					<td colspan="8"><img alt="${ product.p_picture }" src="${ product.p_picture }"></td>
				</tr>
				<tr style="height: 200px;">
					<td colspan="8">
					${ product.p_content }
					</td>
				</tr>
			</table>
		</div>
		<div style="border-bottom: 1px solid rgb(204, 204, 204); margin-bottom: 10px;"></div>
		<div id="DetailInfoIndexDiv">
			<div onclick='location.href="#index1"'>가격 정보</div>
			<div onclick='location.href="#index2"'>위치</div>
			<div onclick='location.href="#index3"'>공인중개사 사무소</div>
			<div onclick='location.href="#index4"'>이 중개사의 다른 방</a></div>		
		</div>
		<div class="detailInfoIndexTitle" style="border: 0; margin-top: 0;" id="index1">
			가격 정보
		</div>
		<table id="productRentInfo">
			<tr>
				<td>집세</td>
				<td>관리비</td>
				<td>주차비</td>
				<td>전세대출</td>
			</tr>
			<tr>
				<td>
					<c:if test="${ product.p_deal == '전세' }">
		        		${ product.p_charter }만 원
		        	</c:if>
		        	<c:if test="${ product.p_deal == '월세' }">
		        		${ product.p_deposit }만/${ product.p_rent }만원
		        	</c:if>
				</td>
				<td>
					<c:if test="${ product.p_cost == 0 }">
		        		없음
		        	</c:if>
					<c:if test="${ product.p_cost != 0 }">
		        		${ product.p_cost }만원
		        	</c:if>
		        </td>
				<td>없음</td>
				<td>${ product.p_loan }</td>
			</tr>
		</table>
		<div id="monthRentInfo">
			<label style="font-size: 20px; letter-spacing: -1px;">한달 예상 주거비용</label>
			<label style="font-size: 30px; margin-left: 55px;">
				<c:if test="${ product.p_deal == '월세' }">
					${ product.p_cost + product.p_rent }만원
		        </c:if>
		        <c:if test="${ product.p_deal == '전세' }">
		        	${ product.p_cost }만 원
		        </c:if>
			</label>
			<label style="font-size: 15px; letter-spacing: -1px;">(월세 + 관리비)</label>
		</div>
		<div class="detailInfoIndexTitle" id="index2">
			위치
		</div>
		<div id="detailMap"></div>
		<div class="detailInfoIndexTitle" id="index3">
			공인중개사 사무소
		</div>
		
		<div class="detailDiv">
			<table id="footTableDiv">
				<tr>
					<td>중개사 이름</td>
					<td style="text-align:left;">${ EstateAgent.e_name }</td>
					<td>중개사 번호</td>
					<td>${ EstateAgent.e_phone }</td>
				</tr>
				<tr>
					<td>위치 정보</td>
					<td style="text-align:left;">${ EstateAgent.e_addr }</td>
					<td>평점</td>
					<td>${ EstateAgent.e_point }</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><span class="goManage">쪽지 보내기 버튼</span></td>
					<td><span class="goManage">신고하기</span></td>
				</tr>
				<tr style="height: 300px;">
					<td colspan="4"><img alt="${ EstateAgent.e_picture }" src="${ EstateAgent.e_picture }"></td>
				</tr>
			</table>
			<div id="replyDiv" style="height: 400px; overflow: hidden;">
				<table id="footTableDiv">
					<tr>
						<td style="width: 200px;">평점
							<select id="point">
								<option value='1'>1점</option>
								<option value='2'>2점</option>
								<option value='3'>3점</option>
								<option value='4'>4점</option>
								<option selected="selected" value='5'>5점</option>
							</select>
						</td>
						<td><input id="RplyContent" type="text"></td>
						<td><input id="addRply" type="button" value="등록"></td>
						<td><button id="allReplyView">댓글 모두보기</button></td>
					</tr>
					<tbody id="replyTbody">
						<c:forEach var="r" items="${ review }">
							<tr>
								<td>${ r.er_point }점</td>
								<td>${ r.er_content }</td>
								<td>${ r.us_id }</td>
								<td style="width: 100px;"><span class="goManage">신고하기</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<script>
			/* 댓글등록 */
			$('#addRply').click(function(){
				var point = $('#point').val();
				var content = $('#RplyContent').val();
				var estate_id = ${ EstateAgent.e_id };
				var user = 'user5'; // ${ loginUser } 로 바꿔야함
				
				$.ajax({
					url:"replyAdd.search",
					data:{er_point:point, er_content:content, us_id:user, estate_id:estate_id},
					type:"post",
					datatype:"json",
					success:function(data){
						var $tbody = $('#replyTbody');
						$tbody.html('');
						for(var i = 0; i < data.length; i++){
							var $tr = $('<tr>');
							var $td1 = $('<td>').text(data[i].er_point +"점");
							var $td2 = $('<td>').text(data[i].er_content);
							var $td3 = $('<td>').text(data[i].us_id);
							var $td4 = $('<td>').css('width','100px');
							var $span = $('<span class="goManage">').text("신고하기");
							
							$td4.append($span);
							$tr.append($td1);
							$tr.append($td2);
							$tr.append($td3);
							$tr.append($td4);
							$tbody.append($tr);
						}
					}
				});
			
			});
			
			$('#allReplyView').click(function(){
				if($('#replyDiv').css('height') == '400px'){
					$('#replyDiv').css('height', 'auto');
					$(this).text('댓글 적게보기');
				} else {
					$('#replyDiv').css('height', '400px');
					$(this).text('댓글 모두보기');
				}
			});
		</script>
		
		<div class="detailInfoIndexTitle" id="index4">
			이 중개사의 다른방
		</div>
		<div style="text-align:right; margin: 10px auto; width: 1140px;">
			<button id="moreRoomView" style="margin-right: 72px;">방 더보기</button>
			<script>
				$('#moreRoomView').click(function(){
					$('#relativeOtherRoomInfo').css('height','auto');
				});
			</script>
		</div>
		<div id="relativeOtherRoomInfo">
			<c:forEach var="p" items="${ productList }">
				<div class="productContent" onclick="location.href='${ goDetailPage }'">
					<img alt="${ p.p_picture }" src="${ p.p_picture }">
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
				</div>
			</c:forEach>
		</div>
		
		
		<div id="footInfoDiv">
			<div id="searchRoomNumDiv">
				<input type="text" placeholder="매물번호 검색">
				<input type="button" value="검색">
				<span style="cursor: pointer; background: white;"onclick="location.href='#detailHeaderDiv'">맨 위로</span>
			</div>
			<div id="footDetailInfoDiv">
				<p>(주)맛동산</p>
				<p>대표: 김수환, 김용연, 백성강, 이정서, 정창섭</p>
				<p>사업자 번호: 220-11-48751-4872442142</p>
				<p>주소: 서울시 강남구 역삼동</p>
				<br>
				<p>고객센터: 070-1253-8253    평일: 09:00 ~ 18:00 (공휴일 휴무)</p>
				<p>팩스: 02-111-2222</p>
			</div>
		</div>
		
	</div>
	
	
	
	<script>  
  
     var container = document.getElementById('detailMap'); //지도를 담을 영역의 DOM 레퍼런스
     var options = { //지도를 생성할 때 필요한 기본 옵션
        //center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
        center: new kakao.maps.LatLng(37.566826, 126.9786567), //지도의 중심좌표.
        
        
        level: 3 //지도의 레벨(확대, 축소 정도)
     };
  
     var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
     
     var geocoder = new kakao.maps.services.Geocoder();
     var p_Add = "${ product.p_addr }";
     var rp_Addr = p_Add.substring(6);
     // 주소로 좌표를 검색합니다
     geocoder.addressSearch(rp_Addr, function(result, status) {
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
                 content: '<div style="width:150px;text-align:center;padding:6px 0;">${ product.p_addr }</div>'
             });
             infowindow.open(map, marker);
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
             map.setCenter(coords);
         }
     });
  </script>
</body>
</html>