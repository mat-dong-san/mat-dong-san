<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
.popup_memo{
	text-align: center;
	border: 1px solid black;
	width: 500px;
}

</style>
</head>
<body onload="inputValue();">

<div class="popup_memo">
	<div class="popup_title"><img src="http://img.pharmsnet.com/images/contents/popup/p_memo_send_top.gif" alt="쪽지보내기"></div>
	<form id="messageForm">
		<div class="popup_middle">
			<input type="hidden" id="us_id" name="us_id" readOnly>
			<input type="hidden" id="p_id" name="p_id" readOnly>
			<input type="hidden" id="e_id" name="e_id" readOnly>
			<div class="popup_middle_in">
		  	   <ul class="message_name">
		  		<li><em>보내는중개사 :</em> <input type="text" id="e_name" name="e_name" readOnly></li>	  		
		  	   </ul>
		  	
			  	<div class="message">
			  		<textarea style="width:450px;height:190px;" id="un_content" name="un_content"></textarea>
			  		<p style="height:10px;text-align:right;margin-right:20px;font-size:11px;color:#5e5e5e;">500자 (최대 500자까지 가능)</p>
			  	    <p><button type="button" class="btn_send01" id="send" name="send"><span class="hidden">쪽지보내기</span></button></p>
			  		<p style="height:10px;font-size:11px;color:#ab3023;">특정 목적을 위한 스팸이나 음란성 내용을 전송할 시 경고 없이 이용이 제한될 수 있습니다.</p>
			  	</div>
		  	
		   </div>
		</div>
	</form>
	<div class="popup_bottom"><input type="button" class="popup_btn_close" onclick="noteClose();"><span class="hidden">창닫기</span></button></div>
</div>

<script>
	function inputValue(){
		document.getElementById("e_name").value = opener.document.e_Info.e_name.value;
		document.getElementById("e_id").value = opener.document.e_Info.e_id.value;
		document.getElementById("p_id").value = opener.document.e_Info.p_id.value;
		document.getElementById("us_id").value = opener.document.e_Info.us_id.value;
		
	}
	

	function noteClose(){
		self.close();
	}
	
	$("#send").click(function() {
		var us_id = $("#us_id").val();
		var p_id = $("#p_id").val();
		var e_id = $("#e_id").val();
		var un_content = $("#un_content").val();
    	
    	var confirm_val = confirm("보내시겠습니까?");
        if(confirm_val) {
        	
        	$.ajax({
  				url:'insertMessage.pr',
  				data:{us_id:us_id, p_id:p_id, e_id:e_id, un_content:un_content},
  				success:function(data){
  					console.log(data);
  					if(data == "1"){
  						alert('성공');
  					}else {
  					}
  					
  				}
  			});
        	
        }
	});
	
	
	
</script>


</body>
</html>