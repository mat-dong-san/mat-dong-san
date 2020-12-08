<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.ArrayList, mat.dong.san.board.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	ArrayList<BoardType> usedType = (ArrayList<BoardType>)request.getAttribute("usedType");
%>
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
        
        
        
         
        <form name="usedUpdate" method="post" enctype="Multipart/form-data">
        <section class="usedSell_body">
            <article class="usedSell_body_area1">
                    <div class="usedSell_cate utitle">
                        <label for="" class="usedSell_title">카테고리</label>
                    </div>
                    <div class="usedSell_cate">
                         <select name="bCategory" id="bCategory">
                            <c:forEach var="bcId" items="${ usedType }">
								<option value="${ bcId.bcId }" <c:if test="${ bcId.bcId eq used.bCategory }">selected</c:if> >${ bcId.bCategory }</option>
                            </c:forEach>
                        </select>
                    </div>
            </article>
            <article class="usedSell_body_area1">
                <div class="usedSell_cate utitle">
                    <label for="" class="usedSell_title">상품명</label>
                </div>
                <div class="usedSell_cate">
                    <span><input type="text" name="bTitle" value="${ used.bTitle }"/></span>
                </div>
            </article>
            <article class="usedSell_body_area1">
                <div class="usedSell_cate utitle">
                    <label for="" class="usedSell_title">가격</label>
                </div>
                <div class="usedSell_cate">
                   <span><input type="text" name="bPrice" value="${ used.bPrice }"/></span>
                   <span><label>0/50byte</label></span>
                </div>
            </article>
            <article class="usedSell_body_area1">
                <div class="usedSell_cate utitle">
                    <label for="" class="usedSell_title">사진</label>
                </div>
                <div class="usedSell_cate">
                	<div id="usedSell_cate_area1">
	                    <img id="usedSell_cate_Img1" width="120" height="100">
                	</div>
                	
                	<div id="usedSell_cate_area2">
	                    <img id="usedSell_cate_Img2" width="120" height="100">
                	</div>
                	
                	<div id="usedSell_cate_area3">
	                    <img id="usedSell_cate_Img3" width="120" height="100">
                	</div>
                	
                	<div id="usedSell_cate_area4">
	                    <img id="usedSell_cate_Img4" width="120" height="100">
                	</div>
                </div>
            </article>
            <article class="usedSell_body_area1">
                <div class="usedSell_cate utitle">
                    <label for="" class="usedSell_title">내용</label>
                </div>
                <div class="usedSell_cate">
                     <div>
                         <textarea id="b_textA" name="">${ used.bContent }</textarea>
                         <script>CKEDITOR.replace('b_textA');</script>
                     </div>
                </div>
            </article>
            <article class="usedSell_tail">
                <div>
                    <input type="button" value="수정하기" onClick="usedUpdate();">>
                    <input type="button" value="목록으로" onClick="history.go(-1);">
                </div>

            </article>
        </section>
        <div id="usedPictureArea">
			<input type="file" id="usedImg1" multiple="multiple" name="uploadFile" onchange="LoadImg(this,1)">
			<input type="file" id="usedImg2" multiple="multiple" name="uploadFile" onchange="LoadImg(this,2)">
			<input type="file" id="usedImg3" multiple="multiple" name="uploadFile" onchange="LoadImg(this,3)">
			<input type="file" id="usedImg4" multiple="multiple" name="uploadFile" onchange="LoadImg(this,4)">
		</div>
        </form>
        
        
        
    </div>
    
    <script>

    </script>
</body>
</html>