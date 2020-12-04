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
            /* border-top:1px solid black;
            border-bottom:1px solid black; */
/*             border-bottom: 1px solid black; */
            margin-bottom:100px;
        }
        .oneToOneView_body_table{
            padding:5px;
        }
        table{
            width:100%;
            margin-top: 10px;
            border: 1px solid black; 
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
        	width:60px;
        }
		td:nth-child(4){
			width:100px;
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
        	padding: 10px;
        }
        
    </style>
</head>
<body>
    <div id="oneToOneView_Wrapper">
        <c:import url="../../common/menubar.jsp"/>
        <c:import url="../../common/helpdeskSidebar.jsp"/>
       	<form method="post"name="noticeListForm">
        <div id="oneToOneView_innerWrapper" >
            <!-- head-->
            <div id="oneToOneView_head">
                <div class="oneToOne_top">
                    <h2 id="oneToOneView_title">공지사항</h2>
                </div>
                <div class="oneToOne_mid">
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_right">
                            <input type="button" id="oneToOne_goDetail" onClick="noticeWrite();" value="작성하기"/>
                            <input type="button" onClick="noticebIdDelete();" value="삭제하기"/>
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
                                <th>
                                    <div class="oneToOneView_column">
                                        <span><input type="checkbox" /></span>
                                    </div>
                                </th>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span>번호</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span>제목</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span>등록일</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span>조회수</span>
                                    </div>	
                                </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="notice" items="${ list }">
                            <tr>
                                <td id="ck_box">
                                    <div class="oneToOneView_column">
                                        <span><input type="checkbox" name="deleteNoticebId" value="${ notice.bId }"/></span>
                                    </div>
                                </td>
                                <td id="fst">
                                    <div class="oneToOneView_column">
                                        <span>${ notice.bId }</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="oneToOneView_column goNoticeDetail">
                                        <span>${ notice.bTitle }</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="oneToOneView_column">
                                        <span>${ notice.bRegD }</span>
                                    </div>
                                </td>
                                <td id="noticeCountDiv">
                                    <div class="oneToOneView_column">
                                        <span>${ notice.bCount }</span>
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
										<c:url var="before" value="boardNoticeList.board">
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
											<c:url var="pagination" value="boardNoticeList.board">
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
										<c:url var="after" value="boardNoticeList.board">
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
		
		


    </script>
</body>
</html>