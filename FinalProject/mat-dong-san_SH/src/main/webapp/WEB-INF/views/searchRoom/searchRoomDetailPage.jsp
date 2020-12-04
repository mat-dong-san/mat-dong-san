<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		/* background: #ffa5001c; */
		overflow: auto;
		letter-spacing: -0.5px;
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
		border-collapse: collapse;
	}
	#bodyTable tr{
		height: 50px;
		border-bottom: 1px solid rgb(204, 204, 204);
	}
	#footTableDiv{
		width: 100%;
	}
	#footTableDiv th+td{
		border-left: 1px solid black;
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
    	color:rgb(136, 136, 136);
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
    	margin-bottom: 90px;
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
	#bodyTable th{
		font-weight: 500;
		color: rgb(136, 136, 136);
    	font-size: 14px;
	}
	#bodyTable td{
		color: rgb(34, 34, 34);
	    font-size: 14px;
	    position: relative;
	}
	#addRply{
		outline: none;
	    border: 0;
	    background: rgb(21 100 249 / 88%);
	    padding: 5px 9px;
	    color: white;
	}
	#allReplyView{
		outline: none;
	    border: 0;
	    background: rgb(21 100 249 / 88%);
	    padding: 5px 9px;
	    color: white;
	}
	#moreRoomView{
		outline: none;
	    border: 0;
	    background: rgb(21 100 249 / 88%);
	    padding: 5px 9px;
	    color: white;
	    margin-top: 20px;
	    margin-bottom: 50px;
	}
	#addRply:hover{
		cursor: pointer;
	}
	#allReplyView:hover{
		cursor: pointer;
	}
	#moreRoomView:hover{
		cursor: pointer;
	}
	.detailDiv{
		width: 1140px;
		margin: 0px auto;
		margin-top: 10px;
	}
	.indexTitleInfo:hover{
		color:rgb(34, 34, 34);
	}
	.detailInfoIndexTitle{
		padding-top: 50px;
		margin: 20px auto;
		width: 1140px;
		margin-top: 90px;
		font-size: 22px;
		height: 40px;
		border-top: 1px solid rgb(204, 204, 204);
	}
	.productContent{
    	display: inline-flex;
    	width: 193px;
     	height: 250px;
     	margin: 15px;
      	flex-direction: column;
   	}
   	.productContent:hover{
   		cursor: pointer;
   	}
   	.goManage{
   		width: 90px;
   		color: white;
	    border: 0;
    	background: rgb(21 100 249 / 88%);
    	padding: 5px 9px;
    	color: white;
    	outline:0;
   	}
   	.goManage:hover{
   		cursor: pointer;
   	}
   	.kind{
   		border: 1px solid rgb(21 100 249 / 90%);
	    width: 55px;
	    text-align: center;
	    font-size: 14px;
	    margin-top: 10px;
	    color: rgb(21 100 249 / 90%);
	    margin-bottom: 6px;
   }
   .deal{
   		font-size: 18px;
   }
   .charter{
   		font-size: 17px;
   		font-weight: 600;
   }
   .content{
   		font-size: 13px;
   }
   .addre{
   		font-size: 11px;
   		color: lightslategrey;
   }
   .pageDivCss{
   		text-align:center;
   }
   #footTableDiv th{
   		font-weight: 500;
	    color: rgb(136, 136, 136);
	    font-size: 14px;
   }
   #footTableDiv td{
		color: rgb(34, 34, 34);
    	font-size: 15px;
   }
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div id="detailContentDiv">
		<div id="detailHeaderDiv" class="detailDiv" style="border-bottom: 3px solid black;margin-top: 25px;padding-bottom: 20px;">
			<table id="headTable">
				<tr>
					<td></td>
					<td style="font-size: 15px;">${ product.p_addr }</td>
					<td><!-- <div class="goManage">신고하기</div> --></td>
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
				<tr class="trStyle">
					<th>해당층/건물층</th>
					<td>${ product.p_layer }/${ product.p_floor }</td>
					<th>전용/공급면적</th>
					<td>${ product.p_d_size }/${ product.p_s_size }</td>
					<th>방 수</th>
					<td>${ product.p_kind }</td>
					<th>방향</th>
					<td>${ product.p_dir }</td>
				</tr>
				<tr class="trStyle">
					<th>난방종류</th>
					<td>${ product.p_heat }</td>
					<th>빌트인</th>
					<td>${ product.p_built_in }</td>
					<th>주차여부</th>
					<td>${ product.p_park }</td>
					<th>베란다/발코니</th>
					<td>${ product.p_verander }</td>
				</tr>
				<tr class="trStyle">
					<th>엘레베이터</th>
					<td>${ product.p_elevator }</td>
					<th>반려동물</th>
					<td>${ product.p_pet }</td>
					<th>건물유형</th>
					<td>${ product.p_field }</td>
					<th>관리비</th>
					<td>${ product.p_cost }만</td>
				</tr>
				<tr class="trStyle">
					<th>구조</th>
					<td>${ product.p_str }</td>
					<th>전세대출</th>
					<td>${ product.p_loan }</td>
					<th>입주가능일</th>
					<td>${ product.p_en_d }</td>
					<th>최초등록일</th>
					<td>${ product.p_reg_d }</td>
				</tr>
				<tr style="height: 100px; border-bottom: 0;" class="trStyle">
					<th>옵션</th>
					<td colspan="7" style="text-align: left;">${ product.p_option }</td>
				</tr>
				<tr style="height: 250px; border-bottom: 0;">
					<td colspan="8" style="overflow:hidden;">
						<c:forEach var="pic" items="${ pictureList }">
							<img alt="${ pic }" src="resources/buploadFiles/${ pic }" width="274px" height="180px" style="margin-left:5px; margin-bottom: 6px;" onclick="fnImgPop(this.src)">
						</c:forEach>
						
					</td>
				</tr>
				<tr style="height: 150px;" >
					<td colspan="8" style="font-size: 15px;text-align:center;">
					${ product.p_content }
					</td>
				</tr>
			</table>
		</div>
		<div style="border-bottom: 1px solid rgb(204, 204, 204); margin-bottom: 10px;"></div>
		<div id="DetailInfoIndexDiv" style="font-size: 14px;">
			<div class="indexTitleInfo" onclick='location.href="#index1"'>가격 정보</div>
			<div class="indexTitleInfo" onclick='location.href="#index2"'>위치</div>
			<div class="indexTitleInfo" onclick='location.href="#index3"'>공인중개사 사무소</div>
			<div class="indexTitleInfo" onclick='location.href="#index4"'>이 중개사의 다른 방</div>		
		</div>
		<div class="detailInfoIndexTitle" style="border: 0; margin-top: 0;" id="index1">
			가격 정보
		</div>
		<table id="productRentInfo" style="font-size: 14px;">
			<tr>
				<td style="color: rgb(34, 34, 34);">집세</td>
				<td style="color: rgb(34, 34, 34);">관리비</td>
				<td style="color: rgb(34, 34, 34);">주차비</td>
				<td style="color: rgb(34, 34, 34);">전세대출</td>
			</tr>
			<tr>
				<td style="color: rgb(136, 136, 136);">
					<c:if test="${ product.p_deal == '전세' }">
		        		${ product.p_charter }만 원
		        	</c:if>
		        	<c:if test="${ product.p_deal == '월세' }">
		        		${ product.p_deposit }만/${ product.p_rent }만원
		        	</c:if>
				</td>
				<td style="color: rgb(136, 136, 136);">
					<c:if test="${ product.p_cost == 0 }">
		        		없음
		        	</c:if>
					<c:if test="${ product.p_cost != 0 }">
		        		${ product.p_cost }만원
		        	</c:if>
		        </td>
				<td style="color: rgb(136, 136, 136);">없음</td>
				<td style="color: rgb(136, 136, 136);">${ product.p_loan }</td>
			</tr>
		</table>
		<div id="monthRentInfo" style="letter-spacing: -1px;border-color: rgb(20, 118, 252);">
			<label style="font-size: 20px; letter-spacing: -1px;color: rgb(20, 118, 252);">한달 예상 주거비용</label>
			<label style="font-size: 30px; margin-left: 55px;color: rgb(20, 118, 252);">
				<c:if test="${ product.p_deal == '월세' }">
					${ product.p_cost + product.p_rent }만원
		        </c:if>
		        <c:if test="${ product.p_deal == '전세' }">
		        	${ product.p_cost }만 원
		        </c:if>
			</label>
			<label style="letter-spacing: -1px;font-size: 14px;opacity: 0.6;">(월세 + 관리비)</label>
		</div>
		<div class="detailInfoIndexTitle" id="index2" style="margin-bottom: 35px;">
			위치
		</div>
		<div id="detailMap"></div>
		<div class="detailInfoIndexTitle" id="index3" style="margin-bottom: 50px;">
			공인중개사 사무소
		</div>
		
		<div class="detailDiv">
			<table id="footTableDiv" style="border-collapse: collapse;">
				<tr style="border-bottom: 1px solid black; border-top: 1px solid black;">
					<th>중개사 이름</th>
					<td style="text-align:left; padding-left: 30px;">${ EstateAgent.e_name }</td>
					<th>중개사 번호</th>
					<td>${ EstateAgent.e_phone }</td>
				</tr>
				<tr style="border-bottom: 1px solid black;">
					<th>위치 정보</th>
					<td style="text-align:left; padding-left: 30px;">${ EstateAgent.e_addr }</td>
					<th>평점</th>
					<td>${ EstateAgent.e_point }</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>
						<input id="e_name" type="hidden" value="${ EstateAgent.e_name }">
						<input id="e_id" type="hidden" value="${ EstateAgent.e_id }">
						<input id="p_id" type="hidden" value="${ product.p_id }">
						<input id="us_id" type="hidden" value="">
						
					</td>
					<td style="padding:50px 0px"><button id="sned_message" class="goManage">쪽지 보내기</button>
					<script>
							$('#sned_message').click(function(){
								window.open("openMessage.search", "메세지보내기", "width=520, height=440, left=600, top=200");
							});
					</script>
					</td>
				</tr>
				<tr style="height: 300px;padding-top: 20px;">
					<td colspan="4" style="padding-bottom: 50px;"><img width="450px" height="300px" alt="${ EstateAgent.e_picture }" src="resources/buploadFiles/${ EstateAgent.e_picture }"></td>
				</tr>
			</table>
			<div id="replyDiv" style="height: 404px; overflow: hidden; margin: 0px auto; margin-top:40px;">
				<table id="footTableDiv" style="border-collapse: collapse;">
					<tr style="border-bottom: 1px solid black;;">
						<td style="width: 130px;font-weight:600; text-align:center;">평점
							<select id="point">
								<option value='1'>1점</option>
								<option value='2'>2점</option>
								<option value='3'>3점</option>
								<option value='4'>4점</option>
								<option selected="selected" value='5'>5점</option>
							</select>
						</td>
						<td style="text-align: left;padding-left: 10px;"><input id="RplyContent" type="text" placeholder="이곳에 댓글을 입력해주세요." style="width:500px; height: 50px; border:0; outline:0;"></td>
						<td><input id="addRply" type="button" value="등록"></td>
						<td><button id="allReplyView">모두보기</button></td>
					</tr>
					<tbody id="replyTbody">
						<c:forEach var="r" items="${ review }">
							<tr style="border-bottom: 1px solid #c1c1c1;;">
								<td style=" text-align:center;">${ r.er_point }점</td>
								<td style=" text-align:left;padding-left: 10px;">${ r.er_content }</td>
								<td>${ r.us_id }</td>
								<td style="width: 100px;">${ r.er_reg_d }</td>
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
				$('#RplyContent').val("");
				
				$.ajax({
					url:"replyAdd.search",
					data:{er_point:point, er_content:content, us_id:user, estate_id:estate_id},
					type:"post",
					datatype:"json",
					success:function(data){
						var $tbody = $('#replyTbody');
						$tbody.html('');
						for(var i = 0; i < data.length; i++){
							var $tr = $('<tr>').css('border-bottom','1px solid #c1c1c1');
							var $td1 = $('<td>').css('text-align','center').text(data[i].er_point +"점");
							var $td2 = $('<td>').css('text-align','left').css('padding-left','10px').text(data[i].er_content);
							var $td3 = $('<td>').text(data[i].us_id);
							var $td4 = $('<td>').css('width','100px').text(data[i].er_reg_d);
							
							$tr.append($td1);
							$tr.append($td2);
							$tr.append($td3);
							$tr.append($td4);
							$tbody.append($tr);
						}
					}
				});
			
			});
			
			var checkSize = 0;
			$('#allReplyView').click(function(){
				if(checkSize == 0){
					$('#replyDiv').css('height', 'auto');
					$(this).text('적게보기');
					checkSize = 1;
				} else {
					$('#replyDiv').css('height', '404px');
					$(this).text('모두보기');
					checkSize = 0;
				}
			});
		</script>
		
		<div class="detailInfoIndexTitle" id="index4">
			이 중개사의 다른방
		</div>
		<div style="text-align:right; margin: 10px auto; width: 1140px;">
			<button id="moreRoomView" style="margin-right: 26px;">방 더보기</button>
			<script>
				$('#moreRoomView').click(function(){
					$('#relativeOtherRoomInfo').css('height','auto');
				});
			</script>
		</div>
		<div id="relativeOtherRoomInfo" style="margin-bottom: 90px;">
			<c:forEach var="p" items="${ productList }" varStatus="status">
     		
	        <div class="productContent" onclick="goDetailPage(this)">
		        <img alt="${ p.p_picture }" src="resources/buploadFiles/${ fn:substring(p.p_picture,1,21) }" width="97%" height="100px">
		        <span class="kind">${ p.p_kind }</span>
		        
			        <span class="deal">${ p.p_deal }</span>
			        <span class="charter">
			        	<c:if test="${ p.p_deal == '전세' }">
			        		${ p.p_charter }
			        	</c:if>
			        	<c:if test="${ p.p_deal == '월세' }">
			        		${ p.p_deposit }/${ p.p_rent }
			        	</c:if>
			        </span>
		        
		        <span class="content">${ p.p_content }</span>
		        <span class="addre" id="addSpan" name="addSpan${ status.index }">${ p.p_addr }</span>
		        <input type="hidden" value="${ p.p_id }">
	        </div>
	        
     	</c:forEach>
		</div>
		<script>
			function goDetailPage(thisInfo){
	  			var p_id = $(thisInfo).children(":last").val();
	  			location.href="searchRoomDetailPage.search?p_id="+p_id;
	  		}
		</script>
		
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
		/* 이미지 원본으로 보기 */
		var img = document.getElementsByTagName("img");
		for (var x = 0; x < img.length; x++) {
			img.item(x).onclick=function() {window.open(this.src)}; 
		}
	</script>
	
	
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
                 content: '<div style="color:lightslategrey;width:150px;text-align:center;padding:6px 0;">${ product.p_addr }</div>'
             });
             infowindow.open(map, marker);
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
             map.setCenter(coords);
         }
     });
  </script>
</body>
</html>