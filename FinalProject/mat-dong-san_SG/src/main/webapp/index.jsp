<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	h1 {color: white;}
	#visual-btn {
		z-index: 50; color: #fff; font-size: 20px; border: 2px solid #fff;
		padding: 12px 24px; border-radius: 5px; cursor: pointer; background-color: rgba(0, 0, 0, 0);
	}
	#visual-btn:hover {
		color: #ff6868; font-size: 20px; border: 2px solid #ff6868;
		padding: 12px 24px; border-radius: 5px; cursor: pointer;
	}
	#indexBtn {position: fixed; text-align: center}
	.center {position: absolute; top: 60%; left: 47%; margin: -50px 0 0 -50px;}
</style>
</head>
<body>

	<h1 style="text-align:center; color:#fff">
		<img src="resources/images/sitelogo.png" style="height:50%; width:50%; border: 2px solid black "/>
	</h1>
	
	<p class="type_text" style="text-align:center; color:black; font-size:18pt"></p>
	
	<div id="indexBtn" class="center">
		<button id="visual-btn" onclick="javascript:location.href='home.do';">방구경하러</button>
	</div>
	
	
	<div class="video-film"></div>
	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<script type="text/javascript" src="resources/js/typeit.min.js"></script><!-- .js 넣기 -->
	<script type="text/javascript">
		$(function(){
			var str1 = ["맛동산입니다."];
			
			$('.type_text').typeIt({
				strings:str1,
				html:true,
				autoStart:true,
				loop:true,
				typeSpeed:100
			})
			.tiPause(1500)
			.tiDelete(130)
			.tiType(str2)
			.tiPause(1700)
			.tiDelete(130)
			.tiType(str3)
			.tiPause(1700)
			.tiEmpty(); 
		});
	</script>
</body>
</html>