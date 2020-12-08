<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
        <!-- 업데이트 폼으로 -->
        	<c:url var="oToUpdate" value="goOneToOneUpdate.board">
				<c:param name="oTobId" value="${ oto.bId }"/>
				<c:param name="page" value="${ page }"/>
			</c:url>
			<!-- 삭제하기 폼으로 -->
			<c:url var="bdelete" value="boardOneToOneDelete.board">
				<c:param name="deleteNoticebId" value="${ oto.bId }"/>
			</c:url>
			<!-- 목록으로 -->
			<c:url var="blist" value="boardOneToOne.board">
				<c:param name="page" value="${ page }"/>
			</c:url>
        
        
        
        
        <div id="oneToOneView_innerWrapper">
            <!-- head-->
            <div id="oneToOneView_head">
                <div class="oneToOne_top">
                    <h2 id="oneToOneView_title">1대1 문의</h2>
                </div>
                <div class="oneToOne_mid">
                    <div>
                        <h2>${oto.bTitle}</h2>
                    </div>
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_left">
                            <span>${oto.usId}</span>
                            <span>${oto.bRegD}</span>
                        </div>
                        <div class="oneToOneListMid_right">
                            <button id="oneToOne_goDetail" onClick="oneToOneUpdate();">수정</button>
                            <button id="oneToOne_goDetail" >삭제</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="oneToOneView_body">
                <div class="oneToOneDetail_Content">
					${ oto.bContent }
                </div>
            </div>
            <div id="oneToOneView_tail">
                <div class="reply_area">
                    <div class="reply_write">
                        <div class="reply_write_id">
                            <p>아이디</p>
                        </div>
                        <div class="reply_write_content">
                            <textarea id="reply_write_content_writeArea" onkeyup="resize(this)"></textarea>
                        </div>
                        <div class="reply_write_btn">
                            <div class="reply_write_btn_box"> 
                                <button>버튼</button>
                            </div>
                        </div>
                    </div>
                    <div class="reply_list">

                    </div>
                </div>
            </div>
            
            <!-- reply head -->
            
            
            
            <!-- reply tail -->
        </div>
    </div>
    <script>
    function oneToOneUpdate(){
    	var select = confirm('수정하시겠습니까?');
    	if(select === true){
    		
    		location.href = '${ oToUpdate }';
    		submit();
    	}else {
    		location.href=location.href;
    	}
    }

        function resize(obj) {
            obj.style.height = "1px";
            obj.style.height = (12+obj.scrollHeight)+"px";
        }
    </script>



</body>
</html>