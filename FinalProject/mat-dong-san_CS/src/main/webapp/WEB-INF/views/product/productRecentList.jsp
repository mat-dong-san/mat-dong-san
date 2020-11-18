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
	top: 80px;
	z-index:1;
	right: 0;
	width: 18%;
	background-color: rgba(223, 232, 225, 10);
	border: 2px solid black;
	display: none;
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
	height: 100px;
}

#estateAgentContent2 {
	border-bottom: 1px solid black;
	height: 330px;
}

#estateAgentContent3 {
	border-bottom: 1px solid black;
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
						<%-- <input type="hidden" id="p_id" value="${p.p_id}"> --%>
						<tr>
							<input type="hidden" value="${p.p_id}">
							<th scope="row"><input type="checkbox" class="chkbox" p_id="${p.p_id}" checked></th>
							<td><img src="resources/images/productRoom.png"
								style="height: 200px; width: 250px;" /></td>
							<td colspan="2">
								<ul style="text-align: left;">
									<li>${p.p_addr}</li>
									<li>${p.p_field}/${p.p_floor}/${p.p_size}</li>
									<li>${p.p_str}/${p.p_room}/공급면적: ${p.p_s_size}/전용면적: ${p.p_d_size}</li>
									<li>월세: ${p.p_rent}/보증금: ${p.p_deposit}/입주가능:${p.p_en_d}</li>
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
			<div>
				<h2>공인중개사</h2>
			</div>
			<div>
				<div id="estateAgentContent">로고</div>
				<div id="estateAgentContent2">중개사인사말</div>
				<div id="estateAgentContent3">
					위치<br>
					<div id="map"></div>
				</div>
			</div>
			<div id="tail">
				<input type="button" id="" value="문의하기" style="font-size: 1.84em;">
				<input type="button" id="" value="쪽지하기" style="font-size: 1.84em;">
			</div>
		</div>
	<br>

	<input type="button" value="선택삭제" id="deleteBtn">
	<br><br><br><br>

	<script>	
   
      $("#recentList").children().children().click(function() {
    	  $('.container-for-carousel').css('display','grid');
    	  var p_id = $(this).children('input').val();
    	  
         
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
         alert($(this).attr('p_id'));
         
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

      
      var container = document.getElementById('map');
        var options = {
           center: new kakao.maps.LatLng(37.566826, 126.9786567),
           level: 4
        };
     
        var map = new kakao.maps.Map(container, options);
        
        var geocoder = new kakao.maps.services.Geocoder();
        
        geocoder.addressSearch('강남구 테헤란로14길 6', function(result, status) {
             if (status === kakao.maps.services.Status.OK) {
                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">맛동산</div>'
                });
                infowindow.open(map, marker);
                map.setCenter(coords);
            }
        });
   </script>
</body>
</html>