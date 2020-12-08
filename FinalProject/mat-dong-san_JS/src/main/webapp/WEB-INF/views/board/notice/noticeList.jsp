<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        #oneToOneView_Wrapper{
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
            border:1px solid black;

        }
        #mid_flex_div{
            display: flex;

        }
         .nBtn{
        	border:none;
        	color:white;
        	background-color:#333;
        }
        .oneToOneListMid_right{
            margin-left: auto;
            margin-right: 50px;
            margin-bottom:20px;
        }

        #oneToOneView_body{
            margin-top: 10px;
            /* border-top:1px solid black;
            border-bottom:1px solid black; */
            border: 1px solid black;
            height: 500px;
            margin-bottom:100px;
        }
        .oneToOneView_body_table{
            padding:5px;
        }
        table{
            width:100%;
            margin-top: 10px;
<<<<<<< HEAD
/*             border: 1px solid black;  */
            border-collapse: collapse;
            border-left:0;
            border-right:0;
        }
        td,th { 
        	
            border: 1px solid RGB(221, 212, 221);
            padding: 10px 10px 10px 10px;
=======
        }
        td { 
            border-bottom: 1px solid black; 
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
        }
        tbody>tr th:nth-child(2){
            width:1fr;
        }
<<<<<<< HEAD
        
        .td_date{
        	width:100px;
        }
        
        #ck_box{
        	width:50px;
        }
        
       	#noticeCountDiv, #fst, .fst{
        	width:60px;
        }
/*         table>tbody>tr td:not(:nth-child(2)){ */
/*             width:100px; */
/*         } */
        
        .oneToOneView_column{
               text-align: left;
        }
        .oneToOneView_body_table>table>thead>tr>th{
			padding-left: 10px;
		}        
        #centerAlign{
        	text-align: center;
        	padding: 50px;
        	border-bottom:none;
        }
        
=======

        table>tbody>tr td:not(:nth-child(2)){
            width:200px;
        }
        .oneToOneView_column{
               text-align: left;
        }
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
    </style>
</head>
<body>
    <div id="oneToOneView_Wrapper">
        <div id="menubar">
        </div>
        
        <div id="loaded">
        </div>
        <div id="oneToOneView_innerWrapper">
            <!-- head-->
            <div id="oneToOneView_head">
                <div class="oneToOne_top">
                    <h2 id="oneToOneView_title">공지사항</h2>
                </div>
                <div class="oneToOne_mid">
                    <div id="mid_flex_div"> 
                    
                        <div class="oneToOneListMid_right">
<<<<<<< HEAD
                        	<c:if test="${ loginUser.us_id == 'admin' }">
                            	<input type="button" class="nBtn" id="oneToOne_goDetail" onClick="noticeWrite();" value="작성하기"/>
                           	 	<input type="button" class="nBtn" onClick="noticebIdDelete();" value="삭제하기"/>
                            </c:if>
=======
                            <button id="oneToOne_goDetail">작성하기</button>
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
                        </div>
                    </div>
                </div>
            </div>
            <!-- body-->
            <div id="oneToOneView_body">
                <div class="oneToOneView_body_table">
                    <table>
                        <thead>
                            <tr>
                            	<c:if test="${ loginUser.us_id == 'admin' }">
                                <th style="border-left:none; width:50px;">
                                    <div class="oneToOneView_column">
<<<<<<< HEAD
                                        <span><input type="checkbox" /></span>
                                    </div>
                                </th>
                                </c:if>
                                <th style="border-left:none;" class="fst">
                                    <div class="oneToOneView_column">
=======
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
                                        <span>번호</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span>제목</span>
                                    </div>
                                </th>
                                <th class="td_date">
                                    <div class="oneToOneView_column">
                                        <span>등록일</span>
                                    </div>
                                </th>
<<<<<<< HEAD
                                <th style="border-right:none; width:60px;" >
                                    <div class="oneToOneView_column">
                                        <span>조회수</span>
                                    </div>	
                                </th>
                                
=======
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
<<<<<<< HEAD
                            	<c:if test="${ loginUser.us_id == 'admin' }">
                                <td id="ck_box" style="border-left:none;">
                                    <div class="oneToOneView_column">
                                        <span><input type="checkbox" name="deleteNoticebId" value="${ notice.bId }"/></span>
                                    </div>
                                </td>
                                </c:if>
                                <td id="fst" style="border-left:none;">
                                    <div class="oneToOneView_column">
                                        <span>${ notice.bId }</span>
                                    </div>
                                </td>
=======
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
                                <td>
                                    <div class="oneToOneView_column">
                                        <span>번호</span>
                                    </div>
                                </td>
                                <td class="td_date">
                                    <div class="oneToOneView_column">
                                        <span>제목</span>
                                    </div>
                                </td>
<<<<<<< HEAD
                                <td id="noticeCountDiv" style="border-right:none;">
=======
                                <td>
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
                                    <div class="oneToOneView_column">
                                        <span>등록일</span>
                                    </div>
                                </td>
                            </tr>
<<<<<<< HEAD
                        </c:forEach>
                        	<tr>
								<td id="centerAlign" colspan="5" style="border-right:none; border-left:none;">
									<c:if test="${ pi.currentPage <= 1 }">
										< &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="boardNoticeList.board">
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }">[이전]</a> &nbsp;
									</c:if>
									
										<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="blue" size="4"><b>${ p }</b></font>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="boardNoticeList.board">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach>
								
									<!-- [다음] -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										 &nbsp; > 
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="boardNoticeList.board">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
										<a href="${ after }"> > </a>
									</c:if>
								</td>
							</tr>
=======
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
<<<<<<< HEAD
		// 디테일 이동 , 조회수 
		$('.goNoticeDetail').click(function(){
			var noticeId = $(this).parent().parent().children('#fst').children().children().text();
			location.href = "noticeDetail.board?bId=" + noticeId + "&page=" + ${pi.currentPage};
		});
        
		function noticeWrite(){
			document.noticeListForm.action="boardNoticeWrite.board";
			document.noticeListForm.submit();
		}
		
		function noticebIdDelete() {
			var select = confirm("삭제하시겠습니까?");
			if(select === true){
				document.noticeListForm.action="boardNoticeDelete.board";
				document.noticeListForm.submit();
			}else{
				location.href=location.href;
			}
		}
		
		
		
=======
        $(document).ready(function(){
            $("#loaded").load("../helpdeskSidebar.html");
        });
        $(document).ready(function(){
            $("#menubar").load("../menubar.html");
        });

        // 카테고리 클릭시 이벤트 처리 

>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12


    </script>
</body>
</html>