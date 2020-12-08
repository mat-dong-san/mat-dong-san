<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberJoin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/member-style.css" type="text/css">
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>   
<style>
span.guide{display: none; font-size: 12px; top: 12px; right: 10px;}
span.ok{color: green}
span.error{color: red}

body {
   text-align: center;
   height: 700px;
}

#danger{
color:red; display:flex; font-size: 12px;
}
#success{
color:blue;font-size: 12px;
}

.form-memberJoin {
   width: 650px;
   margin: 0 auto;
   position: relative;
   top: 50%;
   transform: translateY(-50%);
}


.member-form-container{
   justify-content: space-between;
   width: 100%;
   height: 800PX;
   
}


.form-group {
   width: 650px;
   height: 35px;
   margin: 10px 0 30px 0;
   position: relative;
}

.form-group>input {
   width: 100%;
   height: 100%;
   border: none;
   border: 2px solid;
   font-size: 18px;
}

.form-group>input[type="date"] {
   font-size: 12px;
}

.form-group>label {
   position: absolute;
   top: 2px;
   left: 15px;
   transform: translateY(-50%);
   font-size: 15px;
   padding: 0px;
   background:#fff;
}

</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align="center">회원가입</h1>
	
	<div class="centerText">
		<div class="member-form-container">
		<form action="minsert.me" class="form-memberJoin" method="post" id="joinForm">
				<div class="form-group" id="usID">
					<label for="name">아이디</label> 
					<input type="text" name="us_id" id="us_id"placeholder=" 입력해주세요!">
					<span class="guide ok">이 아이디는 사용 가능합니다</span>
					<span class="guide error">이 아이디는 사용  불가능합니다</span>
					<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value='0'>
				</div>

				<div class="form-group">
					<label for="password">비밀번호</label> 
					<input type="password"name="us_pwd" id="us_pwd" >
				 </div>
				 <div class="form-group">
					<label for="password2">비밀번호 확인</label> 
					<input type="password" name="us_pwd2" id="us_pwd2" >
				 </div>
				 
				 <div class="success1" id="success">비밀번호 일치</div>
				 <div class="danger1" id="danger">비밀번호 불일치</div>
				
				 <div class="form-group">
					<label for="name">이름</label> 
					<input type="text"name="us_name" id="us_name" >
				 </div>
			
				<div class="form-group">
					<label for="Security Number">주민번호</label>
					<input type="text"name="us_ssn" id="us_ssn"placeholder=" -  포함해서 입력해주세요!">
				</div>
				
				<div class="form-group">
					<label for="phone">전화번호</label>
					<input type="tel" name="us_phone">
				</div>

				<div class="form-group">
					<label for="email">email</label>
					<input type="email" name="us_email">
				</div>

				<div class="form-group">
					<label for="address">우편번호</label>
					<input type="text" name="post" class="postcodify_postcode5" value="" size="6">
					<button type="button" id="postcodify_search_button">검색</button>
				</div>
				<div class="form-group">
					<label for="address">도로명 주소</label>
					<input type="text" name="address1" class="postcodify_address" value="">
				</div>
				<div class="form-group">
					<label for="address">상세주소</label>
					<input type="text" name="address2" class="postcodify_extra_info" value="">
				</div>


				<!-- jQuery와 Postcodify를 로딩한다. -->
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function() {
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>

				<div class="check-group1">
					<hr class="hr_group">
						   회원 유형 
					   <input type="checkbox" name="us_type" id="us_type"value="일반"onclick="memberClick(this)"> 
					   <label for="member_type">일반회원</label> 
					   <input type="checkbox" name="us_type" id="us_type2" value="중개사"onclick="memberClick(this)">
					   <label for="member_type2">중개사 회원</label>
					</div>
				<hr>
				
				<!-- 버튼 그룹 -->
				<div class="btns" id="signUpBtns" align="center">
					<button onclick="return validate();">가입하기</button>
					<input type="reset" value="취소하기">
					<button type="button" onclick="location.href='home.do'">시작 페이지로 이동</button>
				</div>
				<!-- 버튼 그룹 끝  -->
		</form>
		</div>
	</div>
	<script>

	  // 비밀번호 일치여부 확인
      $(function() {
         $("#success").css("display", "none");
         $("#danger").css("display", "none");
         $("input").keyup(function() {
            var us_pwd = $("#us_pwd").val();
            var us_pwd2 = $("#us_pwd2").val();
            if (us_pwd != "" || us_pwd2 != "") {
               if (us_pwd == us_pwd2) {
                  $("#success").css("display", "block");
                  $("#danger").css("display", "none");
               } else {
                  $("#success").css("display", "none");
                  $("#danger").css("display", "block");
               }
            }
         });
	  });
	  
	  
		// 아이디 중복
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
	
		// 아이디 중복
		function validate() {
			if($('#idDuplicateCheck').val() == 0){
				alert('사용 가능한 아이디를 입력해주세요');
				$('#us_id').focus();
				return false;
			}else {
				$('#joinForm').submit();
			}
		}

		//member_type 중복 체크 방지
		function memberClick(chk) {
         var obj = document.getElementsByName("us_type");
         for (var i = 0; i < obj.length; i++) {
            if (obj[i] != chk) {
               obj[i].checked = false;
            }
         }
   
      }
		
	</script>
	
</body>
</html>