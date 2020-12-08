<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>상세보기</title>
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
            border: 1px solid black;
            height: 500px;
            margin-bottom:10px;
            padding: 20px;
        }
        .oneToOneDetail_Content{
            border: 1px solid black; 
            height:100%;   

        }
        #oneToOneView_tail{
            border: 1px solid black; 
            margin-top: 10px;
            padding:10px;
        }
        .reply_area{
            border:1px solid black;

        }
        .reply_write_content{
            height:100%;
        }
        .reply_write_btn{
            display: flex;
            padding:10px 10px 10px;   
        }
        .reply_write_btn_box{
            margin-left: auto;

        }
        #reply_write_content_writeArea{
            width:99%;
            height:70px;
            min-height: 50px;
            overflow-x: scroll; 
            overflow-y: scroll; 
            display: block;
            width: 100%;
            min-height: 17px;
            padding:10px;
            border: 0;
            font-size: 17px;
            box-sizing: border-box;
            background: transparent;
            outline: 0;
            overflow: hidden;
            overflow-wrap: break-word;
            height: 17px;
        }


    </style>
</head>
<body>
    <div id="oneToOneView_Wrapper">
        
        <c:import url="../../common/menubar.jsp"/>
        <c:import url="../../common/helpdeskSidebar.jsp"/>
<!--         <form name="goDetailForm" method="POST"> -->
        
       	<!-- 업데이트 폼으로 -->
       	<c:url var="noticeUpdate" value="goNoticeUpdate.board">
			<c:param name="bId" value="${ notice.bId }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		<!-- 삭제하기 폼으로 -->
		<c:url var="bdelete" value="boardNoticeDelete.board">
			<c:param name="deleteNoticebId" value="${ notice.bId }"/>
		</c:url>
		<!-- 목록으로 -->
		<c:url var="blist" value="boardNoticeList.board">
			<c:param name="page" value="${ page }"/>
		</c:url>
			
        <div id="oneToOneView_innerWrapper">
            <!-- head-->
            <div id="oneToOneView_head">
                <div class="oneToOne_top">
                    <h2 id="oneToOneView_title">공지사항</h2>
                </div>
                <div class="oneToOne_mid">
                    <div>
                        <h2>${ notice.bTitle }</h2>
                    </div>
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_left">
                            <span>관리자</span>
                            <span>${ notice.bRegD }</span>
                        </div>
                        <div class="oneToOneListMid_right">
                            <input type="button" id="oneToOne_goDetail" value="수정" onClick="noticeUpdate();" />
<%--                            	<button id="oneToOne_goDetail" onClick="location.href='${noticeUpdate}'">수정하기</button> --%>
                            <input id="oneToOne_goDelete" value="삭제" />
                        </div>
                    </div>
                </div>
            </div>
            <div id="oneToOneView_body">
                <div class="oneToOneDetail_Content">
               	 	<% pageContext.setAttribute("newLineChar", "\r\n"); %>
               	 	${ fn:replace(notice.bContent, newLineChar, "<br>") }
                </div>
            </div>
        </div>
<!--         </form> -->
   </div>    
    <script>
    function noticeUpdate(){
    	var select = confirm('수정하시겠습니까?');
    	if(select === true){
    		
    		location.href = '${ noticeUpdate }';
    		submit();
    	}else {
    		location.href=location.href;
    	}
    }
    
    
    
    </script>
</body>
</html>