<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.popup_memo{
	text-align: center;
	border: 1px solid black;
	width: 500px;
}

</style>
</head>
<body>

<div class="popup_memo">
	<div class="popup_title"><img src="http://img.pharmsnet.com/images/contents/popup/p_memo_send_top.gif" alt="쪽지보내기"></div>
	<div class="popup_middle">
		<div class="popup_middle_in">
	  	   <ul class="message_name">
	  		<li><em>받는사람 :</em> pharmsnet.com | <span style="font-weight:bold;">관리자</span></li>	  		
	  	</ul>
	  	<div class="message">
	  		<textarea style="width:450px;height:190px;"></textarea>
	  		<p style="height:10px;text-align:right;margin-right:20px;font-size:11px;color:#5e5e5e;">500자 (최대 500자까지 가능)</p>
	  	    <p><button type="button" class="btn_send01"><span class="hidden">쪽지보내기</span></button></p>
	  		<p style="height:10px;font-size:11px;color:#ab3023;">특정 목적을 위한 스팸이나 음란성 내용을 전송할 시 경고 없이 이용이 제한될 수 있습니다.</p>
	  	</div>
	   </div>
	</div>
	<div class="popup_bottom"><button type="button" class="popup_btn_close"><span class="hidden">창닫기</span></button></div>
</div>


</body>
</html>