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
	span.guide2{display: none; font-size: 12px; top: 12px; right: 10px;}
	span.ok{color: green}
	span.error{color: red}
	span.ok2{color: green}
	span.error2{color: red}
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align="center">중개사회원가입</h1>
	
	<div class="centerText">
		<form action="einsert.me" method="post" enctype="Multipart/form-data" id="joinForm">
			<table>
				
				
				
				<tr>
					<th>* 중개사이름</th>
					<td>
						<input type="text" name="e_name" id="e_name">
						<span class="guide2 ok2">이 이름은 사용 가능합니다</span>
						<span class="guide2 error2">이 이름은 사용  불가능합니다</span>
						<input type="hidden" name="nameDuplicateCheck" id="nameDuplicateCheck" value='0'>
					</td>
					
				</tr>
				
				<tr>
					<th>대표번호</th>
					<td><input type="tel" name="e_phone"></td>
				</tr>
				
				<tr>
					<th>중개사소개</th>
					<td><textarea name="e_content" rows="5" cols="33"></textarea></td>
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
					<th>사진</th>
					<td>
						<!-- <input type="file" id="" multiple="multiple"> -->
						
						<br>
						<img id="cover" src="${contextPath}/resources/images/mark.png" style="width: 182px; height: 168px;" />
						<br>
						<input type="file" id="fileName" name="fileName">
						
					</td>
				</tr>
				
				<tr>
					<th>중계전문분야</th>
					<td>
						<input type="checkbox" name="field" value="아파트">아파트
						<input type="checkbox" name="field" value="원룸">원룸
						<input type="checkbox" name="field" value="오피스텔">오피스텔
						
					</td>
				</tr>
				
				<tr>
					<th>사업자등록번호</th>
					<td><input type="text" name="e_reg_num"></td>
				</tr>
				
				<tr>
					<th>등록아이디</th><!-- 일반회원가입한사람만가능 -->
					<td>
						<input type="text" name="us_id" id="us_id" placeholder="회원가입후 아이디등록가능">
						<span class="guide ok">이 아이디는 등록가능합니다</span>
						<input type="hidden" id="idDuplicateCheck" value='0'>
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
						<button onclick="return validate();">등록하기</button>
						<input type="reset" value="취소하기">
						<button type="button" onclick="location.href='home.do'">시작 페이지로 이동</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		
		//중개사아이디확인
		$('#us_id').on('keyup', function(){
			var us_id = $(this).val().trim();
			
			if(us_id.length < 4){
				$('.guide').hide();
				$('#idDuplicateCheck').val(0);
				
				return;
				
			}
			
			$.ajax({
				url: 'dupid2.me',
				data: {id:us_id},
				success: function(data) {
					console.log(data);
					if(data == 'true'){
						$('.guide.ok').hide();
						$('#idDuplicateCheck').val(1);
					}else {
						$('.guide.ok').show();
						$('#idDuplicateCheck').val(0);
					}
				}
			});
			
		});
		
		$('#e_name').on('keyup', function(){
			var e_name = $(this).val().trim();
			
			if(e_name.length < 1){
				$('.guide2').hide();
				$('#nameDuplicateCheck').val(0);
				
				return;
				
			}
			
			$.ajax({
				url: 'dupname.me',
				data: {name:e_name},
				success: function(data) {
					console.log(data);
					if(data == 'true'){
						$('.guide2.error2').hide();
						$('.guide2.ok2').show();
						$('#nameDuplicateCheck').val(1);
					}else {
						$('.guide2.ok2').hide();
						$('.guide2.error2').show();
						$('#nameDuplicateCheck').val(0);
					}
				}
			});
			
		});
		
		function validate() {
			if($('#idDuplicateCheck').val() == 1){
				alert('등록아이디가없으면 가입이안됩니다');
				$('#us_id').focus();
				return false;
			}else if($('#nameDuplicateCheck').val() == 0){
				alert('중개이름중복입니다');
				$('#e_name').focus();
				return false;
			}else {
				$('#joinForm').submit();
			}
		}
		
	
		function readURL(input) {
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	                $('#cover').attr('src', e.target.result);
	                $('#fileName2').val(input.files[0].name);
	                console.log($('#fileName2').val());
	            }
	          reader.readAsDataURL(input.files[0]);
	        }
	    }
		
		
		$('#fileName').change(function() {
			readURL(this);
		});
	</script>
	
</body>
</html>