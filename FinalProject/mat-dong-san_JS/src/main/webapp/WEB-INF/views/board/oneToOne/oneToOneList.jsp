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
        .oneToOneListMid_right{
            margin-left: auto;
            margin-right: 50px;
            margin-bottom:20px;
        }

        #oneToOneView_body{
            margin-top: 10px;
<<<<<<< HEAD
=======
            /* border-top:1px solid black;
            border-bottom:1px solid black; */
            border: 1px solid black;
            height: 500px;
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
            margin-bottom:100px;
        }
        .oneToOneView_body_table{
            padding:5px;
        }
        table{
            width:100%;
            margin-top: 10px;
<<<<<<< HEAD
            border-collapse: collapse;
=======
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
        }
        td { 
            border-bottom: 1px solid black; 
        }
        tbody>tr>td:nth-child(2){
            width:1fr;
        }
<<<<<<< HEAD
        
        #ck_box{
        	width:50px;
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
		
		 .nBtn{
        	border:none;
        	color:white;
        	background-color:#333;
        }
		td,th { 
        	
            border: 1px solid RGB(221, 212, 221);
            padding: 10px 10px 10px 10px;
        }
        #centerAlign{
        	text-align: center;
        	padding: 10px;
        	border:none;
        }
        .fstLast{
        	width: 70px;
        	border-left:none;
        }
        .sec{
        	width: 70px;
        	border-left:none;
        }
        
        
        
        
        
=======

        table>tbody>tr>td:not(:nth-child(2)){
            width:150px;
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
                    <h2 id="oneToOneView_title">1대1 문의</h2>
                </div>
                <div class="oneToOne_mid">
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_right">
<<<<<<< HEAD
                            <input type="button" class="nBtn"id="oneToOne_goDetail" onClick="oneToOneWrite();" value="작성하기"/>
                            <c:if test="${ loginUser.us_id == 'admin' }">
                            <input type="button" class="nBtn" onClick="oneToOnebIdDelete();" value="삭제하기"/>
                        	</c:if>
=======
                            <button id="oneToOne_goDetail">문의하기</button>
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
<<<<<<< HEAD
                            <tr >
                            	<c:if test="${ loginUser.us_id == 'admin' }">
	                                <th class="fstLast">
	                                    <div class="oneToOneView_column" >
	                                        <span><input type="checkbox" /></span>
	                                    </div>
	                                </th>
                                </c:if>
                                <th class="sec">
=======
                            <tr>
                                <th>
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
                                    <div class="oneToOneView_column">
                                        <span>번호</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="oneToOneView_column">
                                        <span>제목</span>
                                    </div>
                                </th>
                                <th  style="width:100px;">
                                    <div class="oneToOneView_column">
                                        <span>등록일</span>
                                    </div>
                                </th>
                                <th class="fstLast"style="border-right:none;">
                                    <div class="oneToOneView_column">
                                        <span>접수&처리</span>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
<<<<<<< HEAD
                            	<c:if test="${ loginUser.us_id == 'admin' }">
	                                <td id="ck_box" class="fstLast">
	                                    <div class="oneToOneView_column">
	                                        <input type="checkbox" name="deleteOneToOneId" value="${ oneToOne.bId }"/>
	                                    </div>
	                                </td>
                                </c:if>
                                
                                <td id="fst" class="sec">
=======
                                <td>
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
                                    <div class="oneToOneView_column">
                                        <span>번호</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="oneToOneView_column">
                                        <span>제목</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="oneToOneView_column">
                                        <span>등록일</span>
                                    </div>
                                </td>
<<<<<<< HEAD
                                <td id="noticeCountDiv" style="border-right:none;">
=======
                                <td>
>>>>>>> a28773123360dc8c0cde778322fc49e37931bb12
                                    <div class="oneToOneView_column">
                                        <span>접수&처리</span>
                                    </div>
                                </td>
                            </tr>
<<<<<<< HEAD
                        </c:forEach>
                        	<tr>
								<td id="centerAlign" colspan="5">
									<c:if test="${ pi.currentPage <= 1 }">
										< &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="boardOneToOne.board">
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }"> < </a> &nbsp;
									</c:if>
									
<!-- 										페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="blue" size="4"><b>${ p }</b></font>
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
									&nbsp;	>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="boardOneToOne.board">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
										<a href="${ after }">></a>
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
		$('.goOneToOneDetail').click(function(){
			var oneToOneId = $(this).parent().parent().children('#fst').children().children().text();
			location.href = "oneToOneDetail.board?bId=" + oneToOneId + "&page=" + ${pi.currentPage};
		});
        
		
		
		
		
		function oneToOneWrite(){
			var loginUser = '${ loginUser.us_id }' ;
			console.log(loginUser);
			if(loginUser === '' || loginUser === null){
				alert('로그인시 이용 가능합니다.');
			} else {
	 			document.oneToOneListForm.action="goOneToOneWrite.board";
				document.oneToOneListForm.submit();
			}
			
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