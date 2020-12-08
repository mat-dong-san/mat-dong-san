<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>상세보기</title>
    <style>
        html, body, p{
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
            width:980px;
            margin:100px auto;
        }
        #oneToOneView_head{
/*             border:1px solid black; */

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
            border-bottom: 1px solid RGB(221, 212, 221);
            height: 500px;
            margin-bottom:20px;
            padding: 20px;
        }
        .oneToOneDetail_Content{
/*             border: 1px solid black;  */
            height:100%;   

        }
        #oneToOneView_tail{
            margin-top: 10px;
/*             padding:10px; */
			padding-bottom : 20px;
			margin-bottom : 20px;
			border-bottom: 1px solid black;
        }
        .reply_area{
			min-height:110px;
			padding: 15px;
        }
        .reply_write_content{
            height:100%;
        }
        .reply_write_btn{
        	margin-top:60px;
            display: flex;
        }
        .reply_write_btn_box{
            margin-left: auto;

        }
        #replyContent_writeArea{
            min-height: 50px;
            overflow-x: scroll; 
            overflow-y: scroll; 
            display: block;
            width: 100%;
            min-height: 20px;
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
        
       
		#CommentBox{
			border-bottom : 1px solid black;
		}
		#oneToOneCommentList_Wrapper{
			width:980px;
			margin: 0 auto;
		}
        .reply_area{
        	border: 1px solid;
    		border-color: #E5E5E5;
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
	
		 .oneToOne_mid{
        	border:1px solid RGB(221, 212, 221);
            background: #f6f6f6;
        }
        .nBtn{
        	border:none;
        	color:white;
        	background-color:#333;
        }
	
	
	
    </style>
</head>
<body>
    <div id="oneToOneView_Wrapper">
        <c:import url="../../common/menubar.jsp"/>
        <c:import url="../../common/helpdeskSidebar.jsp"/>
        
        <!-- 업데이트 폼으로 -->
        	<c:url var="oToUpdate" value="goOneToOneUpdate.board">
				<c:param name="oTobId" value="${ oto.bId }"/>
				<c:param name="page" value="${ page }"/>
			</c:url>
			<!-- 삭제하기 폼으로 -->
			<c:url var="oTodelete" value="oneToOneDetailDelete.board">
				<c:param name="bId" value="${ oto.bId }"/>
				<c:param name="page" value="${ page }"/>
			</c:url>
			<!-- 목록으로 -->
			<c:url var="blist" value="boardOneToOne.board">
				<c:param name="page" value="${ page }"/>
			</c:url>
        
        
        
        
        <div id="oneToOneView_innerWrapper">
            <!-- head-->
            <div id="oneToOneView_head">
                <div class="oneToOne_top">
                    <h2 id="oneToOneView_title">1대1 문의</h2>
                </div>
                <div class="oneToOne_mid">
                    <div>
                        <h2>${oto.bTitle}</h2>
                    </div>
                    <div id="mid_flex_div"> 
                        <div class="oneToOneListMid_left">
                            &nbsp;&nbsp;&nbsp;<span><img src="resources/images/boardIcon/bnickname.png">${oto.usId}</span>
                            &nbsp;&nbsp;|&nbsp; <span><img src="resources/images/boardIcon/bdate.png">${oto.bRegD}</span>
                        </div>
                        <div class="oneToOneListMid_right">
                            <button id="oneToOne_goDetail" onClick="oneToOneUpdate();">수정</button>
                            <button id="oneToOne_goDetail" onClick="oneToOneDelete();">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="oneToOneView_body">
                <div class="oneToOneDetail_Content">
                		<% pageContext.setAttribute("newLineChar", "\r\n"); %>
               	 		${ fn:replace(oto.bContent, newLineChar, "<br>") }
                </div>
            </div>
            <div id="oneToOneView_tail">
                <div class="reply_area">
                    <div class="reply_write">
                        <div class="reply_write_id">
                            <p><img src="resources/images/boardIcon/bnickname.png">${ loginUser.us_id }</p>
                        </div>
                        <div class="reply_write_content">
                            <textarea id="replyContent_writeArea"  onkeyup="resize(this)" placeholder="댓글을 입력해주세요."></textarea>
                        </div>
                        <div class="reply_write_btn">
                            <div class="reply_write_btn_box"> 
                                <input type="button" value="등록하기"
                                     			class="reply_FreeAreaBtn" id="oneToOneCommentSubmit">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="oneToOneCommentList_Wrapper">
            	<article id="oneToOneComment" >
            		<div class="oneToOneCommentArea">
            		
            		</div>
            	</article>
            </div>
            
            
            
            <!-- reply tail -->
        </div>
    </div>
    <script>
    
    function oneToOneDelete(){
    	var select = confirm('삭제하시겠습니까?');
    	if(select === true){
    		location.href = '${ oTodelete }';
    		submit();
    	}else {
    		location.href=location.href;
    	}
    }
    
    function oneToOneUpdate(){
    	var select = confirm('수정하시겠습니까?');
    	if(select === true){
    		
    		location.href = '${ oToUpdate }';
    		submit();
    	}else {
    		location.href=location.href;
    	}
    }

        function resize(obj) {
            obj.style.height = "1px";
            obj.style.height = (12+obj.scrollHeight)+"px";
        }
        
        $(function(){
        	commentListPrint();
			setInterval(function(){
				commentListPrint();
			}, 1000);
				
		});
        $('#oneToOneCommentSubmit').on('click', function(){
			var bcContent = $('#replyContent_writeArea').val();
			console.log(bcContent);
			var bId = ${ oto.bId };
			console.log(bId);
			
			$.ajax({
				url : 'oneToOneInsertComment.board',
				data : {bcContent:bcContent, bId:bId},
				cache : false,
				type:'post',
				success: function(data){
					console.log(data);
					if(data == "success"){
						$('#replyContent_writeArea').val("");
					}
					
				}
				
			});
			
		});
        
        function commentListPrint(){
        	var bId = ${oto.bId};
        	console.log(`이거:` + bId);
        	$.ajax({
        		url : "oneToOneCommentList.board",
        		data : {bId : bId},
        		success:function(data){
        			console.log(data);
        			
        			$replyArea = $('#oneToOneComment .oneToOneCommentArea');
        			$replyArea.html('');
        			
        			var $loginId = '${ loginUser.us_id }';
        			
        			var $div;
					var $usId;
					var $divDelBtn;
					var $divFlex;
					var $delBtn;
					var $bcommentId;
        			
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
						$replyArea = $('#oneToOneComment .oneToOneCommentArea');
						$replyArea.html('');
						
						
						var $div = $('<div >').text("등록된 댓글이 없습니다.");
						
						$replyArea.append($div);
					}
        			
        			
        		}
        	});
        }
        
        $(document).on('click', '#parent' , function(){
        	var bcommentId=$(this).children('#bcId').val();
        	console.log(bcommentId);
        	var why = confirm("삭제하시겠습니까?");
        	if(why === true){
		       	$.ajax({
		   			url: 'oneToOneCommentDelete.board',
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