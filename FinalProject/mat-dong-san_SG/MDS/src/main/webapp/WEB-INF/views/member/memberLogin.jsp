<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/main_login.css" type="text/css">
    <title>Document</title>
</head>

<body>
    <div id="login_wrapper">
        <div class="login_All">
            <div class="login-head">
                <img alt="logo" src="${contextPath}/resources/images/login_logo.png">
            </div>
            <div class="login-body">
                <form autocomplete="off" action="login.me" method="post">
                    <p class="login_text">아이디</p>
                    <div class="login_InteractiveInput">
                        <input placeholder="아이디를 입력해주세요." type="text" name="us_id" autofocus>
                    </div>
                    <p class="login_fail_message">zz</p>
                    <p class="login_text">패스워드</p>
                    <div class="login_InteractiveInput">
                        <input placeholder="비밀번호를 입력해주세요." type="password" name="us_pwd">
                    </div>
                    <p class="login_fail_message">zz</p>
                    <div class="login_submitBtnWrapper">
	                    <button class="login_Btn">
	                        <span>로그인</span>
	                    </button>
                	</div>
                </form>
                
                <br><br><br><br>
            </div>
        </div>
    </div>
</body>
</html>