<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	    display:inline-block;
	    width: 100%;
	    height: 64px;
	    background: skyblue;
	    margin-top: 70px;
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
	
	.productContent{
		display: inline-block;
	    width: 180px;
	    border: 1px solid black;
	    height: 250px;
	    margin: 15px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6575c609a2768f0806882eba14c4cb9&libraries=services,clusterer,drawing"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<!-- <div id="headDiv">헤더(방찾기,고객센터,로그인,회원가입 등)</div> -->
	<div id="filterDiv">필터,검색 등</div>
	<div id="contentContainer">
		<div id="listHouseDiv">
			<div class="productContent">매물1</div>
			<div class="productContent">매물1</div>
			<div class="productContent">매물1</div>
			<div class="productContent">매물1</div>
			<div class="productContent">매물1</div>
			<div class="productContent">매물1</div>
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