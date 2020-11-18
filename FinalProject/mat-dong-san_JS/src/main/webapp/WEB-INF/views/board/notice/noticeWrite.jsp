<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../ckeditor_4.14.1_standard//ckeditor/ckeditor.js"></script>
    <title>1대1문의 작성</title>
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
        /* .oneToOneView_B_top{
            height:80px;
        } */
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
        <div id="menubar">
        </div>
        
        <div id="loaded">
        </div>
        <div id="oneToOneView_innerWrapper">
            <!-- head-->
            <div id="oneToOneView_head">
                <div class="oneToOne_top">
                    <h2 id="oneToOneView_title">공지사항 작성</h2>
                </div>
                <div class="oneToOne_mid">
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_right">
                            <button id="oneToOne_goDetail">문의하기</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="oneToOneView_body">
                <!-- <div class="oneToOneView_BodyLayout">
                     <div class="oneToOneView_B_top">
                        <select>
                            <option value="" selected>공개 </option>
                            <option value="">비공개</option>
                        </select>
                    </div> 
                </div> -->
                <div class="oneToOneView_BodyLayout">
                    <div class="oneToOneView_B_mid">
                        <input type="text">
                    </div>
                </div>
                <div class="oneToOneView_BodyLayout">
                    <div class="oneToOneView_B_bot">
                        <textarea id="b_textA" name="FAQ_Content"></textarea>
						<script>CKEDITOR.replace('b_textA');</script>
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
    </script>

</body>
</html>