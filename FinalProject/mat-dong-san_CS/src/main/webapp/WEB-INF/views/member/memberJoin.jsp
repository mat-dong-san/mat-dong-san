<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member-style.css" type="text/css">
<style>
	span.guide{display: none; font-size: 12px; top: 12px; right: 10px;}
	span.ok{color: green}
	span.error{color: red}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<br><br><br><br><br><br>
	<h1 align="center">회원가입</h1>
	
	<div class="centerText">
		<form action="minsert.me" method="post" id="joinForm">
			<table>
				<tr>
					<th>* 아이디</th>
					<td>
						<input type="text" name="us_id" id="us_id">
						<span class="guide ok">이 아이디는 사용 가능합니다</span>
						<span class="guide error">이 아이디는 사용  불가능합니다</span>
						<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value='0'>
					</td>
				</tr>
				
				<tr>
					<th>* 비밀번호</th>
					<td><input type="password" name="us_pwd"></td>
				</tr>
				<tr>
					<th>* 비밀번호확인</th>
					<td><input type="password" name="us_pwd2"></td>
				</tr>
				
				<tr>
					<th>* 이름</th>
					<td><input type="text" name="us_name"></td>
				</tr>
				
				
				<tr>
					<th>주민번호</th>
					<td> <input type="text" name="ssn1"> - <input type="password" name="ssn2"></td>				
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td><input type="tel" name="us_phone"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input type="email" name="us_email"></td>
				</tr>
				
				<tr>
					<th>우편번호</th>
					<td>
						<input type="text" name="post" class="postcodify_postcode5" value="" size="6">
						<button type="button" id="postcodify_search_button">검색</button>
					</td>
				</tr>
				<tr>
					<th>도로명 주소</th>
					<td><input type="text" name="address1" class="postcodify_address" value=""></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type="text" name="address2" class="postcodify_extra_info" value=""></td>
				</tr>
				
				<tr>
					<th>회원유형</th>
					<td>
						<input type="radio" name="us_type" value="일반">일반
						<input type="radio" name="us_type" value="중개사">중개사
					</td>
				</tr>
				
				<!-- jQuery와 Postcodify를 로딩한다. -->
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
				
				<tr>
					<td colspan="2" align="center">
						<button onclick="return validate();">가입하기</button>
						<input type="reset" value="취소하기">
						<button type="button" onclick="location.href='home.do'">시작 페이지로 이동</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		
		$('#us_id').on('keyup', function(){
			var us_id = $(this).val().trim();
			
			if(us_id.length < 4){
				$('.guide').hide();
				$('#idDuplicateCheck').val(0);
				
				return;
				
			}
			
			$.ajax({
				url: 'dupid.me',
				data: {id:us_id},
				success: function(data) {
					console.log(data);
					if(data == 'true'){
						$('.guide.error').hide();
						$('.guide.ok').show();
						$('#idDuplicateCheck').val(1);
					}else {
						$('.guide.ok').hide();
						$('.guide.error').show();
						$('#idDuplicateCheck').val(0);
					}
				}
			});
			
		});
	
		function validate() {
			if($('#idDuplicateCheck').val() == 0){
				alert('사용 가능한 아이디를 입력해주세요');
				$('#us_id').focus();
				return false;
			}else {
				$('#joinForm').submit();
			}
		}
	
	
	</script>
	
</body>
</html>