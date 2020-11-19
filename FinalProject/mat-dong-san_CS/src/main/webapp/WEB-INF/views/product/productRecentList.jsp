<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#content {
	margin-right: 0;
	display: grid;
	padding-left: 250px;
	grid-template-columns: 78% 25%;
	padding-top: 50px;
	text-align: center;
}

#deleteBtn {
	margin-left: 290px;
	font-size: 1.5em;
}

.container-for-content {
	background-color: rgba(223, 232, 225, 0.1);
}

.wrap {
	padding-top: 120px;
	padding-right: 1000px;
	background-color: rgba(223, 232, 220, 0.5);
}

.nav-item {
	font-size: 1.4em;
	text-align: center;
	font-weight: bold;
	vertical-align: middle;
	width: 300px;
	height: 50px;
	display: table-cell;
}

.nav-item:hover {
	color: orangered;
	font-weight: bold;
	cursor: pointer;
	border-bottom: 2px solid black;
}

th {
	font-size: 1.4em;
}

input[type="checkbox"] {
	width: 20px;
	height: 20px;
}

/* 공인중개사 */
.container-for-carousel {
	/* position: fixed; */
	position: absolute;
	top: 70px;
	z-index: 1;
	right: 0;
	width: 18%;
	display:none;
	border: 2px solid black;
	grid-template-rows: 7% 1fr 55px;
}

@media screen {
	.container-for-carousel {
		position: fixed;
	}
}

.line {
	border-bottom: 1px solid gray;
	margin-top: 50px;
}

#estateAgentContent {
	border-bottom: 1px solid black;
	height: 80px;
}

#estateAgentContent2 {
	border-bottom: 1px solid black;
	height: 300px;
}

#estateAgentContent3 {
	border-bottom: 1px solid black;
	height: 300px;
}

#eModal_Wrapper{
	visibility: hidden;
	position: fixed;
	border: 1px solid black;
	width: 400px;
	z-index: 1;
	bottom: 200px;
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
	width: 300px;
	height: 50px;
}

.e_model_info_phone{
	width: 300px;
	height: 50px;
}

.e_model_info_regNum{
	width: 300px;
	height: 50px;
}


#modal_cancel {
	width: 100%;
	height: 50px;
}

.profile {
	width: 75px;
	height: 75px;
	border-radius: 70%;
	background: #BDBDBD;
}

.checked {
  color: orange;
}
.check {
  color: black;
}
#map {
	width: 280px;
	height: 200px;
}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

	<div class="wrap">
		<nav class="navy">
		<div class="nav-item" onclick="productRecentList();">최근본매물</div>
		<div class="nav-item" onclick="roomRecentList();">찜한매물</div>
		</nav>
	</div>

	<div id="content">
		<div>
			<table class="table table-hover" id="recentList">
				<thead class="thead-dark">
					<tr>
						<th scope="col">#선택&nbsp;<input type="checkbox" id="allCheck"
							checked></th>
						<th scope="col">매물사진</th>
						<th scope="col">매물정보</th>
					</tr>
				</thead>
				
				<!-- 등록한 매물이 없을 경우 -->
				<c:if test="${pSession == null}">
				
				
				<tbody>
					<tr>
						<td colspan="7" style="text-align: center;">
						<br><br>
						<h3>최근에 본 매물이 없습니다.</h3>
						<br><br>
						</td>
					</tr>
				</tbody>
				
				</c:if>
				<c:if test="${pSession != null}">
				
				<tbody>
					
					<c:forEach var="p" items="${sessionScope.pSession }">
					<c:if test="${not empty p.p_id }">
						<tr>
							
							<th scope="row"><input type="hidden" value="${p.p_id}"><input type="checkbox" class="chkbox" p_id="${p.p_id}" checked></th>
							<td><img src="resources/images/productRoom.png"
								style="height: 200px; width: 250px;" /></td>
							<td colspan="2">
								<ul style="text-align: left;">
									<li>${p.p_addr}</li>
									<li>${p.p_field}/${p.p_floor}/${p.p_size}</li>
									<li>${p.p_str}/${p.p_room}/공급면적: ${p.p_s_size}/전용면적: ${p.p_d_size}</li>
									<li>월세: ${p.p_rent}/보증금: ${p.p_deposit}/입주가능: ${p.p_en_d}</li>
									<li>관리비: ${p.p_cost}(${p.p_cost_item})</li>
									<li>${p.p_content}</li>
									<li>${p.p_heat}, ${p.p_dir}</li>
									<li>주차: ${p.p_park}, 엘리베이터: ${p.p_elevator}, 애완동물: ${p.p_pet}, 베란다: ${p.p_verander}, 빌트인: ${p.p_built_in}, 대출: ${p.p_loan}</li>
									<li>옵션: ${p.p_option}</li>
	
								</ul>
							</td>
						</tr>
					
					</c:if>
					</c:forEach>
					
					
				</c:if>
				
				</tbody>
			</table>
			<div class="line"></div>
		</div>
		
		
	</div>
	<div class="container-for-carousel">
			
	</div>
	
	
	<input type="button" value="선택삭제" id="deleteBtn">
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
							<div><h3>대표번호</h3></div>
							<input type="text" class="e_model_info_phone" id="modal" readOnly/>
						</td>
					</tr>
					<tr>
						<td class="e_modal_info">
							<div><h3>사업자등록번호</h3></div>
							<input type="text" class="e_model_info_regNum" id="modal" readOnly/>
						</td>
					</tr>
				</table>
				<br>
				<input type="button" value="뒤로가기" id="modal_cancel">
		</div>
	</div>
	
	<br>

	<script>
	  
	  window.onclick = function(e){
		  if(e.target == modal) {
			  $("#eModal_Wrapper").css({visibility:"hidden", opacity: 0});
			  
		  }
	  }
	
	  // 모달창 display on/off
	  $(document).on('click', '#e_modal_btn', function(){
		  
		  var id = $(this).attr('id');
		  
		  if(id == "e_modal_btn") {
			  $("#eModal_Wrapper").css({visibility:"visible", opacity: 1});
			  $("#eModal_Wrapper").css("box-shadow","rgba(0,0,0,0.5) 0 0 0 9999px");
			  $("#eModal_Wrapper").css("index","100");
		  }else if(id == "e_note_btn"){
			  alert('1');
			  
		  }
		  

	  });
	  
      
      $("#modal_cancel").click(function() {
    	  $("#eModal_Wrapper").css("visibility","hidden");
      });
    
    
      // 모달창 가운데로 위치
      $('#eModal_Wrapper').css({
        "top":(($(window).height()-$('#eModal_Wrapper').outerHeight())/2+$(window).scrollTop())+"px",
        "left":(($( window ).width()-$('#eModal_Wrapper').outerWidth())/2+$(window).scrollLeft())+"px"
       });
      
      
      
      $("#recentList").children().children().click(function() {
    	  $('.container-for-carousel').css('display','grid');
    	  var p_id = $(this).children().children('input').val();
    	  
    	  $.ajax({
				url:'selectEstateAgent.pr',
				data:{p_id:p_id},
				success:function(data){
					console.log(data);
					
					var e_addr = data.e_addr.split('/');
					var e_content = data.e_content.split('/');
					var e_content2 = "";
				    for ( var i in e_content ) {
				    	e_content2 += '<p>' + e_content[i] + '</p>';
				    }
				    var e_point = parseInt(data.e_point);
				    var e_point2 = "";
				    
				    for(var i = 0; i < e_point; i++) {
				    	e_point2 += '<span class="fa fa-star checked">';
				    }
				    for(var i = 0; i < 5-e_point; i++) {
				    	e_point2 += '<span class="fa fa-star check">';
				    }
				    
					
					var testEval = "";
					testEval += '<div><h2>공인중개사</h2><hr></div><div>';
					testEval += '<div id="estateAgentContent"><img class="profile" align="left" vspace=1 src="./resources/images/profile.PNG"><h5>&nbsp;'+ data.e_name +'<br>&nbsp;별점: '+ e_point2 +'</h5></div>';
					testEval += '<div id="estateAgentContent2"><h4>☺중개인사말☺</h4><hr>'+ e_content2 +'</div>';
					testEval += '<div id="estateAgentContent3"><h4>▽위치</h4>'+ e_addr[1] +'<hr><div id="map"></div></div>';
					testEval += '<div id="tail">';
					testEval += '<input type="button" id="e_modal_btn" value="문의하기" style="font-size: 1.96em;">';
					testEval += '<input type="button" id="e_note_btn" value="쪽지하기" e_id="'+ data.e_id +'" e_name="'+ data.e_name +'" style="font-size: 1.96em;">';
					testEval += '<div>';
					
					$('.e_model_info_name').val('');
					$('.e_model_info_phone').val('');
					$('.e_model_info_regNum').val('');
					$('.e_model_info_name').val(data.e_name);
					$('.e_model_info_phone').val(data.e_phone);
					$('.e_model_info_regNum').val(data.e_reg_num);
					
					$('.container-for-carousel').html(testEval);
					
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
            itemSum();
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
          // alert(selectedCheck + '\n개수 : '+selectedCheck.length);
          if(selectedCheck.length < 1 ){
              alert('1개이상 선택');
              return false;
          }
          //document.form.submit();
         
          var confirm_val = confirm("정말 삭제하시겠습니까?");
          if(confirm_val) {
        	  alert('삭제완료');
        	  $.ajax({
  				url:'selectedCheck.pr',
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