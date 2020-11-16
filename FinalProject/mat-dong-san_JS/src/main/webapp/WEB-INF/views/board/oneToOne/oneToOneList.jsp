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
        }
        td { 
            border-bottom: 1px solid black; 
        }
        tbody>tr>td:nth-child(2){
            width:1fr;
        }

        table>tbody>tr>td:not(:nth-child(2)){
            width:150px;
        }
        .oneToOneView_column{
               text-align: left;
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
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_right">
                            <button id="oneToOne_goDetail">문의하기</button>
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
                                        <span>접수&처리</span>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
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
                                <td>
                                    <div class="oneToOneView_column">
                                        <span>접수&처리</span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $("#loaded").load("../helpdeskSidebar.html");
        });
        $(document).ready(function(){
            $("#menubar").load("../menubar.html");
        });

        // 카테고리 클릭시 이벤트 처리 



    </script>



</body>
</html>