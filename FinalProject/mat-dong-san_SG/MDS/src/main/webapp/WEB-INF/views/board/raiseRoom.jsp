<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/member-style.css" type="text/css">
    <title>salePost</title>
    <style>
    	.text{ font-size:20px;}
    	table {
    		heigh:auto; width:70%; 
   			border: 1px solid #444444;
    		border-collapse: collapse;
    		margin-left:15%;
  		}
  		th, td {
    		border: 1px solid #444444;
  		}
  		td{
  			height: 50px;
  		}
  		.select_btn{
  			height: 40px ; width: 100px;
  		}
  		.select_btn2{
  			height: 40px ; width: 90px;
  		}
    </style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div>
		<div style="text-align:center;">
			<h1> 매물올리기</h1>
			<span class="text">당신은 집주인입니까?</span>
			<input type="radio" name="chk_info" value="YES"><span class="text">네, 집주인입니다.</span>
			<input type="radio" name="chk_info" value="NO"><span class="text">아니요, 세입자입니다.</span>
			<div style="heigh:auto; width:70%; margin-left:15%; text-align:left; background-color:#C4C1C1;">
				<br>
				&nbsp;- 전/월세 매물만 등록할 수 있습니다.<br>
				&nbsp;- 개의 매물만 등록 가능하며, 맛동산에서 직거래로 표시됩니다.<br>
				&nbsp;- 등록한 매물은 한달간 노출됩니다.
				<br>
				<br>
			</div>
		</div>
		<br>
		<table>
			<tr style="text-align:center;">
				<!-- <td colspan='2'> <div style="width:70%; float:left"> 매물 종류 </div><div style="text-align: left; width:20%; float:right"> sdfsdf</div> </td> -->
				<td colspan='2'>매물 종류</td>
			</tr>
			<tr>
				<td style="width:130px; text-align:center;  background-color:#C4C1C1;"> 종료 선택 </td>
				<td style="margin-left:5%">
					<button type="button" class = "select_btn" id= "oneroom1">원룸</button> 
					<button type="button" class = "select_btn" id= "tworoom1">투룸</button> 
					<div id="divdiv1">
						<input type="radio" name="p_kind" id="oneroom2" value="원룸" checked>
						<input type="radio" name="p_kind" id="tworoom2" value="투룸">
					</div>
					<!-- jQuery와 Postcodify를 로딩한다. -->
					<!-- <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script> -->
 					<script>
		               $(function(){
		            	   $("#oneroom1").css({'background':'darkgray'});
		                   $("#divdiv1").hide();  
		                   $("#oneroom1").click(function(){
		                      $("#oneroom2").click();
		                   	  $(this).css({'background':'darkgray'});
		                      $("#tworoom1").css('background', '');
		                   });
		                   $("#tworoom1").click(function(){
		                      $("#tworoom2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#oneroom1").css('background', '');
		                   });
		               });
		           	</script>	
				</td>
			</tr>
			<tr>
				<td style="text-align:center;"> 건물 유형 </td>
				<td style="margin-left:10%"> 
					<button type="button" class = "select_btn" id= "hs1">단독주택</button> 
					<button type="button" class = "select_btn" id= "mt_hs1">다가구주택</button> 
					<button type="button" class = "select_btn" style="width:auto" id= "vyd1">빌라/연림/다세대</button> 
					<button type="button" class = "select_btn" id= "cc_hs1">상가주택</button> 
					<div id="divdiv2">
						<input type="radio" name="p_type" id="hs2" value="단독주택" checked>
						<input type="radio" name="p_type" id="mt_hs2" value="다가구주택">
						<input type="radio" name="p_type" id="vyd2" value="빌라/연림/다세대">
						<input type="radio" name="p_type" id="cc_hs2" value="상가주택">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv2").hide();
		                   $("#hs1").css({'background':'darkgray'});
		                   $("#hs1").click(function(){
		                      $("#hs2").click();
		                   	  $(this).css({'background':'darkgray'});
		                      $("#mt_hs1").css('background', '');
		                      $("#vyd1").css('background', '');
		                      $("#cc_hs1").css('background', '');
		                   });
		                   $("#mt_hs1").click(function(){
		                      $("#mt_hs2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#hs1").css('background', '');
		                      $("#vyd1").css('background', '');
		                      $("#cc_hs1").css('background', '');
		                   });
		                   $("#vyd1").click(function(){
			                  $("#vyd2").click();
			                  $(this).css({'background':'darkgray'});
			                  $("#hs1").css('background', '');
			                  $("#mt_hs1").css('background','');
			                  $("#cc_hs1").css('background', '');
			               });
		                   $("#cc_hs1").click(function(){
			                  $("#cc_hs2").click();
			                  $(this).css({'background':'darkgray'});
			                  $("#hs1").css('background', '');
			                  $("#mt_hs1").css('background', '');
			                  $("#vyd1").css('background', '');
			               });
		               });
		           	</script>	
				</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td colspan='2' style="text-align:center;" > 위치 정보  </td>
			</tr>
			<tr>
				<td style="text-align:center; width:130px">주소</td>
				<td style="text-align:left;">
					<br>
					&nbsp; <span style="font-size:13px">( 도로명, 건물명, 지번에 대해 통합검색이 가능합니다.)</span>
					<input type="textarea" class="postcodify_address" name="p_addr" style="width:80%; height:80px; float:left">
					<button type="button" id="postcodify_search_button" style="float:right; width:13%; margin-right:2%; height:80px">검색</button>
					<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
					<br><br><br><br><br><br>
					&nbsp;&nbsp;  상세주소 :  <input type="text" style="width:300px" name="p_room"><br><br><!-- 상세주소=방호수 -->
				</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td colspan='2' style="text-align:center;"> 거래 정보</td> 
			</tr>
			<tr>
				<td style="text-align:center;width:130px">거래 종류</td>
				<td> 
					<button type="button" class = "select_btn" id= "monthly1">월세</button> 
					<button type="button" class = "select_btn" id= "charter1">전세</button> 
					<div id="divdiv3">
						<input type="radio" name="p_deal" id="monthly2" value="월세" checked>
						<input type="radio" name="p_deal" id="charter2" value="전세">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv3").hide();  
		                   $("#monthly1").css({'background':'darkgray'});
		                   $("#monthly1").click(function(){
		                      $("#monthly2").click();
		                   	  $(this).css({'background':'darkgray'});
		                      $("#charter1").css('background', '');
		                   });
		                   $("#charter1").click(function(){
		                      $("#charter2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#monthly1").css('background', '');
		                   });
		               });
		           	</script>	
				</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td colspan="4"> 기본 정보 </td>
			</tr>
			<tr>
				<td rowspan="2" style="width:130px"> 거래 크기 </td>
				<td>
					공급 면적 <input type="text" style="width:60px"> 평 <input type="text" style="width:60px"> ㎡
				</td>
				<td rowspan="2" style="width:130px"> 건물 층수 </td>
				<td>
					건물 층수 
					<select name="p_floor" >
						<option value="1층" selected>1층</option>	
						<option value="2층" >2층</option>	
						<option value="3층" >3층</option>	
						<option value="4층" >4층</option>	
						<option value="5층" >5층</option>	
						<option value="6층" >6층</option>	
						<option value="7층" >7층</option>	
						<option value="8층" >8층</option>	
						<option value="9층" >9층</option>	
						<option value="10층" >10층</option>	
						<option value="11층" >11층</option>	
						<option value="12층" >12층</option>	
						<option value="13층" >13층</option>	
						<option value="14층" >14층</option>	
						<option value="15층" >15층</option>	
						<option value="16층" >16층</option>	
						<option value="17층" >17층</option>	
						<option value="18층" >18층</option>	
						<option value="19층" >19층</option>	
						<option value="20층" >20층</option>				
					</select>
				</td>
			</tr>
			<tr>
				<td> 
					전용 면적 <input type="text" style="width:60px"> 평 <input type="text" style="width:60px"> ㎡
				</td>
				<td>
					해당 층수 
					<select name="p_laer" >
						<option value="1층" selected>1층</option>	
						<option value="2층" >2층</option>	
						<option value="3층" >3층</option>	
						<option value="4층" >4층</option>	
						<option value="5층" >5층</option>	
						<option value="6층" >6층</option>	
						<option value="7층" >7층</option>	
						<option value="8층" >8층</option>	
						<option value="9층" >9층</option>	
						<option value="10층" >10층</option>	
						<option value="11층" >11층</option>	
						<option value="12층" >12층</option>	
						<option value="13층" >13층</option>	
						<option value="14층" >14층</option>	
						<option value="15층" >15층</option>	
						<option value="16층" >16층</option>	
						<option value="17층" >17층</option>	
						<option value="18층" >18층</option>	
						<option value="19층" >19층</option>	
						<option value="20층" >20층</option>				
					</select>
				</td>
			</tr>
			<tr>
				<td> 난방 종류 </td>
				<td> 
					난방 종류 선택 
					<select name="p_heat" >
						<option value="중앙난방" >중앙난방</option>	
						<option value="개별난방" >개별난방</option>	
						<option value="지역난방" >지역난방</option>	
					</select>
				</td>
				<td>
					입주 가능일
				</td>
				<td>
					날짜 선택 : <input type="date" name="p_en_d" required>
				</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td colspan="4">
					추가 정보
				</td>
			</tr>
			<tr>
				<td rowspan="2" style="width:120px">
					관리비
				</td>
				<td colspan="3" style="width:250px">
					&nbsp;&nbsp;<input type="text" name="p_cost">&nbsp;만원 
				</td>
			</tr>
			<tr>
				<td colspan="3">
					관리비 항목 :
					<button type="button" class = "select_btn2" id= "internet1">인터넷</button> 
					<button type="button" class = "select_btn2" id= "cable_TV1">유선TV</button> 
					<button type="button" class = "select_btn2" id= "cleaning_fee1">청소비</button> 
					<button type="button" class = "select_btn2" id= "water_tax1">수도세</button> 
					<button type="button" class = "select_btn2" id= "electricity_fee1">전기세</button>
					<button type="button" class = "select_btn2" id= "other1">기타</button> 
					<div id="divdiv4">
						<input type="checkbox" name="p_cost_item" id="internet2" value="인터넷">
						<input type="checkbox" name="p_cost_item" id="cable_TV2" value="유선TV">
						<input type="checkbox" name="p_cost_item" id="cleaning_fee2" value="청소비">
						<input type="checkbox" name="p_cost_item" id="water_tax2" value="수도세">
						<input type="checkbox" name="p_cost_item" id="electricity_fee2" value="전기세">
						<input type="checkbox" name="p_cost_item" id="other2" value="기타">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv4").hide(); 
		                   
		                   $("#internet1").click(function(){
		                      $("#internet2").click();
		                      if($("#internet2").is(":checked") == true){
		                    	  $(this).css({'background':'darkgray'});
		                      } else {
		                    	  $(this).css({'background':''});
		                      }
		                   });
		                   $("#cable_TV1").click(function(){
			                      $("#cable_TV2").click();
			                      if($("#cable_TV2").is(":checked") == true){
			                    	  $(this).css({'background':'darkgray'});
			                      } else {
			                    	  $(this).css({'background':''});
			                      }
			                   });
		                   $("#cleaning_fee1").click(function(){
			                      $("#cleaning_fee2").click();
			                      if($("#cleaning_fee2").is(":checked") == true){
			                    	  $(this).css({'background':'darkgray'});
			                      } else {
			                    	  $(this).css('background','RGB(221,228,236)');
			                    	  $(this).css({'background':''});
			                      }
			                   });
		                   $("#water_tax1").click(function(){
			                      $("#water_tax2").click();
			                      if($("#water_tax2").is(":checked") == true){
			                    	  $(this).css({'background':'darkgray'});
			                      } else {
			                    	  $(this).css('background','RGB(221,228,236)');
			                    	  $(this).css({'background':''});
			                      }
			                   });
		                   $("#electricity_fee1").click(function(){
			                      $("#electricity_fee2").click();
			                      if($("#electricity_fee2").is(":checked") == true){
			                    	  $(this).css({'background':'darkgray'});
			                      } else {
			                    	  $(this).css('background','RGB(221,228,236)');
			                    	  $(this).css({'background':''});
			                      }
			                   });
		                   $("#other1").click(function(){
			                      $("#other2").click();
			                      if($("#other2").is(":checked") == true){
			                    	  $(this).css({'background':'darkgray'});
			                      } else {
			                    	  $(this).css('background','RGB(221,228,236)');
			                    	  $(this).css({'background':''});
			                      }
			                   });
		               });
		           	</script>	
				</td>
			</tr>
			<tr>
				<td>
					주차여부
				</td>
				<td>
					<br>
					<button type="button" class = "select_btn" id="no_parking1">불가능</button> 
					<button type="button" class = "select_btn" id="yes_parking1">가능</button> 
					<div id="divdiv5">
						<input type="radio" name="p_park" id="no_parking2" value="불가능" checked>
						<input type="radio" name="p_park" id="yes_parking2" value="가능">
					</div>
					<input type="text" id="parking_money" style="width:40px"> 만원

				</td>
				<td>
					반려동물
				</td>
				<td>
					<button type="button" class = "select_btn" id= "no_pet1">불가능</button> 
					<button type="button" class = "select_btn" id= "yes_pet1">가능</button> 
					<div id="divdiv6">
						<input type="radio" name="p_pet" id="no_pet2" value="불가능" checked>
						<input type="radio" name="p_pet" id="yes_pet2" value="가능">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv5").hide();  
		                   $("#no_parking1").css({'background':'darkgray'});
		                   $("#no_parking1").click(function(){
		                      $("#no_parking2").click();
		                   	  $(this).css({'background':'darkgray'});
		                      $("#yes_parking1").css('background', '');
		                   });
		                   $("#yes_parking1").click(function(){
		                      $("#yes_parking2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#no_parking1").css('background', '');
		                   });
		               });
		               $(function(){
		                   $("#divdiv6").hide();  
		                   $("#no_pet1").css({'background':'darkgray'});
		                   $("#no_pet1").click(function(){
		                      $("#no_pet2").click();
		                   	  $(this).css({'background':'darkgray'});
		                      $("#yes_pet1").css('background', '');
		                   });
		                   $("#yes_pet1").click(function(){
		                      $("#yes_pet2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#no_pet1").css('background', '');
		                   });
		               });
		           	</script>	
				</td>
			</tr>
			<tr>
				<td>
					엘리베이터
				</td>
				<td style="width:350px">
					<button type="button" class = "select_btn" id= "no_elevator1">없음</button> 
					<button type="button" class = "select_btn" id= "yes_elevator1">있음</button> 
					<div id="divdiv7">
						<input type="radio" name="p_elevator" id="no_elevator2" value="없음" checked>
						<input type="radio" name="p_elevator" id="yes_elevator2" value="있음">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv7").hide();  
		                   $("#no_elevator1").css({'background':'darkgray'});
		                   $("#no_elevator1").click(function(){
		                      $("#no_elevator2").click();
		                   	  $(this).css({'background':'darkgray'});
		                      $("#yes_elevator1").css('background', '');
		                   });
		                   $("#yes_elevator1").click(function(){
		                      $("#yes_elevator2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#no_elevator1").css('background', '');
		                   });
		               });
		           	</script>	
				</td>
				<td>
					베란다/발코니
				</td>
				<td>
					<button type="button" class = "select_btn" id= "no_veranda1">없음</button> 
					<button type="button" class = "select_btn" id= "yes_veranda1">있음</button> 
					<div id="divdiv8">
						<input type="radio" name="p_veranda" id="no_veranda2" value="불가능" checked>
						<input type="radio" name="p_veranda" id="yes_veranda2" value="가능">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv8").hide();  
		                   $("#no_veranda1").css({'background':'darkgray'});
		                   $("#no_veranda1").click(function(){
		                      $("#no_veranda2").click();
		                   	  $(this).css({'background':'darkgray'});
		                      $("#yes_veranda1").css('background', '');
		                   });
		                   $("#yes_veranda1").click(function(){
		                      $("#yes_veranda2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#no_veranda1").css('background', '');
		                   });
		               });
		           	</script>	
				</td>
			</tr>
			<tr>
				<td>
					빌트인
				</td>
				<td>
					<button type="button" class = "select_btn" id= "no_built_in1">없음</button> 
					<button type="button" class = "select_btn" id= "yes_built_in1">있음</button> 
					<div id="divdiv9">
						<input type="radio" name="p_built_in" id="no_built_in2" value="불가능" checked>
						<input type="radio" name="p_built_in" id="yes_built_in2" value="가능">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv9").hide();  
		                   $("#no_built_in1").css({'background':'darkgray'});
		                   $("#no_built_in1").click(function(){
		                      $("#no_built_in2").click();
		                   	  $(this).css({'background':'darkgray'});
		                      $("#yes_built_in1").css('background', '');
		                   });
		                   $("#yes_built_in1").click(function(){
		                      $("#yes_built_in2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#no_built_in1").css('background', '');
		                   });
		               });
		           	</script>	
				</td>
				<td>
					구조
				</td>
				<td>
					<button type="button" class = "select_btn" id= "duplex1">복층</button> 
					<button type="button" class = "select_btn" id= "kst1">있음</button> 
					<div id="divdiv10">
						<input type="checkbox" name="p_str" id="duplex2" value="복층" >
						<input type="checkbox" name="p_str" id="kst2" value="1.5룸/주방분리형">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv10").hide();  
		                   $("#duplex1").click(function(){
		                      $("#duplex2").click();
		                      if($("#duplex2").is(":checked") == true){
		                   	  	$(this).css({'background':'darkgray'});
		                      } else {
		                      	$(this).css('background', '');
		                      }
		                   });
		                   $("#kst1").click(function(){
		                      $("#kst2").click();
		                      if($("#kst2").is(":checked") == true){
		                      	$(this).css({'background':'darkgray'});
		                      } else {
		                      	$(this).css('background', '');
		                      }
		                   });
		               });
		           	</script>
				</td>
			</tr>
			<tr>
				<td>
					옵션항목
				</td>
				<td colspan="3">
					<button type="button" class = "select_btn2 abc" id= "air_conditioner1">에어컨</button> 
					<button type="button" class = "select_btn2 abc" id= "washer1">세탁기</button> 
					<button type="button" class = "select_btn2 abc" id= "bed1">침대</button> 
					<button type="button" class = "select_btn2 abc" id= "desk1">책상</button> 
					<button type="button" class = "select_btn2 abc" id= "closet1">옷장</button> 
					<button type="button" class = "select_btn2 abc" id= "tv1">TV</button> 
					<button type="button" class = "select_btn2 abc" id= "shoe_closet1">신발장</button> 
					<button type="button" class = "select_btn2 abc" id= "refrigerator1">냉장고</button> 
					<button type="button" class = "select_btn2 abc" id= "gas_range1">가스레인지</button> 
					<button type="button" class = "select_btn2 abc" id= "induction1">인덕션</button> 
					<button type="button" class = "select_btn2 abc" id= "microwave1">전자레인지</button> 
					<button type="button" class = "select_btn2 abc" id= "electronic_door_lock1">전자도어락</button> 
					<button type="button" class = "select_btn2 abc" id= "bidet1">비데</button> 
 					<div id="divdiv11">
						<input type="checkbox" name="p_option" class = "abc2" id="air_conditioner2" value="에어컨" >
						<input type="checkbox" name="p_option" class = "abc2"id="washer2" value="세탁기">
						<input type="checkbox" name="p_option" class = "abc2"id="bed2" value="침대">
						<input type="checkbox" name="p_option" class = "abc2"id="desk2" value="책상">
						<input type="checkbox" name="p_option" class = "abc2"id="closet2" value="옷장">
						<input type="checkbox" name="p_option" class = "abc2"id="tv2" value="TV">
						<input type="checkbox" name="p_option" class = "abc2"id="shoe_closet1" value="신발장">
						<input type="checkbox" name="p_option" class = "abc2"id="refrigerator2" value="냉장고">
						<input type="checkbox" name="p_option" class = "abc2"id="gas_range2" value="가스레인지">
						<input type="checkbox" name="p_option" class = "abc2"id="induction2" value="인덕션">
						<input type="checkbox" name="p_option" class = "abc2"id="microwave" value="전자레인지">
						<input type="checkbox" name="p_option" class = "abc2"id="electronic_door_lock2" value="전자도어락">
						<input type="checkbox" name="p_option" class = "abc2"id="bidet2" value="전자도어락">
					</div>
					<script>
		               $(function(){
		                    $("#divdiv11").hide();  
		                   
		                  /*  $(".abc").click(function(){
			                      $(this).click();
			                      if($(".abc2").is(":checked") == true){
			                   	  	$(this).css({'background':'darkgray'});
			                      } else {
			                      	$(this).css('background', '');
			                      }
		                   }); */
		                   
/* /* 		                   $(".abc").click(function(){
		                	   console.log($(this).text());
		                	   console.log($(this).html());
		                   }) */
		               }); 
		           	</script>
				</td>
			</tr>
			<tr>
				<td>
					전세자금대출
				</td>
				<td>
					<button type="button" class ="select_btn" id="no_loan1">불가능</button> 
					<button type="button" class ="select_btn" id="yes_loan1">가능</button> 
					<div id="divdiv12">
						<input type="radio" name="p_loan" id="no_loan2" value="불가능" checked>
						<input type="radio" name="p_loan" id="yes_loan2" value="가능">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv12").hide();   
		                   $("#no_loan1").css({'background':'darkgray'});
		                   $("#no_loan1").click(function(){
		                      $("#no_loan2").click();
		                   	  $(this).css({'background':'darkgray'});
		                      $("#yes_loan1").css('background', '');
		                   });
		                   $("#yes_loan1").click(function(){
		                      $("#yes_loan2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#no_loan1").css('background', '');
		                   });
		               });
		           	</script>	
				</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td colspan="2">
					상세 설명
				</td>
			</tr>
			<tr>
				<td style="width:120px">
					제목
				</td>
				<td>
					<input type="text" placeholder = "제목을 입력해주세요." style="width:80%">
				</td>
			</tr>
			<tr>
				<td>
					상세 설명
				</td>
				<td>
					<textarea placeholder="상세설명 작성 주의사항  &#13;&#10;&#13;&#10;- 방 정보와 관련없는 홍보성 정보는 입력하실 수 없습나다.(홈페이지 주소, 블로그,SNS,메신저ID,전화번호,이메일 등)&#13;&#10;- 중개수수료를 언급한 내용은 입력할 수 없습니다.(중개수수료 무료,꽁짜,반값 등)&#13;&#10; &#13;&#10;*주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다.&#13;&#10;*다방의 매물등록 규정에 위반되는 금칙어는 등록이 불가합니다."
				style="width:80%; height:200px; resize: none;"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					비공개 메모
				</td>
				<td>
					<textarea placeholder="외부에 공개되지 않으며, 등록자에게만 보이는 메모입니다." style="width:80%; height:60px; resize: none;"></textarea>
				</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td>
					사진등록
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<div style="width:95%; height:auto; border:1px solid black; margin-left:2.5%">
					   &nbsp;- 사진은 최소 3장 및 최대 10장 까지 등록 가능합니다.
					   <br>
   					   &nbsp;- 사진은 가로로 찍은 사진을 권장합니다.
					</div>
					<br>
					<label for="gdsImg">이미지</label>
					<div style="width:auto; height:auto; border:1px solid black;">
 						<input multiple="multiple" type="file" id="gdsImg" name="file">
 						<div class="select_img">
   							<img src="" id="gdsImg1" style="width:18%; height:150px;" /> 
						</div>
						<input type="button" id="delete" value="삭제">
						<script>
						  $("#gdsImg").change(function(){
						   if(this.files && this.files[0]) {
						    var reader = new FileReader;
						    reader.onload = function(data) {
						     $("#gdsImg1").attr("src", data.target.result).width(200);             
						    }
						    reader.readAsDataURL(this.files[0]);
						   }
						  });
						  $("#delete").click(function(){
								$("#gdsImg").val('');  
								$("#gdsImg1").attr("src",'');     
						  });
						</script>
					</div>
				</td>
			</tr>
		</table>
		
		<div style="margin-left:30%">
			<input type="checkbox">매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.
			<br>
			<input type="reset" value="취소하기" style="margin-left:20%">
			<button onclick="return a();"> 가입하기 </button>
		</div>
	</div>
	<br>
</body>
</html>