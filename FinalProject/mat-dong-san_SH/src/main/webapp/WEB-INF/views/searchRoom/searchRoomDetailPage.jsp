<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	.detailDiv{
		width: 1140px;
		margin: 0px auto;
	}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div id="detailContentDiv">
		<div id="detailHeaderDiv" class="detailDiv">
			<table id="headTable">
				<tr>
					<td>월세</td>
					<td>쓰리룸</td>
					<td>전용면적</td>
				</tr>
				<tr>
					<th colspan="2">5000/60</th>
					<th>54.22</th>
				</tr>
				<tr>
					<td style="background: red;color: white">신고하기</td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div id="detailBodyDiv" class="detailDiv">
			<table id="bodyTable">
				<tr>
					<td>해당층/건물층</td>
					<td>3층/4층</td>
					<td>전용/공급면적</td>
					<td>54.22/59.5</td>
					<td>방 수</td>
					<td>3개</td>
					<td>방향</td>
					<td>남</td>
				</tr>
				<tr>
					<td>난방종류</td>
					<td>개별난방</td>
					<td>주차여부</td>
					<td>가능</td>
					<td>엘레베이터</td>
					<td>있음</td>
					<td>베란다/발코니</td>
					<td>있음</td>
				</tr>
				<tr>
					<td>입주가능일</td>
					<td>20.11.05</td>
					<td>전세대출</td>
					<td>가능</td>
					<td>빌트인</td>
					<td>있음</td>
					<td>반려동물</td>
					<td>가능</td>
				</tr>
				<tr>
					<td>관리비</td>
					<td>20만</td>
					<td>건물유형</td>
					<td>빌라</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr style="height: 350px;">
					<td colspan="8"><img alt="집 사진" src=""></td>
				</tr>
				<tr style="height: 200px;">
					<td colspan="8">
					간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개
					간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개간략한 소개
					</td>
				</tr>
			</table>
		</div>
		
		<div>
			관리 공인 중개사
		</div>
		<div class="detailDiv">
			<table id="footTableDiv">
				<tr>
					<td>중개사 이름</td>
					<td>맛동산</td>
					<td>중개사 번호</td>
					<td>070-1148-4875</td>
				</tr>
				<tr>
					<td>위치 정보</td>
					<td>서울시 강남구 역삼동</td>
					<td>평점</td>
					<td>●●●●●</td>
				</tr>
				<tr style="height: 200px;">
					<td colspan="4"><img alt="중개사 사진" src=""></td>
				</tr>
				<tr>
					<td>평점
						<select>
							<option>1점</option>
							<option>2점</option>
							<option>3점</option>
							<option>4점</option>
							<option>5점</option>
						</select>
					</td>
					<td colspan="2"><input type="text"></td>
					<td><input type="button" value="등록"></td>
				</tr>
				<tr>
					<td>2점</td>
					<td colspan="2">불친절 합니다.</td>
					<td>고라니</td>
				</tr>
				<tr>
					<td>4점</td>
					<td colspan="2">괜찮은 매물이 많네요.</td>
					<td>토끼</td>
				</tr>
				<tr>
					<td>5점</td>
					<td colspan="2">상담 잘 해주십니다.</td>
					<td>고양이</td>
				</tr>
			</table>
		</div>
		
	</div>
</body>
</html>