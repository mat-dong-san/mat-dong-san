<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.popup_report{
	text-align: center;
	border: 1px solid black;
	width: 500px;
}

</style>
</head>
<body>

<div class="popup_report">
	<div class="popup_title"><img id="cover" src="${contextPath}/resources/images/report.png" style="width: 500px; height: 50px;" /></div>
	<div class="popup_middle">
		<div class="popup_middle_in">
	  	   <ul class="report_name">
	  		<li><em>신고대상 : </em><span style="font-weight:bold;">werty45</span></li>
	  		  		
	  	</ul>
	  	<hr>
	  	<br>
	  	신고사유 : 
	  	<input type="radio" name="" value="">욕설 
	  	<input type="radio" name="" value="">음란
	  	<input type="radio" name="" value="">불법자료
	  	<input type="radio" name="" value="">스팸/광고
	  	<input type="radio" name="" value="">기타
	  	<br>
	  	<br>
	  	<div class="report">
	  		<br>
	  		<textarea style="width:450px;height:190px;"></textarea>
	  		<p style="height:10px;text-align:right;margin-right:20px;font-size:11px;color:#5e5e5e;">500자 (최대 500자까지 가능)</p>
	  	    <p><button type="button" class="btn_report01"><span class="hidden">신고하기</span></button></p>
	  		<p style="height:10px;font-size:11px;color:#ab3023;">저작권 위반 게시물은 고객센터의 권리침해신고를 이용해 주시기 바랍니다.</p>
	  	</div>
	   </div>
	</div>
	<div class="popup_bottom"><button type="button" class="popup_btn_close"><span class="hidden">창닫기</span></button></div>
</div>


</body>
</html>