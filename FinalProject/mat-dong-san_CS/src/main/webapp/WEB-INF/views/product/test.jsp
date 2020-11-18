<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

	<input type="button" id="p_id" value="21">클릭
	<input type="button" id="p_id1" value="22">클릭
	<input type="button" id="p_id2" value="23">클릭
	<input type="button" id="p_id3" value="24">클릭
	
	<script>
	
		
		$('#p_id, #p_id1, #p_id2, #p_id3').on('click', function(){
			var p_id = $(this).val();
			$.ajax({
				url: 'selectProductRoom.search',
				data: {p_id:p_id},
				success: function(data){
					console.log(data);
					alert('전송성공');
				}
			});
		});
		
	
	</script>
</body>
</html>