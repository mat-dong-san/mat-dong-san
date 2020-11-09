<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	html, body{
		margin:0;
		padding:0;
	}

	#bFAQModal_Wrapper{
		display:none;
		position:relative;
		border:1px solid black;
		width:400px;
		margin:180px auto;
	 	z-index:1;
	}
	.b_modal_QA{
 	    padding:10px; 
	}
	
	.b_model_QA_input{
		width: 300px;
		height:50px;	
		}
	.b_modal_inputbox{
		width:100%;
		height:100%;
	}
	
	.b_modal_layer{
		position: fixed;
        left:0;
        top:0;
        width:100%;
        height:100%;
        background: rgba(0,0,0,0.5);
        z-index:-1;
	}
	
	#b_modal_submit{
		width:100%;
		height:50px;
	}
	.bFAQ_Content{
	 	background:white;
	 	padding:10px;
	}
	
</style>
</head>
<body>
	<input type="button" value="모달창" id="b_modal_btn"/>
	<div id="boardFAQ_Wrapper">
		<table>
			<tr>
				<td>자주묻는질문</td>
			</tr>
			<c:forEach var="b" items="${ list }">
			<tr>
				<td>
					<div class="b_qb_div">
						<div class="b_question">Q. 질문1</div>
						<div class="b_answer">A. 답변</div>
					</div>
				</td>
			</tr>
			</c:forEach>				
		</table>
	</div>	
	
	<!-- 모달창 -->
	<div id="bFAQModal_Wrapper">
		<div class="bFAQ_Content">
			<table>
				<tr>
					<td class="b_modal_QA">
						<div>Q.</div>
					</td>
					<td class="b_modal_QA b_model_QA_input">
						<input type="text" class="b_modal_inputbox" id="modal_Q"/>
					</td>
				</tr>
				<tr>
					<td class="b_modal_QA">
						<div>A.</div>
					</td>
					<td class="b_modal_QA b_model_QA_input">
						<input type="text" class="b_modal_inputbox" id="modal_A"/>
					</td>
				</tr>
			</table>		
			<input type="submit" value="확인" id="b_modal_submit"/>
		</div>
		<div class="b_modal_layer"></div>
	</div>
	
	<script>
	document.getElementById("b_modal_btn").onclick = function(){
        document.getElementById("bFAQModal_Wrapper").style.display="block";
    }
    document.getElementById("b_modal_submit").onclick = function(){
        document.getElementById("bFAQModal_Wrapper").style.display="none";
    }
	
    // 모달창에서 데이터값 넘기기 
    $('#b_modal_submit').on('click',function(){
    	var rQuestion = $('#modal_Q').val();
    	var rAnswer = $('#modal_A').val();
// 		console.log(rQuestion);
// 		console.log(rAnswer);
    	
    	$.ajax({
    		url:'bFAQ.board',
    		data: {rQuestion:rQuestion, rAnswer:rAnswer},
    		type: 'post',
    		success: function(data){
    			console.log(data);
    			alert("등록완료",data);
    			
    		}
    	});
    });
    
    
    
	</script>
	
	
	
</body>
</html>