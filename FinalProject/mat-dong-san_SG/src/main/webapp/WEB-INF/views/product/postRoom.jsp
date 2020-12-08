<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/member-style.css" type="text/css">
    <title>salePost</title>
<style>
html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}
.text{ font-size:20px;}
table {
    heigh:auto; width:1000px; 
   	border: 1px solid #444444;
    border-collapse: collapse;
    margin:0px auto;
}
.td1{
	text-align:center;  
	background-color: #D8D8D8;
	width:130px;
}
tr:nth-child(1){
	text-align:center;  
	font-weight:bold;
}
td{
  	height: 50px;
  	border: 1px solid #444444;
 }
.select_btn{
  	height: 40px ; width: 100px;
  	cursor: pointer;
 }
.select_btn2{
  	height: 40px ; width: 90px;
  	cursor: pointer;
 }
 .p_text{
 	width: 70px;
 }
 .select_img{
 	width:950px;
 	border:1px solid grey;
 	height:400px;
 	margin: 0px auto;
 	margin-top : 1%;
 	margin-bottom : 1%;
 }
 .button2 {
    width:100px;
    background-color: white;
    border: 1px soild black;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;
}
.button3 {
    width:100px;
    background-color: grey;
    border: 1px solid black;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;
}

#selectDelete{
	margin-left: 400px;
}
#select{
	background-color: #81BEF7;
	border: none;
	color:#fff;
	width:100px;
	height:30px;
	cursor: pointer;
	border-radius:10px;
}
#delete{
	background-color: #81BEF7;
	border: none;
	color:#fff;
	width:100px;
	height:30px;
	cursor: pointer;
	border-radius:10px;
}
 
#postcodify_search_button{
	float:right; 
	width:13%;
	margin-right:2%;
	height:80px;
	cursor: pointer;
	border-radius:10px;
	color:#fff;
	background-color: grey;
	border: none;
	font-size: 18px;
}
</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp"/>
	<!-- 첨부파일 등록을 위해 Multipart/form-data encType 지정 -->
	<form action="postRoom.bo" method="post" id="postRoomConfirm" enctype="Multipart/form-data">
	<input type="hidden" name="us_id" value="${loginUser.us_id}">
	<input type="hidden" id="us_type" name="us_type" value="${loginUser.us_type}">
	<input type="hidden" name="p_id" value=1><!-- 초기값만 설정 -->
	<div>
		<div style="text-align:center; width:1000px; margin:0px auto;">
			<h1> 매물올리기</h1>
<!-- 			<span class="text">당신은 집주인입니까?</span>
			<input type="radio" name="chk_info" value="YES"><span class="text">네, 집주인입니다.</span>
			<input type="radio" name="chk_info" value="NO"><span class="text">아니요, 세입자입니다.</span> -->
			<c:if test="${loginUser.us_type eq '중개사' }">
				<h2> - 당신은 중개사입니다. -</h2>
			</c:if>
			<c:if test="${loginUser.us_type eq '일반' }">
				<h2> - 당신은 일반회원입니다. -</h2>
			</c:if>
			<div style="heigh:auto; width:1000px; text-align:left; background-color:#C4C1C1;">
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
				<td class="td1"> 종류 선택 </td>
				<td style="margin-left:5%">&nbsp;
					<button type="button" class = "select_btn" id= "oneroom1">원룸</button> 
					<button type="button" class = "select_btn" id= "tworoom1">투룸</button>
					<button type="button" class = "select_btn" id= "threeroom1">쓰리룸</button>  
					<div id="divdiv1">
						<input type="radio" name="p_kind" id="oneroom2" value="원룸" checked>
						<input type="radio" name="p_kind" id="tworoom2" value="투룸">
						<input type="radio" name="p_kind" id="threeroom2" value="쓰리룸">
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
		                      $("#threeroom2").css('background', '');
		                   });
		                   $("#tworoom1").click(function(){
		                      $("#tworoom2").click();
		                      $(this).css({'background':'darkgray'});
		                      $("#oneroom1").css('background', '');
		                      $("#threeroom2").css('background', '');
		                   });
		                   $("#threeroom1").click(function(){
			                  $("#tworoom2").click();
			                  $(this).css({'background':'darkgray'});
			                  $("#oneroom1").css('background', '');
			                  $("#tworoom1").css('background', '');
			               });
		               });
		           	</script>	
				</td>
			</tr>
			<tr>
				<td class="td1"> 건물 유형 </td>
				<td style="margin-left:10%"> &nbsp;
					<button type="button" class = "select_btn" id= "hs1">단독주택</button> 
					<button type="button" class = "select_btn" id= "mt_hs1">다가구주택</button> 
					<button type="button" class = "select_btn" style="width:auto" id= "vyd1">빌라/연림/다세대</button> 
					<button type="button" class = "select_btn" id= "cc_hs1">상가주택</button> 
					<div id="divdiv2">
						<input type="radio" name="p_field" id="hs2" value="단독주택" checked>
						<input type="radio" name="p_field" id="mt_hs2" value="다가구주택">
						<input type="radio" name="p_field" id="vyd2" value="빌라">
						<input type="radio" name="p_field" id="cc_hs2" value="상가주택">
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
				<td class="td1">주소</td>
				<td style="text-align:left;">
					<br>
					&nbsp; <span style="font-size:13px">( 도로명, 건물명, 지번에 대해 통합검색이 가능합니다.)</span>
					<input type="text" class="postcodify_address" name="p_addr" style="width:80%; height:80px; float:left; margin-left:1%" required>
					<button type="button" id="postcodify_search_button" >검색</button>
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
					<br><br><br><br><br><br>	
					<div style="float:left">
						&nbsp;&nbsp; · 방 호수 및 상세주소 : <input type="text" class="p_text" style="width:250px" name="p_room" required ><br><br><!-- 상세주소=방호수 --> 				    
					</div>
					<div style="float:left; margin-left:10%">
					· 방향
						<select name="p_dir">
				 	    	<option value="동향">동향</option> 	
							<option value="서향">서향</option>
							<option value="남향">남향</option>
							<option value="북향">북향</option>
					    </select>
					 </div>
				</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td colspan='4' style="text-align:center;"> 거래 정보</td> 
			</tr>
			<tr>
				<td class="td1">거래 종류</td>
				<td> 
					<button type="button" class = "select_btn2" id= "monthly1" style="margin-left:10px">월세</button> 
					<input type="text" id="monthly3" class="p_text" name="p_rent" numberOnly required > /
					<input type="text" id="monthly4"class="p_text"  name="p_deposit" numberOnly required> 만원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class = "select_btn2" id= "charter1">전세</button>
					<input type="text" id="charter3" class="p_text"  name="p_charter" numberOnly required> 만원
					<div id="divdiv3">
						<input type="radio" name="p_deal" id="monthly2" value="월세" checked>
						<input type="radio" name="p_deal" id="charter2" value="전세">
					</div>
					<script>
		               $(function(){
		                   $("#divdiv3").hide();
		                   $("#charter3").attr("required" , false);
		                   $("#monthly1").css({'background':'darkgray'});
		                   $("#monthly3").attr("readonly",false).attr("disabled",false);
		                   $("#monthly4").attr("readonly",false).attr("disabled",false);
		                   $("#charter3").attr("readonly",true).attr("disabled",false);
		                   $("input:text[numberOnly]").on("keyup", function() {
		                	   if( $(this).val() != null && $(this).val() != '' ) {
		                		   $(this).val( $(this).val().replace(/[^\.0-9]/g, '') );
		                		   }
		                	});
		                   
/* 		                   $("input:text[numberOnly]").on("keyup", function() {
		                	      $(this).val($(this).val().replace(/[^0-9]/g,""));
		                	}); */
		                   
		                   $("#monthly1").click(function(){
		                	   	  $("#monthly2").click();
			                	  $(this).css({'background':'darkgray'});
			                	  $("#monthly3").attr("readonly",false).attr("disabled",false);
			                	  $("#monthly4").attr("readonly",false).attr("disabled",false);
			                	  $("#charter1").css({'background':''});
			                	  $("#charter3").attr("readonly",true).attr("disabled",false);
			                	  $("#charter3").text('');
			                	  $("#monthly3").attr("required" , true);
			                	  $("#monthly4").attr("required" , true);
			                	  $("#charter3").attr("required" , false);
			                	  $("#charter3").val('');
		                   });
		                   $("#charter1").click(function(){
		                	   	   $("#charter2").click();
		                		   $(this).css({'background':'darkgray'});
		                		   $("#charter3").attr("readonly",false).attr("disabled",false);
		                		   $("#monthly1").css({'background':''});
				                   $("#monthly3").attr("readonly",true).attr("disabled",false);
				                   $("#monthly4").attr("readonly",true).attr("disabled",false);
				                   $("#monthly3").text(''); $("#monthly4").text('');
				                   $("#charter3").attr("required" , true);
				                   $("#monthly3").attr("required" , false);
				               	   $("#monthly4").attr("required" , false);
				               	   $("#monthly3").val('');
				               	   $("#monthly4").val('');
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
				<td rowspan="2" class="td1"> 거래 크기 </td>
				<td>
					<div style="float:left">&nbsp;공급 면적&nbsp;</div> 
					<input type="text" id="text1" name="p_s_size"class="p_text" style="float:left" numberOnly required > 
					<div style="float:left">&nbsp;평&nbsp; </div>
					<div id="text2" style="float:left" ></div>㎡ 
					<!-- <input type="text" id="text2" name="p_s_size2" class="p_text" value="0"> ㎡   -->
				</td>
				<script>
	             var newValue;
	             $("#text1").on("propertychange change keyup paste input", function() {
	                newValue = $(this).val()*3.305785;
	                $("#text2").text(newValue);
	             });
				</script>
				
<!-- 				<script>
					$(document).ready(function(){
						// 입력란에 입력을 하면 입력내용에 내용이 출력
						// 1. #data 공간에서 keyup이라는 이벤트가 발생했을 
						$("#text1").keyup(function(){
							// 2. #out 공간에 #data의 내용이 출력된다.
							$("#text2").text($("#text1").val());
							// #out의 위치에 text로 데이터를 받는다.(setter)
							// 들어가는 데이터는 #data의 값(.val())이다. (getter)
							// 메서드 괄호 안에 아무것도 없으면 getter, 파라미터가 있으면 setter이다.
						});
					});
				</script> -->
				
				<td rowspan="2" class="td1">건물 층수 </td>
				<td>
					&nbsp;건물 층수 
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
				<td style="width:400px"> 
					<div style="float:left">&nbsp;전용 면적&nbsp; </div>
					<input type="text" id="text3" name="p_d_size"class="p_text" style="float:left" numberOnly required >
					<div style="float:left">&nbsp;평&nbsp;</div>
					<div id="text4" style="float:left"></div>㎡ 
					<!-- <input type="text" name="p_d_size2" class="p_text"> ㎡ -->
				</td>
				<script>
	             var newValue2;
	             $("#text3").on("propertychange change keyup paste input", function() {
	                newValue2 = $(this).val()*3.305785;
	                $("#text4").text(newValue2);
	             });
				</script>
				<td>
					&nbsp;해당 층수 
					<select name="p_layer">
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
				<td class="td1"> 난방 종류</td>
				<td>&nbsp;
					<select name="p_heat" >
						<option value="중앙난방" >중앙난방</option>	
						<option value="개별난방" >개별난방</option>	
						<option value="지역난방" >지역난방</option>	
					</select>
				</td>
				<td class="td1">
					입주 가능일
				</td>
				<td>
					<!-- 날짜 선택 : <input type="date" name="p_en_d" required> -->
					&nbsp;날짜 선택 : <input type="date" name="p_en_d" required > 
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
				<td rowspan="2" class="td1">
					관리비
				</td>
				<td colspan="3" style="width:250px">
					&nbsp;&nbsp;<input type="text" name="p_cost" numberOnly required >&nbsp;만원 
				</td>
			</tr>
			<tr>
				<td colspan="3">
					&nbsp;관리비 항목 :
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
				<td class="td1">
					주차여부
				</td>
				<td>&nbsp;
					<button type="button" class = "select_btn" id="no_parking1">불가능</button> 
					<button type="button" class = "select_btn" id="yes_parking1">가능</button> 
					<div id="divdiv5">
						<input type="radio" name="p_park" id="no_parking2" value="불가능" checked>
						<input type="radio" name="p_park" id="yes_parking2" value="가능">
					</div>
				</td>
				<td class="td1">
					반려동물
				</td>
				<td>&nbsp;
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
				<td class="td1">
					엘리베이터
				</td>
				<td style="width:350px">&nbsp;
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
				<td class="td1">
					베란다/발코니
				</td>
				<td>&nbsp;	
					<button type="button" class = "select_btn" id= "no_veranda1">없음</button> 
					<button type="button" class = "select_btn" id= "yes_veranda1">있음</button> 
					<div id="divdiv8">
						<input type="radio" name="p_verander" id="no_veranda2" value="불가능" checked>
						<input type="radio" name="p_verander" id="yes_veranda2" value="가능">
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
				<td class="td1">
					빌트인
				</td>
				<td>&nbsp;
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
				<td class="td1">
					구조
				</td>
				<td style="margin:0px">&nbsp;	
					<button type="button" class = "select_btn" id= "duplex1">복층</button> 
					<button type="button" id= "kst1" style="width:150px;height:40px">1.5룸/주방분리형</button> 
					<div id="divdiv10">&nbsp;
						<input type="checkbox" name="p_str" id="duplex2" value="복층" >
						<input type="checkbox" name="p_str" id="kst2" value="1.5룸/주방분리형" style="width:100px">
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
				<td class="td1">
					옵션항목
				</td>
				<td colspan="3">
					<div style="margin-left:12px">
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "air_conditioner1" value="에어컨">에어컨</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "washer1" value="세탁기">세탁기</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "bed1" value="침대">침대</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "desk1" value="책상">책상</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "closet1" value="옷장">옷장</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "tv1" value="TV">TV</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "shoe_closet1" value="신발장">신발장</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "refrigerator1" value="냉장고">냉장고</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "gas_range1" value="가스레인지">가스레인지</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "induction1" value="인덕션">인덕션 </button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "microwave1" value="전자레인지">전자레인지</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "electronic_door_lock1" value="전자도어락">전자도어락</button> 
						<button type="button" class = "select_btn2 abc1" onclick="test(this);" id= "bidet1" value="비데">비데</button>
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
							<input type="checkbox" name="p_option" class = "abc2"id="bidet2" value="비데">
						</div>
					</div>
						<script>
							$(function(){
								$("#divdiv11").hide();
							})
							function test(thisName){
								var value = thisName.getAttribute('value');
								var id = thisName.getAttribute('id');
								for(var i = 1; i <= 13; i++){
									var tt = ".abc2:nth-child("+i+")";
									var dd = ".abc1:nth-child("+i+")";
									if(value == $(tt).val()){
										if($(tt).prop('checked')){
											$(tt).prop('checked',false);
											$(dd).css('background', '');
										} else {
											$(tt).prop('checked',true);
											$(dd).css('background','darkgray');
										}
									}
								}
							}						
						</script>
				</td>
			</tr>
			<tr>
				<td class="td1">
					전세자금대출
				</td>
				<td>&nbsp;
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
				<td class="td1">
					제목
				</td>
				<td>
					&nbsp;<input name="p_content1"type="text" placeholder = "제목을 입력해주세요." style="width:80%" required >
				</td>
			</tr>
			<tr>
				<td class="td1">
					상세 설명
				</td>
				<td>
					&nbsp;<textarea name="p_content2" placeholder="상세설명 작성 주의사항  &#13;&#10;&#13;&#10;- 방 정보와 관련없는 홍보성 정보는 입력하실 수 없습나다.(홈페이지 주소, 블로그,SNS,메신저ID,전화번호,이메일 등)&#13;&#10;- 중개수수료를 언급한 내용은 입력할 수 없습니다.(중개수수료 무료,꽁짜,반값 등)&#13;&#10; &#13;&#10;*주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다.&#13;&#10;*다방의 매물등록 규정에 위반되는 금칙어는 등록이 불가합니다."
				style="width:80%; height:200px; resize: none;"  required></textarea>
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
					   &nbsp;- 사진은 최소 1장 및 최대 8장 까지 등록 가능합니다.
					   <br>
   					   &nbsp;- 사진은 가로로 찍은 사진을 권장합니다.
   					   <br>
   					   &nbsp;- 첫번째 사진이 메인이 됩니다.
					</div>
					<br>
					<label for="gdsImg">이미지</label>
					
					<div style="width:auto; height:auto; border:1px solid black;">
 						<input multiple="multiple" type="file" id="gdsImg" name="file[]" required>
 						<br>
 						<div id="selectDelete">
	 						<input type="button" id="select" value="이미지 선택" >
	 						<input type="button" id="delete" value="모두 삭제" >
 						</div>
 						<div class="select_img" style="clear:both">
 							<c:forEach var="i" begin="1" end="8" >
	   							<img src="" class="gdsImg" name="file" style="width:165px; height:165px; margin:1%"> 
	   						</c:forEach>
						</div>
						
						<script>
						  $('.gdsImg').hide();
						  $('#gdsImg').hide();
						  
						  $("#select").click(function(){
						  		$('#gdsImg').click();
						  });
						  
						  $("#gdsImg").change(function(){
							var fileLength =  this.files.length;
							var i =0; 
							<%for(int i = 0 ; i<8 ; i++){%>
							   if(gdsImg.files && gdsImg.files[<%=i%>]) {
							    var reader = new FileReader;
								    reader.onload = function(data) {
								    	$(".gdsImg:nth-child(<%=i+1%>)").show();  
								    	$(".gdsImg:nth-child(<%=i+1%>)").attr("src", data.target.result);  
								    }
							    reader.readAsDataURL(this.files[<%=i%>]);
						    	}
						   	<%}%>
						  });
						  
						  $("#delete").click(function(){
							$('.gdsImg').hide();
							$("#gdsImg").val('');  
							$(".gdsImg").attr("src",'');     
						  });
						  
						</script>
					</div>
					
				</td>
			</tr>
		</table>
		
		<div style="margin:0px auto; width:1000px; text-align:center; ">
			<input id="necessaryCheckbox" type="checkbox" required>매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.
			<br>
			<input type="button"  value="취소" class="button2" onclick="history.back(-1);">
			<button onclick="return a();" class="button3"> 등록 </button>
		</div>
	</div>
	</form>
	<script>
		function validate() {
			$('#postRoomConfirm').submit();
		}
	</script>
	<br>
	<script>
	
	</script>
</body>
</html>