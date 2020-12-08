<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../ckeditor_4.14.1_standard//ckeditor/ckeditor.js"></script>
    <style>
        html, body {
            margin:0;
            padding:0;
        }
        
        #used_Wrapper{
            
            margin-top:70px;
            width:100%;
            height:100%;
            /* margin: 100px; */
            
        }
        #used_subWrapper{
            border: 1px solid black;
            width:1040px;
            margin:0 auto;

        }
        #used_Header, #used_Body , #used_tail{
            width:980px;
            margin:0 auto;
            /* border: 1px solid black; */
            /* background-color: pink; */

        }
        #used_HeaderOne{
            display:flex;
            
        }
        .used_selectItem{
            position: relative;
            border-bottom:4px solid black; 
            margin-bottom :10px;
            height: 65%;
            width: 260px;

        }
        #used_HeaderTwo{
            /* border:1px solid black; */
            border-bottom:1px solid #a9a9a9;
            margin-top: 20px;
        }
        .used_itemSelect , .used_SellDiv{
            width:228px;
            font-size: 14px;
            line-height: 1.2em;
            font-weight: bold;
            border: 0 none;
            margin-top:27px;
        }

        .used_itemSubmit{
            position: absolute;
            width:21px;
            height:27px;
            right: 0;
            top: 0;
            background: url(//pics.auction.co.kr/listing/used/2014/btn_srch_2015.gif) 0 0 no-repeat;
            border: none;
            cursor: pointer;
            margin-top:20px;
            text-indent: -10000em;
        }
        h3 {
            margin:0;
        }
        #used_HeaderTwo {
            display: flex;
            padding-bottom : 10px;
        }
        .used_DetailBtn{
            margin-left: auto;
        }
        #usedDetail_HeaderTh{
            margin-top:25px;
            display:grid;
            grid-template-columns: 1fr 2fr;
            padding-bottom : 20px;
            border-bottom: 1px solid #a9a9a9;
        }
        .usedDetail_infoBox{
            margin-left:20px;
        }
        /* .usedDetail_imgMain{
            border-right: 1px solid #a9a9a9;
        } */
        .usedDetail_infoconfirm{
            margin-top: 10px;
            margin-bottom:10px;
        }

        .usedDetail_ContentWrapper{
            border-bottom: 1px solid black;
            margin-bottom: 20px;
            min-height: 400px;
            
        }
        .usedDetail_RealContent{
            margin:20px;
            border: 1px solid black;
            min-height: 400px;
            overflow: auto;

        }
        .usedDetail_RealReply{
            margin:20px;
            border: 1px solid black;
            min-height: 130px;
            padding:15px
        }
        #replyArea{
            min-height: 50px;
            overflow-x: scroll; 
            overflow-y: scroll; 
            display: block;
            width: 100%;
            min-height: 17px;
            padding-right: 1px;
            border: 0;
            font-size: 17px;
            box-sizing: border-box;
            background: transparent;
            outline: 0;
            overflow: hidden;
            overflow-wrap: break-word;
            height: 17px;
        }
        .reply_FreeArea{
            margin-top:70px;
            display: flex;
        }
        .reply_FreeArea div{
            margin-left: auto;
        }

    </style>
</head>

<body>
    <div id="menubar"></div>
    <div id="used_Wrapper">
        <div id="used_subWrapper">
            <header id="used_Header"> 
                <div id="used_HeaderOne" >
                    <div>
                        <h2 style="margin-top:25px; margin-bottom:25px;">중고장터</h2>
                    </div>
                    <div>
                        <div id="used_selectUsed" class="used_selectItem">
                            <input type="text" id="used_selectName" class="used_itemSelect">
                            <input type="submit" id="used_selectSubmit" class="used_itemSubmit">
                        </div>
                    </div>
                    <div class="used_SellDiv" style="margin-left:4px;">
                        <form action="" method="">
                            <input type="submit" id="used_goSell" value="판매하기">
                        </form>
                    </div>
                </div>
                <div id="used_HeaderTwo">
                    <div>
                        <h3>상세정보</h3>
                    </div>
                    <div class="used_DetailBtn">
                        <span>
                            <input type="button" value="목록으로">
                        </span>
                        <span>
                            <input type="button" value="삭제하기">
                        </span>
                        <span>
                            <input type="button" value="수정하기">
                        </span>
                    </div>
                </div>
                <div id="usedDetail_HeaderTh">
                    <div class="usedDetail_imgMain">
                        <a href="">
                            <img href="" width="300px" height="250px">
                        </a>
                    </div>
                    <div class="usedDetail_infoBox">
                        <div class="usedDetail_infoconfirm">
                            <h2>Title Area</h2>
                        </div>
                        <div class="usedDetail_infoconfirm">
                            <div>00,000 원</div>
                        </div>
                        <div class="usedDetail_infoconfirm">
                            <span>날짜 : 2020-11-12</span>
                        </div>
                        <div class="usedDetail_infoconfirm">
                            <span>판매자명 : 김말숙</span>
                        </div>
                        <div>
                            <img src="" width="100%" height="85px;" >광고자리
                        </div>
                    </div>
                </div>
            </header>
            <section id="used_Body">
                <article class="usedDetail_ContentWrapper">
                    <div class="usedDetail_RealContent">
                    </div>
                </article>
            </section>
            <section id="used_tail">
                <article class="used_replyWrapper">
                    <div class="usedDetail_RealReply">
                        <div class="reply_userName">
                            유저이름;
                        </div>
                        <textarea name="" id="replyArea" rows="1" onkeyup="resize(this)"></textarea>
                        <div class="reply_FreeArea">
                            <div>
                                <span>
                                    <input type="button" value="등록하기" class="reply_FreeAreaBtn">
                                </span>
                            </div>
                        </div>
                    </div>
                </article>
            </section>
        </div>
    </div>




    <script>
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