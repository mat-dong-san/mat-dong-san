<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	html, body{
		margin:0;
		padding:0;
	}
<<<<<<< HEAD
	
	#bFAQModal_Wrapper,#bFAQModal_WrapperUpdate {
		display:none;
		position:fixed;
=======

	#bFAQModal_Wrapper{
		display:none;
		position:relative;
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
		border:1px solid black;
		width:400px;
		margin:180px auto;
	 	z-index:1;
	}
<<<<<<< HEAD
	
	#modal_FAQ_standard{
		border:none;
	}
	#modal_FAQ_standard  td{
		border:1px solid black;
	}
	
	.b_modal_QA{
		width:20px;
	}
	
	.b_modal_QA, .b_modal_QAUpdate{
=======
	.b_modal_QA{
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
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
<<<<<<< HEAD
	.bFAQ_Content, .bFAQ_ContentUpdate{
	 	background:white;	
=======
	.bFAQ_Content{
	 	background:white;
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
	 	padding:10px;
	}
	
	
<<<<<<< HEAD
	#FAQ_Wrapper{
           margin-top: 100px;
           margin-right: 200px; 
           margin-left: 200px;
    }
	#boardFAQ_Wrapper{
		width:790px;
		margin:100px auto;
	}
	
	.TA{
        font-size: 17px;
        outline: 0;
        border: 0;
        resize:none; 
		width:99%;
		overflow-x:hidden;
		overflow-y:hidden;
 	}
	#FAQ_A_TextArea{
		line-height:30px;
	}
	
	
 	table { 
 		border-collapse: collapse;
 		border-top:1px solid RGB(221, 212, 221);
 		width:100%;
 		padding-bottom: 100px;
 		
 	} 
 	
 	#centerAlign{
 		text-align:center;
 	}
 	#currentBtn{
        color: rgb(21, 100, 249);
       	font-weight: bold;
     	    
    }
    .pageBtn{
    	width: 35px;
		margin: 0 2px;
		padding: 8px 9px;
		border: 1px solid #c4c4c4;
		background-color: #FAFAFA;
  
    }
 	/* 수정 버튼 CSS */
 	.ud_btn{
 		background-color: white;
 		outline:none;
 		border:0;
 		cursor:pointer;
 		color:rgb(21, 100, 249);
 	}
 	#FAQ_Update_BTN:hover{
 		color:rgb(21, 100, 249);
 	}
 	#FAQ_Update_Cancel_BTN:hover{
 		color:rgb(21, 100, 249);
 	}
 	
 	/* */
 	.flex_FAQ_UpdateArea{
 		display:flex;
 	}
 	#FAQ_Update_confirmBTN{
	 	margin-left: auto; 
 	}
 	
 	
 	p{
 		margin:0;
 		padding:0;
 	}
 	#centerAlign{
 		border:none;
 	}
 	.ll{
 		border-bottom: 1px solid rgb(235, 235, 235);
 	}
 	.ll{
 		padding-top:20px;
 	}
 	#Ahide{
 		display:none;
 		
 	}
</style>
</head>
<body>
	<div id="FAQ_Wrapper">
		<c:import url="../../common/menubar.jsp"/>
		<c:import url="../../common/helpdeskSidebar.jsp"/>
		<div id="boardFAQ_Wrapper">
				<c:if test="${ loginUser.us_id == 'admin' }">
					<input type="button" value="모달창" id="b_modal_btn"/>
				</c:if>
				<table id="FAQ_Seletor">
					<tr>
						<c:if test="${ loginUser.us_id == 'admin' }">
						<td>
							<input type="checkbox">
						</td>
						</c:if>
					</tr>
					<form method="post" name="FAQForm">
						<c:if test="${ loginUser.us_id == 'admin' }">
							<input type="button"  value="삭제하기" onClick="FAQsubmit(1)">
						</c:if>
					<c:forEach var="FAQ" items="${ list }">
					<tr >
						<td cols="2" >
							<div class="b_qb_div">
								<div class="flex_FAQ_UpdateArea">
									<c:if test="${ loginUser.us_id == 'admin' }">
										<input type="button" id="FAQ_Update_BTN" class="ud_btn" value="수정"  b_id="${ FAQ.bId }">
										&middot;
										<input type="button" id="FAQ_Update_Cancel_BTN" class="ud_btn" value="취소" onclick="cancel();">
										<div id="FAQ_Update_confirmBTN" >
											<input type="button" id="FAQ" value="확인">
										</div>
									</c:if>
								</div>	
								<div class="b_question ll" id="Qhide">
									  <input type="hidden" value="${ FAQ.bId }" id="update_id">
									  <div style="display:flex;">
											<p>Q.&nbsp;&nbsp;&nbsp;</p>
											<textarea  id="FAQ_Q_TextArea" class="TA"   readOnly name="updatebTitle">${ FAQ.bTitle }</textarea>
									  </div>
								</div> 
								<div class="b_answer ll" id="Ahide">
									<div style="display:flex;">
										<p>A.&nbsp;&nbsp;&nbsp;</p>
										<textarea  id="FAQ_A_TextArea"  class="TA" readOnly name="updatebContent">${ FAQ.bContent }</textarea>
									</div>
							</div>
						</td>
						<c:if test="${ loginUser.us_id == 'admin' }">
						<td>
							<input type="checkbox" name="FAQDeletebId" value="${ FAQ.bId }" >
						</td>
						</c:if>	
					</tr>
					</c:forEach>				
					
					<!-- 페이징 -->
					<tr>
						<td id="centerAlign">
							<c:if test="${ pi.currentPage <= 1 }">
								< &nbsp;
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="boardFAQ.board">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a href="${ before }"><</a> &nbsp;
							</c:if>
							
								<!-- 페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
										<input type="button" value="${ p }" id="currentBtn" class="pageBtn"/>
<%-- 									<font color="red" size="4"><b>[${ p }]</b></font> --%>
								</c:if>
								
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="boardFAQ.board">
										<c:param name="page" value="${ p }"/>
									</c:url>
									<a href="${ pagination }"><input type="button" value="${ p }" class="pageBtn"/></a> &nbsp;
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
								<a href="${ after }">></a>
							</c:if>
						</td>
					</tr>
				</form>
				</table>
			</div>
=======
	<!-- 임시 -->
	#boardFAQ_Wrapper {
		background-color: yellow;
	}
	table {
		border-collapse: collapse;
	}
	td:nth-child(2) {
		border : 1px solid black;
	}
</style>
</head>
<body>
	<div id="boardFAQ_Wrapper">
		<input type="button" value="모달창" id="b_modal_btn"/>
		<table>
			<tr>
				<td>
					<input type="checkbox">
				</td>
				<td>자주묻는질문</td>
			</tr>
			<form method="post" action="FAQDelete.board" >
			<input type="submit" value="확인">
			<c:forEach var="FAQ" items="${ list }">
			<tr>
				<td>
					<input type="checkbox" name="FAQDeletebId" value="${ FAQ.bId }">
<%-- 					<c:url var="bdelete" value="FAQDelete.board" > --%>
<%-- 						<c:param name="bId" value="${ FAQ.bId }" /> --%>
<%-- 					</c:url> --%>
				</td>
				<td>
					<div class="b_qb_div">
						<div class="b_question">Q. ${ FAQ.bTitle }</div>
						<div class="b_answer">A. ${ FAQ.bContent }</div>
					</div>
				</td>				
			</tr>
			
			</c:forEach>
			
			<!-- 페이징 -->
			<tr>
				<td></td>
				<td>
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
							
		</table>
		</form>
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
	</div>
	
	<!-- 모달창 -->
	<div id="bFAQModal_Wrapper">
		<div class="bFAQ_Content" >
			<form action="InsertFAQ.board" method="post" >
				<table>
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
			</form>
		</div>
		<div class="b_modal_layer"></div>
	</div>
<<<<<<< HEAD
	
	
	
	<script>
		var loginUser = '${ loginUser.us_id }';
		if( loginUser == 'admin'){
			// 모달창 display on/off
			document.getElementById("b_modal_btn").onclick = function(){
		        document.getElementById("bFAQModal_Wrapper").style.display="block";
		    }
		    document.getElementById("b_modal_submit").onclick = function(){
		        document.getElementById("bFAQModal_Wrapper").style.display="none";
		    }
		    document.getElementById("modal_cancel").onclick = function(){
		        document.getElementById("bFAQModal_Wrapper").style.display="none";
		    }
			
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
    		$(this).parent().parent().children('.ll').children().children().attr('readOnly', false);
        });
    	$('#FAQ_Seletor').children().children().children().children().children().children('#FAQ_Update_Cancel_BTN').click(function() {
    		$(this).parent().parent().children('.ll').children().children().attr('readOnly', true);
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
    			alert('삭제되었습니다.');
    		}
    		document.FAQForm.submit();
    	}
    		
    	$('#FAQ_Seletor').children().children().children().children().children().children().children('#FAQ').click(function(){
    		var bId = $(this).parent().parent().parent().children('.b_question').children('#update_id').val();
    		console.log("b아이디"+bId);
    		var bTitle = $(this).parent().parent().parent().children('.b_question').children().children().eq(1).val();
    		console.log("비타이틀"+bTitle);
    		var bContent = $(this).parent().parent().parent().children('.b_answer').children().children().eq(1).val();
    		console.log("비콘" + bContent);
    		$.ajax({
    			url: 'FAQUpdate.board',
    			data : {bId:bId, bTitle:bTitle, bContent:bContent},
    			type:'post',
    			cache : false,
    			success: function(data){
    				var data = JSON.parse(data);
    				console.log(">>"+data)
    				console.log(">>>"+data.result)
    				
    				if(data.result == 1){
    					alert("변경완료");
    					
    				}
    				
    			}
    		});
    		
    	});
    		
    	$('#FAQ_Seletor').children().children().children().children().children('#Qhide').click(function(){
    		$(this).parent().children('#Ahide').toggle();
    		
    	});
   		
	 
    	$(function(){
    		$("#FAQ_A_TextArea").on('keydown keyup', function () {
    			$(this).height(1).height( $(this).prop('scrollHeight')+12 );    
    		});
    	});
    	
	    
=======
	<script>
		// 모달창 display on/off
		document.getElementById("b_modal_btn").onclick = function(){
	        document.getElementById("bFAQModal_Wrapper").style.display="block";
	    }
	    document.getElementById("b_modal_submit").onclick = function(){
	        document.getElementById("bFAQModal_Wrapper").style.display="none";
	    }
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
	</script>
	
	
</body>
</html>