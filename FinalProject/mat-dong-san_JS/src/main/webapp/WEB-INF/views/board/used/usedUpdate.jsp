<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>개인 판매글 수정</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../ckeditor_4.14.1_standard//ckeditor/ckeditor.js"></script>
    <style>

        html, body {
            margin : 0;
            padding : 0;
            font-size:10px;
        }
        body{
            padding : 40px;
        }
        #usedSell_Wrapper{
            margin: 0 auto;
            /* border: 1px solid black; */
            margin-top:70px;
            width:100%;
            width: 980px;
            font-size:2.0rem;
            
        }
        .usedSell_header{
            border: 1px solid black;
        }
        .usedSell_header_tail{
            margin-left:20px;
            margin-bottom:50px;
        }
        .usedSell_body_area1{
            border:1px solid black;
            padding: 50px;
        }
        .usedSell_title{
            font-size: 2.0rem;
        }
        .usedSell_tail{
            margin-bottom: 100px;;
        }
        .utitle{
            margin-bottom: 10px;;
        }
    </style>
</head>
<body>
    <div id="menubar"></div>
    <div id="usedSell_Wrapper">
        <header class="usedSell_header">
            <article class="usedSell_header_head">
                <h2>중고장터</h2>
            </article>
            <article class="usedSell_header_tail">
                <h3>물품 정보 수정</h3>
            </article>
        </header>
        <section class="usedSell_body">
            <article class="usedSell_body_area1">
                    <div class="usedSell_cate utitle">
                        <label for="" class="usedSell_title">카테고리</label>
                    </div>
                    <div clss="usedSell_cate">
                        <form action="">
                            <select name="" id="">
                                <option value="1">가전제품</option>
                                <option value="2">의류</option>
                                <option value="3">화장품</option>
                                <option value="4">악세서리</option>
                                <option value="5">주방용품</option>
                                <option value="6">생활용품</option>
                            </select>
                        </form>
                    </div>
            </article>
            <article class="usedSell_body_area1">
                <div class="usedSell_cate utitle">
                    <label for="" class="usedSell_title">상품명</label>
                </div>
                <div clss="usedSell_cate">
                    <form action="">
                        <span><input type="text" name="" /></span>
                        <span><label>0/50byte</label></span>
                    </form>
                </div>
            </article>
            <article class="usedSell_body_area1">
                <div class="usedSell_cate utitle">
                    <label for="" class="usedSell_title">사진</label>
                </div>
                <div clss="usedSell_cate">
                    <form action="">
                        <span><input type="file" /></span>
                        <span><input type="file" /></span>
                        <span><input type="file" /></span>
                    </form>
                </div>
            </article>
            <article class="usedSell_body_area1">
                <div class="usedSell_cate utitle">
                    <label for="" class="usedSell_title">내용</label>
                </div>
                <div clss="usedSell_cate">
                    <form action="">
                        <div>
                            <textarea id="b_textA" name=""></textarea>
                            <script>CKEDITOR.replace('b_textA');</script>
                        </div>
                    </form>
                </div>
            </article>
            <article class="usedSell_tail">
                <div>
                    <input type="button" value="판매하기">
                    <input type="button" value="목록으로">
                </div>

            </article>
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