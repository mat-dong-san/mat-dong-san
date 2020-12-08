<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>1대1문의목록</title>
    <style>
        html, body{
            height:100%;
            margin:0;
            padding:0;
        }
		body{
            background-color:#f9fbfc;
		}
        #oneToOneView_Wrapper{
/*       	 	width:1100px; */
            margin-top: 100px;
            height:80%;
            margin-right: 200px;
            margin-left:200px;
        }
        #oneToOneView_innerWrapper{
            width:1100px;
            margin:100px auto;
        }
        #oneToOneView_head{
            border-bottom:1px solid black;

        }
        #mid_flex_div{
            display: flex;

        }
        .oneToOneListMid_right{
            margin-left: auto;
            margin-right: 50px;	
            margin-bottom:20px;
        }

        #oneToOneView_body{
            margin-top: 10px;
<<<<<<< HEAD
            /* border-top:1px solid black;
            border-bottom:1px solid black; */
/*             border-bottom: 1px solid black; */
/* 			border: 1px solid black; */
=======
>>>>>>> parent of 408f50c... 오케이오케
            margin-bottom:100px;
        }
        .oneToOneView_body_table{
            padding:5px;
        }
        table{
            width:100%;
            margin-top: 10px;
<<<<<<< HEAD
            border: 1px solid black; 
=======
>>>>>>> parent of 408f50c... 오케이오케
            border-collapse: collapse;
        }
        td { 
        	
            border: 1px solid black; 
            padding: 10px 10px 10px 10px;
        }
        tbody>tr td:nth-child(2){
            width:1fr;
        }
        
        #ck_box{
        	width:50px;
        }
        
       	#noticeCountDiv, #fst{
        	width:80px;
        }
		td:nth-child(4){
			width:100px;
		}
        
        .oneToOneView_column{
               text-align: left;
        }
        .oneToOneView_body_table>table>thead>tr>th{
			padding-left: 10px;
		}        
        #centerAlign{
        	text-align: center;
        	padding: 10px;
        }
        
<<<<<<< HEAD
=======
        
        
        
        
>>>>>>> parent of 408f50c... 오케이오케
    </style>
</head>
<body>
    <div id="oneToOneView_Wrapper">
        <c:import url="../../common/menubar.jsp"/>
        <c:import url="../../common/helpdeskSidebar.jsp"/>
       	<form method="post"name="oneToOneListForm">
        <div id="oneToOneView_innerWrapper" >
            <!-- head-->
            <div id="oneToOneView_head">
                <div class="oneToOne_top">
                    <h2 id="oneToOneView_title">1대1문의</h2>
                </div>
                <div class="oneToOne_mid">
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_right">
<<<<<<< HEAD
                            <input type="button" id="oneToOne_goDetail" onClick="oneToOneWrite();" value="작성하기"/>
                            <input type="button" onClick="oneToOnebIdDelete();" value="삭제하기"/>
=======
                            <input type="button" class="nBtn"id="oneToOne_goDetail" onClick="oneToOneWrite();" value="작성하기"/>
                            <c:if test="${ loginUser.us_id == 'admin' }">
                            <input type="button" class="nBtn" onClick="oneToOnebIdDelete();" value="삭제하기"/>
                        	</c:if>
>>>>>>> parent of 408f50c... 오케이오케
                        </div>
                    </div>
                </div>
            </div>
            <!-- body-->
            <div id="oneToOneView_body">
                <div class="oneToOneView_body_table">
                    <table>
                        <thead>
<<<<<<< HEAD
                            <tr>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span><input type="checkbox" /></span>
                                    </div>
                                </th>
                                <th>
=======
                            <tr >
                            	<c:if test="${ loginUser.us_id == 'admin' }">
	                                <th class="fstLast">
	                                    <div class="oneToOneView_column" >
	                                        <span><input type="checkbox" /></span>
	                                    </div>
	                                </th>
                                </c:if>
                                <th class="sec">
>>>>>>> parent of 408f50c... 오케이오케
                                    <div class="oneToOneView_column">
                                        <span>번호</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span>내용</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span>등록일</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span>답변여부</span>
                                    </div>	
                                </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="oneToOne" items="${ list }">
                            <tr>
<<<<<<< HEAD
                                <td id="ck_box">
                                    <div class="oneToOneView_column">
                                        <span>
                                        	<input type="checkbox" name="deleteOneToOneId" value="${ oneToOne.bId }"/>
                                        </span>
                                    </div>
                                </td>
                                <td id="fst">
                                    <div class="oneToOneView_column">
                                        <span>${ oneToOne.bId }</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="oneToOneView_column goOneToOneDetail">
                                        <span>${ oneToOne.bContent }</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="oneToOneView_column">
                                        <span>${ oneToOne.bRegD }</span>
                                    </div>
                                </td>
                                <td id="noticeCountDiv">
                                    <div class="oneToOneView_column">
=======
                            	<c:if test="${ loginUser.us_id == 'admin' }">
	                                <td id="ck_box" class="fstLast">
	                                    <div class="oneToOneView_column">
	                                        <input type="checkbox" name="deleteOneToOneId" value="${ oneToOne.bId }"/>
	                                    </div>
	                                </td>
                                </c:if>
                                
                                <td id="fst" class="sec">
                                    <div class="oneToOneView_column">
                                        <span>${ oneToOne.bId }</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="oneToOneView_column goOneToOneDetail">
                                        <span>${ oneToOne.bContent }</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="oneToOneView_column">
                                        <span>${ oneToOne.bRegD }</span>
                                    </div>
                                </td>
                                <td id="noticeCountDiv" style="border-right:none;">
                                    <div class="oneToOneView_column">
>>>>>>> parent of 408f50c... 오케이오케
                                        <span>처리중</span>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        	<tr>
								<td id="centerAlign" colspan="5">
									<c:if test="${ pi.currentPage <= 1 }">
										[이전] &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="boardOneToOne.board">
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }">[이전]</a> &nbsp;
									</c:if>
									
<!-- 										페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="red" size="4"><b>[${ p }]</b></font>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="boardOneToOne.board">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach>
								
<!-- 									[다음] -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										[다음]
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="boardOneToOne.board">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
										<a href="${ after }">[다음]</a>
									</c:if>
								</td>
							</tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </form>
    </div>
    <script>
		// 디테일 이동 , 조회수 
		$('.goOneToOneDetail').click(function(){
			var oneToOneId = $(this).parent().parent().children('#fst').children().children().text();
			location.href = "oneToOneDetail.board?bId=" + oneToOneId + "&page=" + ${pi.currentPage};
		});
        
		
		
		
		
		function oneToOneWrite(){
 			document.oneToOneListForm.action="goOneToOneWrite.board";
			document.oneToOneListForm.submit();
		}
		
		function oneToOnebIdDelete() {
			var select = confirm("삭제하시겠습니까?");
			if(select === true){
				document.oneToOneListForm.action="oneToOneDelete.board";
				document.oneToOneListForm.submit();
				alert('삭제 완료되었습니다.');
			}else{
				location.href=location.href;
			}
		}


    </script>
</body>
</html>	