<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>1대1문의 수정</title>
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
            margin-bottom:100px;
        }
        .oneToOneView_BodyLayout{
            border: 1px solid black;    
            padding:20px;
        }
        .oneToOneView_B_top{
            height:80px;
        }
        .oneToOneView_B_mid{
            height:80px;
        }
        .oneToOneView_B_bot{
            height:300px;
        }
    </style>
</head>
<body>
    <div id="oneToOneView_Wrapper">
        <c:import url="../../common/menubar.jsp"/>
        <c:import url="../../common/helpdeskSidebar.jsp"/>
        <form name="oneToOneUpdateComfirm" method="POST">
        
        <input type="hidden" name="page" value="${ page }">
		<input type="hidden" name="bId" value="${ oTo.bId }">
        
        
        <div id="oneToOneView_innerWrapper">
            <!-- head-->
            <div id="oneToOneView_head">
                <div class="oneToOne_top">
                    <h2 id="oneToOneView_title">1대1 문의 수정</h2>
                </div>
                <div class="oneToOne_mid">
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_right">
                            <button id="oneToOne_goDetail" onClick="oneToOneUpdate();">문의하기</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="oneToOneView_body">
            <!--      <div class="oneToOneView_BodyLayout">
                    <div class="oneToOneView_B_top">
                        <select>
                            <option value="" selected>공개 </option>
                            <option value="">비공개</option>
                        </select>
                    </div>
                </div>                                                -->
                <div class="oneToOneView_BodyLayout">
                    <div class="oneToOneView_B_mid">
                        <input type="text" placeholder="제목을 입력하세요." id="oneToOneWrite_title" name="bTitle" value="${ oTo.bTitle }">
                    </div>
                </div>
                <div class="oneToOneView_BodyLayout">
                    <div class="oneToOneView_B_bot">
                        <textarea id="oneToOneWrite_content" name="bContent" placeholder="내용을 입력하세요.">${ oTo.bContent }</textarea>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>    
    <script>
    function oneToOneUpdate(){
    	var select = confirm("수정 하시겠습니까?");
    	if(select === true){
			document.oneToOneUpdateComfirm.action='oneToOneUpdateConfirm.board';
			document.oneToOneUpdateComfirm.submit();
			alert('수정완료!');
    	} else {
    		location.href=location.href;
    	}
	}
    
    
    
    
    </script>

</body>
</html>