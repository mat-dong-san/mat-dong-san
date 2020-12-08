<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body{
		margin:0;
		padding:0;
	}
<<<<<<< HEAD

=======
	
>>>>>>> parent of 408f50c... 오케이오케
	#bFAQModal_Wrapper,#bFAQModal_WrapperUpdate {
		visibility:hidden;
		position:fixed;
		border:1px solid black;
		width:400px;
	 	z-index:1;
	 	top: 0px;
	 	left:0px;
	}
<<<<<<< HEAD
=======
	
	#modal_FAQ_standard{
		border:none;
	}
	#modal_FAQ_standard  td{
		border:1px solid black;
	}
	
	.b_modal_QA{
		width:20px;
	}
	
>>>>>>> parent of 408f50c... 오케이오케
	.b_modal_QA, .b_modal_QAUpdate{
 	    padding:10px; 
	}
	
	.b_model_QA_input, .b_model_QA_inputUpdate{
		width: 300px;
		height:50px;	
		}
	.b_modal_inputbox, .b_modal_inputboxUpdate{
		width:100%;
		height:100%;
		outline: none;
		border:none;
	}
	
	.b_modal_layer, .b_modal_layerUpdate{
		position: fixed;
        left:0;
        top:0;
        width:100%;
        height:100%;
        background: rgba(0,0,0,0.5);
        z-index:-1;
	}
	
	#b_modal_submit, #b_modal_submitUpdate ,#modal_cancel{
		width:100%;
		height:50px;
		
	}
	.bFAQ_Content, .bFAQ_ContentUpdate{
<<<<<<< HEAD
	 	background:white;
=======
	 	background:white;	
>>>>>>> parent of 408f50c... 오케이오케
	 	padding:10px;
	}
	
	
	#FAQ_Wrapper{
           margin-top: 100px;
           height:80%;
           margin-right: 200px; 
           margin-left: 200px;
    }
	#boardFAQ_Wrapper{
		width:1100px;
		margin:100px auto;
	}
	
	#FAQ_Q_TextArea{
		resize:none;
		width:99%;
	}
	#FAQ_A_TextArea{
		resize:none;
		width:99%
	}
	
 	table { 
 		border-collapse: collapse;
 		width:100%
 	} 
 	td:nth-child(1) { 
 		border : 1px solid black; 
 	} 
 	td:nth-child(2){
 		border : 1px solid black; 
 		width:10px;
 	}
 	
 	.b_modal_QA{
 		width:10%;
 	}
 	
 	#centerAlign{
 		text-align:center;
 	}
 	
 	/* 수정 버튼 CSS */
 	#FAQ_Update_BTN{
 		background-color: white;
 		outline:none;
 		border:0;
 		cursor:pointer;
 	}
 	#FAQ_Update_BTN:hover{
 		color:red;
 	}
 	
 	/* */
 	.flex_FAQ_UpdateArea{
 		display:flex;
 	}
 	#FAQ_Update_confirmBTN{
	 	margin-left: auto; 
 	}
</style>
</head>
<body>
	<div id="FAQ_Wrapper">
		<c:import url="../../common/menubar.jsp"/>
		<c:import url="../../common/helpdeskSidebar.jsp"/>
		<div id="boardFAQ_Wrapper">
				<input type="button" value="모달창" id="b_modal_btn"/>
				<table id="FAQ_Seletor">
					<tr>
						<td>자주묻는질문</td>
						<td>
							<input type="checkbox">
						</td>
					</tr>
					<form method="post" name="FAQForm">
					<input type="button" value="삭제하기" onClick="FAQsubmit(1)">
					<c:forEach var="FAQ" items="${ list }">
					<tr>
						<td cols="2">
							<div class="b_qb_div">
								<div class="flex_FAQ_UpdateArea">
									<input type="button" id="FAQ_Update_BTN" value="수정"  b_id="${ FAQ.bId }">
									&middot;
									<input type="button" id="FAQ_Update_Cancel_BTN" value="취소" onclick="cancel();">
									<div id="FAQ_Update_confirmBTN" >
										<input type="button" id="FAQ" value="확인">
									</div>
								</div>	
								<div class="b_question ll">
									  <input type="hidden" value="${ FAQ.bId }" id="update_id">
									Q.<textarea  id="FAQ_Q_TextArea" class="TA"   readOnly name="updatebTitle">${ FAQ.bTitle }</textarea>
								</div> 
								<div class="b_answer ll">
									A.<textarea  id="FAQ_A_TextArea" class="TA" readOnly name="updatebContent">${ FAQ.bContent }</textarea>
								</div>
							</div>
						</td>
						<td>
							<input type="checkbox" name="FAQDeletebId" value="${ FAQ.bId }" >
							<!-- 나중에 지워요. -->${ FAQ.bId }
						</td>	
					</tr>
					</c:forEach>				
					
					<!-- 페이징 -->
					<tr>
						<td id="centerAlign">
							<c:if test="${ pi.currentPage <= 1 }">
								[이전] &nbsp;
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="boardFAQ.board">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a href="${ before }">[이전]</a> &nbsp;
							</c:if>
							
								<!-- 페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<font color="red" size="4"><b>[${ p }]</b></font>
								</c:if>
								
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="boardFAQ.board">
										<c:param name="page" value="${ p }"/>
									</c:url>
									<a href="${ pagination }">${ p }</a> &nbsp;
								</c:if>
							</c:forEach>
						
							<!-- [다음] -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								[다음]
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="boardFAQ.board">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url> 
								<a href="${ after }">[다음]</a>
							</c:if>
						</td>
					</tr>
				</form>
				</table>
			</div>
	</div>
	
	<!-- 모달창 -->
	<div id="bFAQModal_Wrapper">
		<div class="bFAQ_Content" >
			<form action="InsertFAQ.board" method="post" >
				<table id="modal_FAQ_standard">
					<tr>
						<td class="b_modal_QA">
							<div>Q.</div>
						</td>
						<td class="b_modal_QA b_model_QA_input">
							<input type="text" class="b_modal_inputbox" id="modal_Q" name="rQuestion"/>
						</td>
					</tr>
					<tr>
						<td class="b_modal_QA">
							<div>A.</div>
						</td>
						<td class="b_modal_QA b_model_QA_input">
							<input type="text" class="b_modal_inputbox" id="modal_A" name="rAnswer"/>
						</td>
					</tr>
				</table>		
				<input type="submit" value="확인" id="b_modal_submit"/>
				<input type="button" value="취소" id="modal_cancel">
			</form>
		</div>
		<div class="b_modal_layer"></div>
	</div>
	
	
	
	</div>
	<script>
		// 모달창 display on/off
		document.getElementById("b_modal_btn").onclick = function(){
	        document.getElementById("bFAQModal_Wrapper").style.visibility="visible";
	    }
	    document.getElementById("b_modal_submit").onclick = function(){
	        document.getElementById("bFAQModal_Wrapper").style.visibility="hidden";
	    }
	    
	    // 모달창 가운데로 위치
	    $('#bFAQModal_Wrapper').css({
	        "top":(($(window).height()-$('#bFAQModal_Wrapper').outerHeight())/2+$(window).scrollTop())+"px",
	        "left":(($( window ).width()-$('#bFAQModal_Wrapper').outerWidth())/2+$(window).scrollLeft())+"px"
	    });
	    
	    
	    // 수정하는 모달창 가운데로
	    $('#bFAQModal_WrapperUpdate').css({
	        "top":(($(window).height() - $('#bFAQModal_WrapperUpdate').outerHeight())/2+$(window).scrollTop())+"px",
	        "left":(($( window ).width() - $('#bFAQModal_WrapperUpdate').outerWidth())/2+$(window).scrollLeft())+"px"
	    });
	    
		
//     	$("#FAQ_Update_BTN").click(function(){
// //     		$(".test").attr("readOnly", false);
// 			alert('test');
//     	});
    	
    	//각 수정 요소 마다 readOnly 
    	$('#FAQ_Seletor').children().children().children().children().children().children('#FAQ_Update_BTN').click(function() {
    		$(this).parent().parent().children('.ll').children().attr('readOnly', false);
        });
    	$('#FAQ_Seletor').children().children().children().children().children().children('#FAQ_Update_Cancel_BTN').click(function() {
    		$(this).parent().parent().children('.ll').children().attr('readOnly', true);
        });
    	
    	// 값보내기 테스트
    	
//     	$('.flex_FAQ_UpdateArea').children('#FAQ_Update_confirmBTN').children().click(function(){
//     			var bTitle = $('.b_question').children('#FAQ_Q_TextArea').val();
//     			console.log(bTitle);
    		
//     	});
    	
    	function FAQsubmit(index){
//     		comfirm('삭제하시겠습니까?');
    		if (confirm("삭제?") == true && index == 1){
    			
    			document.FAQForm.action='FAQDelete.board';
    			alert('삭제되었슴ㅋ');
    		}
    		document.FAQForm.submit();
    	}
    		
    	$('#FAQ_Seletor').children().children().children().children().children().children().children('#FAQ').click(function(){
    		var bId = $(this).parent().parent().parent().children('.b_question').children('#update_id').val();
    		var bTitle = $(this).parent().parent().parent().children().children('#FAQ_Q_TextArea').val();
    		var bContent = $(this).parent().parent().parent().children('.b_answer').children().val();
    		
    		console.log(bId);
    		console.log(bTitle);
    		console.log(bContent);
    		$.ajax({
    			url: 'FAQUpdate.board',
    			data : {bId:bId, bTitle:bTitle, bContent:bContent},
    			type:'post',
    			cache : false,
    			success: function(data){
    				var data = JSON.parse(data);
    				console.log(data)
    				console.log(data.result)
    				
    				if(data.result == 1){
    					alert("변경완료");
    				}
    				
    			}
    		});
    		
    	});
    			
    	
   		
	 
	    
	</script>
	
	
</body>
</html>