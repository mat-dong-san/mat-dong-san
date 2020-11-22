<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Document</title>
    <style>
        html, body {
            margin:0;
            padding:0;
        }
        
        #used_Wrapper{
            margin-top:70px;
            width:100%;
            height:100%;
            /* border: 1px solid black; */
        }
        #used_Header, #used_Body{
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
            border-bottom:1px solid black;
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

        ul, ol, li, dl, dt, dd {
            list-style: none;
        }
        body, h1, h2, h3, h4, h5, h6, p, blockquote, ul, ol, dl, dd, figure, form, fieldset, pre {
            padding: 0;
            margin: 0;
        }
        a {
            color: #333333;
            text-decoration: none;
        }

        #used_ContentBox{
            width: 944px;
            padding: 32px 16px 0 20px;
        }
        .used_itemList .used_item_view.fst{
            margin-left: 0 !important;
        }
       .used_items .used_itemList .used_item_view{
            float: left;
            width: 200px;
            padding: 0 0 13px 0;
            margin-left: 47px;
        }
        .used_items{
            overflow: hidden; 
            border-bottom:1px solid #a9a9a9;
            /* border-bottom-width: thin; */
        }

        .used_itemList .used_item_view .item_title{
            overflow: hidden;
            height: 32px;
            margin-top: 13px;
            font-family: dotum;
            font-size: 12px;
            color: #333333;
            line-height: 17px;
            /* border:1px solid black; */
        }
        .used_itemList .used_item_view .item_priceBox .item_price .item_price_price{
            font-family: dotum;
            font-size: 11px;    
            color: #a9a9a9; 
        }
        .used_itemList .used_item_view .item_priceBox .item_price .item_price_cost{
            font-family: dotum;
            font-size: 12px;
            color: #000000;

        }
        .item_priceBox{
            height:45px;
            margin:7px 0 6px;
        }
        .used_itemList .used_item_view .item_seller .home{
            display: inline-block;
            width: 13px;
            height: 11px;
            margin: -2px 4px 0 0;
            background: url(//pics.auction.co.kr/renewal/icon/ico_sprite_20141113.png) -220px -24px no-repeat;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div id="menubar"></div>
    <div id="used_Wrapper">
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
                <h3 style="margin-top:10px; margin-bottom:10px; margin-left:10px;">상품</h3>
            </div>
        </header>
        <section id="used_Body">
            <div id="used_Content">
                <div id="used_ContentBox">
                    <div class="used_items">
                        <ul class="used_itemList">
                            <li class="used_item_view fst">
                                <div class="item_img">
                                    <a href="">
                                        <img src="" width="200px" height="200px">
                                    </a>
                                </div>
                                <div class="item_title">
                                    <a href="">
                                        제목
                                    </a>
                                </div>
                                <div class="item_priceBox">
                                    <div class="item_price">
                                        <span class="item_price_price">판매가</span>
                                        <span class="item_price_cost">
                                            <strong>가격</strong>원
                                        </span>
                                    </div>
                                </div>
                                <div class="item_seller">
                                    <span class="home"></span>
                                    <a href="">판매자명</a>
                                </div>
                            </li>  
                            <li class="used_item_view">
                                <div class="item_img">
                                    <a href="">
                                        <img href="" width="200px" height="200px">
                                    </a>
                                </div>
                                <div class="item_title">
                                    <a href="">
                                        제목
                                    </a>
                                </div>
                                <div class="item_priceBox">
                                    <div class="item_price">
                                        <span class="item_price_price">판매가</span>
                                        <span class="item_price_cost">
                                            <strong>가격</strong>원
                                        </span>
                                    </div>
                                </div>
                                <div class="item_seller">
                                    <span class="home"></span>
                                    <a href="">판매자명</a>
                                </div>
                                </li>  
                            <li class="used_item_view">
                                <div class="item_img">
                                    <a href="">
                                        <img href="" width="200px" height="200px">
                                    </a>
                                </div>
                                <div class="item_title">
                                    <a href="">
                                        제목
                                    </a>
                                </div>
                                <div class="item_priceBox">
                                    <div class="item_price">
                                        <span class="item_price_price">판매가</span>
                                        <span class="item_price_cost">
                                            <strong>가격</strong>원
                                        </span>
                                    </div>
                                </div>
                                <div class="item_seller">
                                    <span class="home"></span>
                                    <a href="">판매자명</a>
                                </div>
                            </li>  
                            <li class="used_item_view">
                                <div class="item_img">
                                    <a href="">
                                        <img href="" width="200px" height="200px">
                                    </a>
                                </div>
                                <div class="item_title">
                                    <a href="">
                                        제목
                                    </a>
                                </div>
                                <div class="item_priceBox">
                                    <div class="item_price">
                                        <span class="item_price_price">판매가</span>
                                        <span class="item_price_cost">
                                            <strong>가격</strong>원
                                        </span>
                                    </div>
                                </div>
                                <div class="item_seller">
                                    <span class="home"></span>
                                    <a href="">판매자명</a>
                                </div>
                            </li>  
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </div>
    






    <script>
         // menubar
         $(document).ready(function(){
            $("#menubar").load("../menubar.html");
        });

    </script>
</body>
</html>