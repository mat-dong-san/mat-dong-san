<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, mat.dong.san.board.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	ArrayList list = (ArrayList)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>중고장터</title>
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
        #used_Header{
        	margin-top: 200px;
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
        	margin-left:35px;
        	margin-bottom:25px;
        }
       .used_items .used_itemList .used_item_view{
            float: left;
        }
        
        .used_items{
            overflow: hidden; 
            border-bottom:1px solid #a9a9a9;
          	border-bottom-width: thin; 
        }

        .used_itemList .used_item_view .item_title{
            overflow: hidden;
            height: 32px;
            margin-top: 13px;
            font-family: dotum;
            font-size: 12px;
            color: #333333;
            line-height: 17px;
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
        #centerAlign{
        	text-align: center;
        	padding: 50px;
        	border-bottom:none;
        }
        #currentBtn{
        	color: rgb(21, 100, 249);
       	    font-weight: bold;
     	    
        }
        .pageBtn{
        	width: 35px;
		    margin: 0 2px;
		    padding: 8px 9px;
		    border: 1px solid #c4c4c4;
		    background-color: #FAFAFA;
		    
        }
        .nBtn{
        	border:none;
        	color:white;
        	background-color:#333;
        	width:100px;
        	height:30px;
        }
    </style>
</head>
<body>
   
    <div id="used_Wrapper">
    	<c:import url="../../common/menubar.jsp"/>
<%--         <c:import url="../../common/helpdeskSidebar.jsp"/> --%>
        <form method="post" name="usedListForm">
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
                        <input type="button"  class="nBtn" id="used_goSell" value="판매하기" onClick="usedSell();">
                </div>
            </div>
            <div id="used_HeaderTwo">
                <h3 style="margin-top:10px; margin-bottom:10px; margin-left:10px;">상품</h3>
            </div>
        </header>
        <section id="used_Body">
            <div id="used_Content">
            	<% int k=0;  %>
            	<% for(int i = 0 ; i< 3; i++) {%>
                <div id="used_ContentBox">
                    <div class="used_items">
                        <ul class="used_itemList">
					<% for(int j = k; j<list.size(); j++){ %>
					<% if(j <4+k ){ %>
					<% Board b = (Board)list.get(j); %>
                            <li class="used_item_view fst">
                                <div class="item_img">
                                	<input type="hidden" name="bId" value="<%= b.getbId() %>"/>
                                    <a id="bId_p">
                                        <img src="resources/chdir/<%= b.getBaChName() %>"  width="200px" height="200px" id="getB_id">
                                    </a>
                                </div>
                                <div>
                                	<p><%= b.getbCategory() %></p>
                                </div>
                                <div class="item_title">
                                    <a href="">
                                       	 <%= b.getbTitle()%>
                                    </a>
                                </div>
   	                             <div class="item_priceBox">
                                    <div class="item_price">
                                        <span class="item_price_price">판매가</span>
                                        <span class="item_price_cost">
                                            <strong><%= b.getbPrice() %></strong> 원
                                        </span> 
                                    </div>
                                </div>
                                <div class="item_seller">
                                    <span class="home"></span>
                                    <a href=""><%= b.getUsId() %></a>
                                </div>
                            </li> 
                    <%
	                    } else {
	                    	k=j; 
	                    	break;
	                    }
                    %>        
	                <% } %>
                        </ul>
                    </div>
                </div>
	                <% } %>
	            <div style="margin:0 auto;" id="centerAlign">    
		            <c:if test="${ pi.currentPage <= 1 }">
						< &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="used.board">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }"><</a> &nbsp;
					</c:if>
					
						<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
								<input type="button" value="${ p }" id="currentBtn" class="pageBtn"/>
<%-- 							<font color="red" size="4"><b>[${ p }]</b></font> --%>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="used.board">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }"><input type="button" value="${ p }" class="pageBtn"/></a>
						</c:if>
					</c:forEach>
				
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						&nbsp;>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="used.board">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						 &nbsp;<a href="${ after }">></a>
					</c:if>
				</div>    
            </div>
        </section>
        </form>
    </div>

    <script>
		$('.item_img').click(function(){
	    	var bId = $(this).children().val();
			console.log(bId);
			location.href = "usedDetail.board?bId=" + bId + "&page=" + ${pi.currentPage};
		});
    
		function usedSell(){
			var loginUser = '${ loginUser.us_id }' ;
			console.log(loginUser);
			if(loginUser === '' || loginUser === null){
				alert('로그인시 이용 가능합니다.');
			} else {
	 			document.usedListForm.action="goUsedWrite.board";
				document.usedListForm.submit();
			}
			
		}
		
		
    </script>
</body>
</html>