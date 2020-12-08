<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <div>
                        <h2>제목</h2>
                    </div>
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_left">
                            <span>아이디</span>
                            <span>날짜</span>
                        </div>
                        <div class="oneToOneListMid_right">
                            <button id="oneToOne_goDetail">수정</button>
                            <button id="oneToOne_goDetail">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="oneToOneView_body">
                <div class="oneToOneDetail_Content">

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
        </div>
    <script>
        $(document).ready(function(){
            $("#loaded").load("../helpdeskSidebar.html");
        });
         // menubar
         $(document).ready(function(){
            $("#menubar").load("../menubar.html");
        });
        


        function resize(obj) {
            obj.style.height = "1px";
            obj.style.height = (12+obj.scrollHeight)+"px";
        }
    </script>



</body>
</html>