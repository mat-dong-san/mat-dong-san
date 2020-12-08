<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73b702bbc370391b33bcfbc18e36ee62&libraries=services,clusterer,drawing"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#e_review_btn{
	font-size: 0.9em;
	height: 35px;
	font-weight:bold;
	outline: none;
	border: 0;
	background: rgb(30 120 200 / 60%);
	border: 1px solid rgb(30 120 200 / 70%);
	border-radius: 5px;
	color: white;
	width: 100px;
	hieght: 50px;
}
#e_modal_btn{
	outline: none;
	border: 0;
	background: rgb(30 120 200 / 60%);
	border: 1px solid rgb(30 120 200 / 70%);
	border-radius: 5px;
	color: white;
	width: 225px;
	height: 80px;
	font-size: 2em;
	font-weight:bold;
	
}
#e_note_btn{
	outline: none;
	border: 0;
	background: rgb(30 120 200 / 60%);
	border: 1px solid rgb(30 120 200 / 70%);
	border-radius: 5px;
	color: white;
	width: 225px;
	height: 80px;
	font-size: 2em;
	font-weight:bold;
	
}
#e_review_btn:hover{
	background: rgb(21 100 249 / 45%);
		
}
#e_note_btn:hover{
	background: rgb(21 100 249 / 45%);
		
}
#e_modal_btn:hover{
	background: rgb(21 100 249 / 45%);
		
}

#content {
	width: 1600px;
	margin-right: 0;
	display: grid;
	padding-left: 55px;
	grid-template-columns: 78% 25%;
	padding-top: 40px;
	text-align: center;
}
.btn {
	font-size: 2em;
	margin-top: 20px;
	border: 1px solid black;
	
}

#deleteBtn {
	outline: none;
	border: 0;
	background: rgb(30 120 200 / 60%);
	border: 1px solid rgb(30 120 200 / 70%);
	border-radius: 5px;
	color: white;
	width: 180px;
	height: 70px;
	font-size: 1.8em;
	font-weight:bold;
	margin-left: 55px;
}

#deleteBtn:hover {
	background: rgb(21 100 249 / 45%);
}	

.container-for-content {
	background-color: rgba(223, 232, 225, 0.1);
}

.wrap {
	padding-top: 120px;
	background-color: rgba(223, 232, 220, 0.5);
	
}

.nav{
	
	margin:55px;
}

.nav-item {
	font-size: 1.6em;
	text-align: center;
	font-weight: bold;
	vertical-align: middle;
	width: 200px;
	height: 50px;
}

.nav-item:hover {
	font-weight: bold;
	cursor: pointer;
	border-bottom: 2px solid black;
}

table {
	font-size: 1.1em;
	border: 1px solid lightgray;
}

th {
	font-size: 1.3em;
}

input[type="checkbox"] {
	width: 30px;
	height: 30px;
}

#eModal_Wrapper{
	visibility: hidden;
	position: fixed;
	width: 400px;
	top:240px;
	left:950px;
	z-index: 2;
	bottom: 550px;
	transform: translate(-50%,-50%);
	opacity: 0;
}
	
.e_Content{
	background: white;
	padding: 10px;
}

.e_modal_info{
	padding: 10px;
	width: 10%;
}


.e_model_info_name{
	font-size: 1.4em;
	width: 300px;
	height: 50px;
}

.e_model_info_phone{
	font-size: 1.4em;
	width: 300px;
	height: 50px;
}

.e_model_info_field{
	font-size: 1.4em;
	width: 300px;
	height: 50px;
}

#modal_cancel {
	width: 100%;
	height: 50px;
}


.profile {
	width: 100px;
	height: 100px;
	border-radius: 70%;
	background: #BDBDBD;
}

.reviewProfile {
	width: 495px;
	height: 420px;
	background: #BDBDBD;
}

.reviewProfile2 {
	width: 29px;
	height: 29px;
	border-radius: 70%;
	background: #BDBDBD;
}

/* 공인중개사 ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
.container-for-carousel {
	background-color: #FFFFFF;
	font-size: 1.2em;
	/* position: fixed; */
	position: absolute;
	top: 70px;
	z-index: 1;
	right: 0;
	width: 27%;
	display:none;
	border: 2px solid #D9D9D9;
	grid-template-rows: 7% 1fr 55px;
	overflow: auto;
}

@media screen {
	.container-for-carousel {
		position: fixed;
	}
}

#estateContent {
	border-top: 2px solid #D9D9D9;
	border-bottom: 4px solid #F2F2F2;
	height: 150px;
}

#estateContent2 {
	border-top: 2px solid #D9D9D9;
	border-bottom: 4px solid #F2F2F2;
	height: 400px;
}

#estateContent3 {
	border: 2px solid #D9D9D9;	
	height: 420px;
}

.checked {
  color: orange;
}

.check {
  color: black;
}

#map {
	border: 1px solid #F2F2F2;
	width: 455px;
	height: 300px;
}

/* 리뷰 ---------------------------------------------------------------------------------------------------------------------------------------------------------*/

.container-for-carousel2 {
	background-color: #FFFFFF;
	font-size: 1em;
	/* position: fixed; */
	position: absolute;
	top: 70px;
	z-index: 2;
	right: 0;
	width: 29%;
	display:none;
	border: 1px solid #F2F2F2;	
	
}

@media screen {
	.container-for-carousel2 {
		position: fixed;
	}
}
#estateReview {
	text-align: center;
	height: 440px;
}
#estateReview2 {
	height: 120px;
	border-bottom: 4px solid #F2F2F2;
}
#estateReview3 {
	text-align: center;
	height: 470px;
	box-sizing: border-box;
	border-bottom: 4px solid #F2F2F2;
}
#estateReview4 {
}
#listDiv{
	padding: 25px;
}

.review_info{
	padding-left: 0px;
}
.review_rating{
}

.form-group>textarea {
	border-color: silver;
	border-width: 2px;
	width: 350px;
	height: 200px;
}

.btn-groups {
	text-align: center;
}

.btn-groups input {
	font-size: 1.7em;
	font-weight: bold;
	background-color: #CCCCCC;
	color: white;
	border: 1px solid #C0C0C0;
	width: 82%;
	height: 55px;
	margin-left: 133px;
	border-radius:5px;
	text-shadow:-1px 0px 0px #D9D9D9,1px 0px 0px #D9D9D9,0px -1px 0px #D9D9D9,0px 1px 0px #D9D9D9
}
#er_del_btn{
	font-size: 1.0em;
	background-color:#F2F2F2; 
	border-radius:5px; 
	color:#999; 
	border: 1px solid silver; 
	float: right;
}

.btn-groups>button:first-of-type {
	margin-right: 10px;
}

.star-rating2 { 
	width:205px; 
}

.star-rating2,.star-rating2 span { 
	display:inline-block; 
	height:39px; 
	overflow:hidden; 
	background:url('./resources/images/star.png')no-repeat;

}

.star-rating2 span{ 
	background-position:left bottom;
	line-height:0;
	vertical-align:top; 
}


.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 20px;
	height: 20px;
	background-image: url('./resources/images/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.reviewform textarea {
	width: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('./resources/images/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.starRating, .starRating span {
	display: inline-block;
	height: 14px;
	height: 14px;
	background: transparent url(icoFiveStar.gif) no-repeat;
	overflow: hidden;
}

.starRating {
	width: 79px;
	vertical-align: middle;
}

.starRating span {
	font-size: 0;
	line-height: 0;
	vertical-align: top;
	text-indent: -100px;
	*text-indent: 0;
	background-position: 0 -14px;
}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div class="wrap">
		<div class="nav">
			<div class="nav-item" onclick="location.href='productRecentList.es'">최근본매물</div>
			<div class="nav-item" onclick="location.href='productTakeList.es'">찜한매물</div>
		</div>
	</div>
	
	<div id="content">
		<div>
			<table class="table table-hover" id="recentList">
				<thead class="thead-dark">
					<tr>
						<th scope="col"><input type="checkbox" id="allCheck" checked></th>
						<th scope="col">매물사진</th>
						<th scope="col">매물정보</th>
					</tr>
				</thead>
				
				<!-- 등록한 매물이 없을 경우 -->
				<c:if test="${pSession == null || pSession == '[]'}">
				
				
				<tbody>
					<tr>
						<td colspan="7" style="text-align: center;">
						<br><br>
						<h3>찜한 매물이 없습니다.</h3>
						<br><br>
						</td>
					</tr>
				</tbody>
				
				</c:if>
				<c:if test="${ptSession != null}">
				
				<tbody>
					
					<c:forEach var="p" items="${sessionScope.ptSession }">
					<c:if test="${not empty p.p_id }">
						<tr>
							
							<th scope="row"><input type="hidden" class="p" value="${p.p_id}"><input type="checkbox" class="chkbox" p_id="${p.p_id}" checked></th>
							<td><img src="resources/images/${p.us_id}/${p.p_id}/${fn:split(p.p_picture,'/')[2]}" style="border: 2px outset #D9D9D9; height: 230px; width: 300px;" /></td>
							<td colspan="2">
								<ul style="text-align: left; list-style-type: square;">
									<li>${p.p_addr}</li>
									<li>${p.p_field}/${p.p_floor}/${p.p_size}</li>
									<li>${p.p_str}/${p.p_room}/공급면적: ${p.p_s_size}/전용면적: ${p.p_d_size}</li>
									<li>월세: ${p.p_rent}/보증금: ${p.p_deposit}/입주가능: ${p.p_en_d}</li>
									<li>관리비: ${p.p_cost}(${p.p_cost_item})</li>
									<li>${p.p_heat}/${p.p_dir}</li>
									<li>주차: ${p.p_park}/엘리베이터: ${p.p_elevator}/애완동물: ${p.p_pet}/베란다: ${p.p_verander}/빌트인: ${p.p_built_in}/대출: ${p.p_loan}</li>
									<li>옵션: ${p.p_option}</li>
									<li>${p.p_content}</li>
	
								</ul>
							</td>
						</tr>
					
					</c:if>
					</c:forEach>
					
					
				</c:if>
				
				</tbody>
			</table>
		</div>
		
		
	</div>
	<div class="container-for-carousel">
			
	</div>
	
	<div class="container-for-carousel2">
			<div id="e_back"><h2>➲ 뒤로가기</h2></div>
			<div class="contInner" id="estateReview">
				<div class="profile2"></div><br>
			</div>
			<div class="contInner" id="estateReview2">
				<div class="profile3"></div><br>
			</div>
			<div class="contInner" id="estateReview3">
				<div style="background:#F2F2F2; height: 50px; border-top: 1px solid #D9D9D9; text-align:left;"><h2>별점과 리뷰</h2></div>
				<div class="review_rating">
				<br>
					<div class="rating" id="rating">
						<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점"> <label for="rating1"></label>
						<input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점"> <label for="rating2"></label>
						<input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점"> <label for="rating3"></label>
						<input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점"> <label for="rating4"></label>
						<input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점"> <label for="rating5"></label>
					</div>
				</div>
				<div class="form-group"><textarea rows="10" name="er_content" id="er_content" maxlength="100" placeholder="" style="font-size: 20px;" /></textarea></div>
				<div class="btn-groups" style="width: 427px; margin-left: -58px;"><input type="button" id="er_reg_btn" value="리뷰등록"></div>
			</div>	
			<div class="contInner" id="estateReview4">
				<div style="background:#F2F2F2; height: 50px; border-top: 1px solid #D9D9D9; text-align:left;"><h2>소중한 리뷰</h2></div>
				<div id="listDiv">
					<div id="list"></div>
					<div id="list2"></div>
				</div>
			</div>
	</div>
	<input type="button" class="btn" value="선택삭제" id="deleteBtn"> 
	<br><br><br><br>
	
	<!-- 모달창 -->
	<div id="eModal_Wrapper">
		<div class="e_Content" >
				<table>
					<tr>
						<td class="e_modal_info">
							<div><h3>중개사</h3></div>
							<input type="text" class="e_model_info_name" id="modal" readOnly/>
						</td>
					</tr>
					<tr>
						<td class="e_modal_info">
							<div><h3>중개전문분야</h3></div>
							<input type="text" class="e_model_info_field" id="modal2" readOnly/>
						</td>
					</tr>
					<tr>
						<td class="e_modal_info">
							<div><h3>대표번호</h3></div>
							<input type="text" class="e_model_info_phone" id="modal3" readOnly/>
						</td>
					</tr>
				</table>
				<br>
				<input type="button" value="뒤로가기" id="modal_cancel">
		</div>
	</div>
	<form id="e_Info" name="e_Info">
		<input type="hidden" name="us_id" id="us_id" value="${ loginUser.us_id }">
		<input type="hidden" name="e_id" id="e_id" value="">
		<input type="hidden" name="e_name" id="e_name" value="">
		<input type="hidden" name="p_id" id="p_id" value="">
	</form>
	
	<br>
    
	<script>
	
	  function Rating() {};
	  Rating.prototype.rate = 0;
	  Rating.prototype.setRate = function(newrate) {
			this.rate = newrate;
			let items = document.querySelectorAll('.rate_radio');
			items.forEach(function(item, idx) {
				if (idx < newrate) {
					item.checked = true;
				} else {
					item.checked = false;
				}
			});
		}
		let rating = new Rating();
		
		document.addEventListener('DOMContentLoaded', function() {
			document.querySelector('.rating').addEventListener('click',
					function(e) {
						let elem = e.target;
						if (elem.classList.contains('rate_radio')) {
							rating.setRate(parseInt(elem.value));
						}
					})
		});
		var page = 1;
		var rolling = 300;
		$('.container-for-carousel2').scroll(function(){
		     if($('.container-for-carousel2').scrollTop() >= rolling){
		    	  rolling += 920;
		          getList(page);
		          page++;
		          
		     } 
		});
		 
		
		function getList(page){
		 	var e_id = $('#e_id').val();
		 	var us_id = $("#us_id").val();
		    $.ajax({
		        url: 'estateReview.es',
		        data: {e_id:e_id, page:page},
		        success: function(data) {
		        	console.log(data);
		            var testEval = "";
		            
		            if (data.pi.currentPage==1){
		                  $("#list").html(""); 
		            }
		            
		            if (data.pi.currentPage<=data.pi.maxPage){
		            	$.each(data, function(key, value) {
							 if(key == "review") {
								 for (var i = 0; i < value.length; i++) {
									 testEval += '<div class="review_info"><h4><img class="reviewProfile2" align="left" vspace=1 src="./resources/images/'+ value[i].us_id +'/'+ value[i].us_picture +'">&nbsp;'+ value[i].us_id +'('+ value[i].us_name +')&nbsp;&nbsp;&nbsp;&nbsp;';
									 for (var j = 0; j < value[i].er_point; j++) {
										testEval +='<span class="fa fa-star checked"></span>';
								     }
									 for (var j = 0; j < 5-value[i].er_point; j++) {
										testEval +='<span class="fa fa-star check"></span>';
									 }
									 testEval += '</h4><div class="review_content"><br><h5><p>'+ value[i].er_content +'</p></h5></div><br>';
									 testEval += '<p style="float: left;">등록날짜: '+ value[i].er_reg_d +'</p>';
									 if(us_id == value[i].us_id){
										 testEval +='<input type="button" id="er_del_btn" er_id="'+ value[i].er_id +'" er_point="'+ value[i].er_point +'" value="삭제">';
									 }
									 testEval += '<br></div><hr>';
								}
							 }
						});
		            	
		            }
		            testEval = testEval.replace(/%20/gi, " ");
		            if (data.pi.currentPage==1){
		                $("#list").html(testEval); 
		            }else{
		                $("#list2").append(testEval);
		            }
		       }
		    });
		    
		}
	 
	  
	  $("#modal_cancel").click(function() {
    	  $("#eModal_Wrapper").css("visibility","hidden");
      });
   	
	
	  $(document).on('click', '#e_modal_btn, #e_note_btn, #e_close, #e_back,#er_reg_btn, #er_del_btn', function(){
		  
		  var id = $(this).attr('id');
		  
		  if(id == "e_modal_btn") {
			  $("#eModal_Wrapper").css({visibility:"visible", opacity: 1});
			  $("#eModal_Wrapper").css("box-shadow","rgba(0,0,0,0.5) 0 0 0 9999px");
			  
		  }else if(id == "e_note_btn"){
			  var us_id = $("#us_id").val();
			  if(us_id != "") {
				  window.open("note.es", "messageForm", "width=520, height=440");
			  }else {
				  alert('로그인후 이용가능');
			  }
			  
		  }else if(id == "e_close"){
			  $('.container-for-carousel').css('display','none');
			  page = 1;
			  rolling = 300;
			  $("#list").html("");
			  $("#list2").empty();
			  
		  }else if(id == "e_back"){
			  $('.container-for-carousel2').css('display','none')
			  $('.container-for-carousel').css('display','grid');
			  $('.container-for-carousel').css('overflow','scroll');
			  page = 1;
			  rolling = 300;
			  $("#list").html("");
			  $("#list2").empty();
			  
		  }else if(id == "er_reg_btn"){
			  var e_name = $('#e_name').val();
			  var er_content = $('#er_content').val();
			  var er_point = $("input:checkbox[name='rating']:checked").length;
			  var e_id = $('#e_id').val();
			  var us_id = $("#us_id").val();
			  var testVal2 = "";
			  if (confirm("등록하시겠습니까?") == true){
				  if(er_content == ""){
					  alert('내용입력해주세요');
					  $('#er_content').focus();
				  }else{
					  $.ajax({
							 url: 'insertReview.es',
							 data: {er_content:er_content, er_point:er_point, e_id:e_id, us_id:us_id},
							 success: function(data) {
								 console.log(data);
								 var e_point = data*20;
								 if(data == 1) {
									 alert('중복등록불가');
								 }else{
									 alert('등록되었습니다');
									 page = 1;
									 rolling = 300;
									 $("#list").html("");
									 $("#list2").empty();
									 $('.container-for-carousel2').scrollTop(0);
									 testVal2 += '<h1>&nbsp;'+ e_name +'</h1><h4>&nbsp;별점: <span class="star-rating2"><span style ="width:'+ e_point +'%"></span></span>&nbsp;&nbsp;('+ data +')점</h4>';
									 $('.profile3').html(testVal2);
									 
									 
								 }
							 }
						 });
				  }
				  
				
				   
			   }else{
				     return false;
				     
			   }
			  
			  
		  }else if(id == "er_del_btn"){
			  var e_name = $('#e_name').val();
			  var er_id = $(this).attr('er_id');
			  var er_point = $(this).attr('er_point');
			  var e_id = $('#e_id').val();
			  var testVal2 = "";
			  if (confirm("삭제하시겠습니까?") == true){
				   $.ajax({
						 url: 'deleteReview.es',
						 data: {er_id:er_id, e_id:e_id, er_point:er_point},
						 success: function(data) {
							 console.log(data);
							 var e_point = data*20;
						     alert('삭제되었습니다');
						     page = 1;
						     rolling = 300;
						     $("#list").html("");
						     $("#list2").empty();
						     $('.container-for-carousel2').scrollTop(0);
						     testVal2 += '<h1>&nbsp;'+ e_name +'</h1><h4>&nbsp;별점: <span class="star-rating2"><span style ="width:'+ e_point +'%"></span></span>&nbsp;&nbsp;('+ data +')점</h4>';
							 $('.profile3').html(testVal2);
							 
						 }
					 });
				   
			   }else{
				     return false;
				     
			   }
			  
			  
		  }
		  

	  });
	  
	  
	  $(document).on('click', '#e_review_btn', function(){
		  
		  var us_id = $("#us_id").val();
		  var us_id2 = $(this).attr("us_id");
		  var e_name = $(this).attr("e_name");
		  var e_picture = $(this).attr("e_picture");
		  var e_point = $(this).attr("e_point");
		  var e_point2 = Math.round(e_point * 100) / 100;
		  var e_point3 = e_point * 20;
		 
		  
		  if(us_id != "") {
			  var testVal="";
			  var testVal2="";
			  
			  testVal += '<img class="reviewProfile"  align="left" vspace=1 src="./resources/images/'+ us_id2 +'/'+ e_picture +'">';
			  testVal2 += '<h1>&nbsp;'+ e_name +'</h1><h4>&nbsp;별점: <span class="star-rating2"><span style ="width:'+ e_point3 +'%"></span></span>&nbsp;&nbsp;('+ e_point2 +')점</h4>';
			  $('.profile2').html(testVal);
			  $('.profile3').html(testVal2);
			  
			  
			  $('.container-for-carousel').css('display','none');
			  $('.container-for-carousel2').css('display','grid');
			  $('.container-for-carousel2').css('overflow','auto');
			  $(".container-for-carousel2").scrollTop(0);
			  
			  $(function(){
			        $(".container-for-carousel2").height(800);   
			  });
			  $(document).on("mousewheel",function(e){
			   
			  });
			  
		  }else {
			  alert('로그인후 이용가능');
		  }
		  
		 
		 
	  });
	  
      $("#recentList").children().children().children('td').click(function() {
    	  page = 1;
    	  rolling = 300;
		  $("#list").html("");
		  $("#list2").empty();
    	  $('.container-for-carousel2').css('display','none');
    	  $('.container-for-carousel').css('display','grid');
    	  
    	  var p_id = $(this).parent().children().children('input').val();
    	  
    	  $.ajax({
				url:'selectEstate.es',
				data:{p_id:p_id},
				success:function(data){
					console.log(data);
					
					var e_addr = data.e_addr.split('/');
				    var e_point = parseInt(data.e_point);
				    var e_point2 = parseFloat(data.e_point);
				    var e_point3 = "";
				    
				    var e_content = data.e_content.replace(/<br>/g, "\n");
				    
				    for(var i = 0; i < e_point; i++) {
				    	e_point3 += '<span class="fa fa-star checked">';
				    }
				    for(var i = 0; i < 5-e_point; i++) {
				    	e_point3 += '<span class="fa fa-star check">';
				    }
				    
 					var e_addr2 = e_addr[1].split(' ');
					
					var testEval = "";
					testEval += '<div id="e_close" style="border-bottom: 4px solid #F2F2F2;"><h2>➲ '+ e_addr2[1] +'</h2></div><div>';
					testEval += '<div class="contInner" id="estateContent"><br><img class="profile" align="left" vspace=1 src="./resources/images/'+ data.us_id +'/'+ data.e_picture +'"><h4>&nbsp;'+ data.e_name +'<br>&nbsp;별점: '+ e_point3 +'</h4>&nbsp;&nbsp;<input type="button" id="e_review_btn" us_id="'+ data.us_id +'" e_picture="'+ data.e_picture +'" e_point="'+ e_point2 +'" e_name="'+ data.e_name +'" value="리뷰하기"></div>';
					testEval += '<div class="contInner" id="estateContent2"><div style="background:#F2F2F2; height: 50px;"><h2>중개사무소 인사말</h2></div><br><h5>'+ e_content +'</h5></div>';
					testEval += '<div class="contInner" id="estateContent3"><div style="background:#F2F2F2; height: 50px;""><h2>중개사무소 위치</h2></div><br><h5>▽'+ e_addr[1] +'</h5><div id="map"></div></div>';
					testEval += '<div id="tail">';
					testEval += '<input type="button" id="e_modal_btn" value="문의하기"> ';
					testEval += '<input type="button" id="e_note_btn" value="쪽지하기" e_id="'+ data.e_id +'" e_name="'+ data.e_name +'">';
					testEval += '</div>';
					
					$('#p_id').val(p_id);
					$('#e_id').val(data.e_id);
					$('#e_name').val(data.e_name);
					$('#er_content').val('');
					$('.e_model_info_name').val(data.e_name);
					$('.e_model_info_phone').val(data.e_phone);
					$('.e_model_info_field').val(data.e_field);
					
					$('.container-for-carousel').html(testEval);
					
					
					$(function(){
				        $(".container-for-carousel").height(810);
				    });
				    $(document).on("mousewheel",function(e){
				        
				    });
					
					var container = document.getElementById('map');
			        var options = {
			           center: new kakao.maps.LatLng(37.566826, 126.9786567),
			           level: 4
			        };
			     
			        var map = new kakao.maps.Map(container, options);
			        
			        var geocoder = new kakao.maps.services.Geocoder();
			        
			        geocoder.addressSearch(e_addr[1], function(result, status) {
			             if (status === kakao.maps.services.Status.OK) {
			                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			                var marker = new kakao.maps.Marker({
			                    map: map,
			                    position: coords
			                });
			                var infowindow = new kakao.maps.InfoWindow({
			                    content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ data.e_name +'</div>'
			                });
			                infowindow.open(map, marker);
			                map.setCenter(coords);
			            }
			        });
				}
			});
    	  
      });

      
      $("#allCheck").click(function() {
         var chk = $("#allCheck").prop("checked");
         if (chk) {
            $(".chkbox").prop("checked", true);
         } else {
            $(".chkbox").prop("checked", false);

         }
      });

      $(".chkbox").click(function() {
         $("#allCheck").prop("checked", false);
         
      });
      	
      $("#deleteBtn").click(function(){
          var selectedCheck = new Array();
          $('.chkbox:checked').each(function() {
              selectedCheck.push($(this).attr('p_id'));
          });
          if(selectedCheck.length < 1 ){
              alert('1개이상 선택');
              return false;
          }
         
          var confirm_val = confirm("정말 삭제하시겠습니까?");
          if(confirm_val) {
        	  alert('삭제완료');
        	  $.ajax({
  				url:'deleteTakeCheck.es',
  				data:{selectedCheck:selectedCheck},
  				success:function(data){
  					console.log(data);
  					if(data == "1"){
  						location.reload();
  					}else {
  						
  					}
  					
  				}
  			});
        	  
          }
         
      });
      
		
   </script>
</body>
</html>