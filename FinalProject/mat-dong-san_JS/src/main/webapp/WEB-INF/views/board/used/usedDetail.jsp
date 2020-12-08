<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, mat.dong.san.board.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
            margin-bottom:70px;
            width:100%;
            height:100%;
            /* margin: 100px; */
            
        }
        #used_subWrapper{
/*             border: 1px solid black; */
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
            min-height: 400px;
            overflow: auto;
            padding:10px;

        }
        .usedDetail_RealReply{
            border: 1px solid;
            border-color: #E5E5E5;
            min-height: 110px;
            padding:15px;
        }
        #replyArea{
            min-height: 50px;
            overflow-x: scroll; 
            overflow-y: scroll; 
            display: block;
            width: 100%;
            min-height: 20px;
            padding-right: 1px;
            border: 0;
            font-size: 17px;
            box-sizing: border-box;
            background: transparent;
            outline: 0;
            overflow: hidden;
            overflow-wrap: break-word;
            height: 20px;
        	resize:none;
        }
        .reply_FreeArea{
            margin-top:60px;
            display: flex;
        }
        .reply_FreeArea div{
            margin-left: auto;
        }

		#used_tail{
			margin-bottom:20px;
			border-bottom:1px solid black;
		}
		
		.used_replyWrapper{
			margin-bottom : 20px;
		}
		#CommentBox{
			border-bottom : 1px solid black;
		}
		#commentList_Area{
			width:980px;
			margin: 0 auto;
		}
		#CommentBox{
			padding : 10px;	
		}
		#divDelBtn{
			display: flex;
		}
		#delbtn{
			background-color: white;
	 		outline:none;
	 		border:0;
	 		cursor:pointer;
		}
		
    </style>
</head>

<body>
	<c:import url="../../common/menubar.jsp"/>

	<c:url var="usedUpdate" value="goUsedUpdate.board">
		<c:param name="bId" value="${ used.bId }"/>
		<c:param name="page" value="${ page }"/>
		<c:param name="bCategory" value="${ used.bCategory }"/>
	</c:url>
	<c:url var="usedDelete" value="usedDelete.board">
			<c:param name="usedbId" value="${ used.bId }"/>
	</c:url>
	
	
	
    <div id="menubar"></div>
    <div id="used_Wrapper">
        <div id="used_subWrapper">
            <header id="used_Header"> 
                <div id="used_HeaderOne" >
                    <div>
                        <h2 style="margin-top:25px; margin-bottom:25px;">중고장터</h2>
                    </div>
                </div>
                <div id="used_HeaderTwo">
                    <div>
                        <h3>상세정보</h3>
                    </div>
                    <div class="used_DetailBtn">
                        <span>
                            <input type="button" value="목록으로" onClick="usedList();">
                        </span>
                        <span>
                            <input type="button" value="삭제하기" onClick="usedDelete();">
                        </span>
                        <span>
                            <input type="button" value="수정하기" onClick="usedUpdate();">
                        </span>
                    </div>
                </div>
                <div id="usedDetail_HeaderTh">
                    <div class="usedDetail_imgMain">
                         <c:forEach var="ba" items="${ ba }" begin="0" end="0">
                            <img src="resources/chdir/${ ba.baChName }" width="300px" height="250px">
                         </c:forEach>
                    </div>
                    <div class="usedDetail_infoBox">
                        <div class="usedDetail_infoconfirm">
                            <h2>${ used.bTitle }</h2>
                        </div>
                        <div class="usedDetail_infoconfirm">
                            <div>${ used.bPrice } 원</div>
                        </div>
                        <div class="usedDetail_infoconfirm">
                            <span>날짜 : ${ used.bRegD }</span>
                        </div>
                        <div class="usedDetail_infoconfirm">
                            <span>판매자명 : ${ used.usId }</span>
                        </div>
                        <div>
                            <img src="" width="100%" height="85px;" >
                        </div>
                    </div>
                </div>
            </header>
            <section id="used_Body">
                <article class="usedDetail_ContentWrapper">
                    <div class="usedDetail_RealContent">
                    	<c:forEach var="ba" items="${ ba }" begin="0" end="3">
                            <img src="resources/chdir/${ ba.baChName }" width="900" >
                         </c:forEach>
                    	<% pageContext.setAttribute("newLineChar", "\r\n"); %>
               	 		${ fn:replace(used.bContent, newLineChar, "<br>") }
                    </div>
                </article>
            </section>
            
            <!-- 댓글 입력 -->
            <section id="used_tail">
                <article class="used_replyWrapper">
                    <div class="usedDetail_RealReply">
                        <div class="reply_userName">
							${ loginUser.us_id }
                        </div>
                        <c:if test="${ loginUser.us_id != null }">
                        <textarea name="bcContent" id="replyArea" rows="1"
                         				onkeyup="resize(this)" placeholder="댓글을 입력해주세요."></textarea>
                        </c:if>
                        <c:if test="${ loginUser.us_id == null }">
                        <textarea name="bcContent" id="replyArea" rows="1"
                         				onkeyup="resize(this)" placeholder="로그인시 이용가능합니다." readOnly></textarea>
                        </c:if>
                        <div class="reply_FreeArea">
                            <div>
                                <span>
                                <c:if test="${ loginUser.us_id != null }">
                                    <input type="button" value="등록하기"
                                     			class="reply_FreeAreaBtn" id="bCommentSubmit">
                                </c:if>
                                </span>
                            </div>
                        </div>
                    </div>
                </article>
            </section>
            
            <section id="commentList_Area">
            	<article id="comment" >
            		<div class="CommentArea">
            		
            		</div>
            	</article>
            </section>
            
        </div>
    </div>




    <script>
		//댓글 크기 조절
        function resize(obj) {
            obj.style.height = "1px";
            obj.style.height = (12+obj.scrollHeight)+"px";
        }
        
		function usedList(){
			location.href='used.board';
			submit();
		}
		
        // 수정
        function usedUpdate(){
        	var select = confirm("수정하시겠습니까?");
        	if(select === true){
        		location.href='${ usedUpdate }';
        		submit();
        	}else {
        		location.href=location.href;
        	}
        	
        }
        
        function usedDelete(){
        	var select = confirm("삭제하시겠습니까?");
        	if(select === true) {
        		location.href='${ usedDelete }';
        	} else {
        		location.href=location.href;
        	}
        }
        
        
        $(function(){
        	commentListPrint();
			setInterval(function(){
				commentListPrint();
			}, 1000);
				
		});
        
        
        $('#bCommentSubmit').on('click', function(){
			var bcContent = $('#replyArea').val();
			console.log(bcContent);
			var bId = ${ used.bId };
			console.log(bId);
			
			$.ajax({
				url : 'usedinsertComment.board',
				data : {bcContent:bcContent, bId:bId},
				cache : false,
				type:'post',
				success: function(data){
					console.log(data);
					if(data == "success"){
						$('#replyArea').val("");
					}
					
				}
				
			});
			
		});
        
        function commentListPrint(){
			var bId = ${ used.bId };
			console.log(bId);
			$.ajax({
				url:"commentListPrint.board",
				data: {bId: bId},
				success:function(data){
					console.log(data);
					
					$replyArea = $('#comment .CommentArea');
					$replyArea.html('');
					
					var $loginId = '${ loginUser.us_id }';
					var $div;
					var $usId;
					var $divDelBtn;
					var $divFlex;
					var $delBtn;
					var $bcommentId;
					
					var $bcContent;
					var $bcRegD;
					
					if(data.length > 0){
						for(var i in data){
							$bcommentId =$('<input type="hidden" id="bcId"name="bcId">').val(data[i].bcId);
							
							
							$div = $('<div id="CommentBox">');
							$divDelBtn = $('<div id="divDelBtn">');
							$divFlex = $('<div class="delFlex" >').text(data[i].usId);
							$divFlex2 = $('<div class="delFlex" id="parent">');
							$delBtn = $('<input type="button" id="delbtn" name="DelbId" value="&middot; 삭제">');
							
	
							$bcContent = $('<div id="C_Content">').text(data[i].bcContent);
							$bcRegD = $('<div>').text(data[i].bcRegD);
							
							
							
							if(data[i].usId == $loginId){
								$divFlex2.append($delBtn);
							}
							$divFlex2.append($bcommentId);
							$divDelBtn.append($divFlex);
							$divDelBtn.append($divFlex2);
							$div.append($divDelBtn);
							$div.append($bcContent);
							$div.append($bcRegD);
							$replyArea.append($div);
							
							
						}
					} else {
						$replyArea = $('#comment .CommentArea');
						$replyArea.html('');
						
						
						var $div = $('<div >').text("등록된 댓글이 없습니다.");
						
						$replyArea.append($div);
					}
					
				}
			});
		}
//         $(document).on('click','#delbtn',function(){
// 			        var bcommentId = $(this).parent().parent().parent().parent().children().children().children('#parent').children('#bcId').val();
// 		        	console.log(bcommentId);
//         	});
        $(document).on('click', '#parent' , function(){
        	var bcommentId=$(this).children('#bcId').val();
        	console.log(bcommentId);
        	var why = confirm("삭제하시겠습니까?");
        	if(why === true){
		       	$.ajax({
		   			url: 'usedCommentDelete.board',
		   			data : {bcId:bcommentId,},
		   			type:'post',
		   			cache : false,
		   			success: function(data){
		   				
		   				if(data == "success"){
		   					alert("삭제 완료하였습니다.");
		   				} else {
		   					alert('삭제 실패하였습니다.');
		   				}
		   				
		   			}
		   		});
        	}
        	
        	
     	});
        
        
        
        
        

    </script>
</body>
</html>