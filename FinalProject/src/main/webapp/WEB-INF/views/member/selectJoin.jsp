<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Document</title>
<style>
	html {
		margin: 0;
		padding: 0;
	}
	
	#member_Wrapper {
		border: 1px solid rgb(0, 0, 0);
		width: 200px;
		padding: 10px;
	}
	
	.member_Title {
		text-align: center;
		margin: 0 auto;
	}
	
	.member_Body {
		display: grid;
		grid-template-rows: repeat(1, 40px);
		grid-template-columns: repeat(2, 1fr);
	}
	
	.member_mButton {
		width: 100%;
		height: 100%;
		background-color: white;
		outline: none;
	}
	
	.member_Body_div1 {
		margin-right: 2px;
	}
</style>
</head>
<body>
    <div id="member_Wrapper">
        <div class="member_Title">
            <h4>회원가입</h4>
        </div>
        <div class="member_Body">
            <div class="member_Body_div1">
                <!-- 일반 회원 -->
                <button type="button" onclick="location.href='memberJoin.me'" class="member_mButton">일반회원</button>
			
            </div>
            <div class="member_Body_div1">
                <!-- 중계사 회원 -->
                <button type="button" onclick="location.href='estateAgentJoin.me'" class="member_mButton">중개사회원</button>
			
            </div>
        </div>
    </div>
</body>
</html>