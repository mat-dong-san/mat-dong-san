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
	<script>
		// 모달창 display on/off
		document.getElementById("b_modal_btn").onclick = function(){
	        document.getElementById("bFAQModal_Wrapper").style.display="block";
	    }
	    document.getElementById("b_modal_submit").onclick = function(){
	        document.getElementById("bFAQModal_Wrapper").style.display="none";
	    }
	</script>
	
	
</body>
</html>