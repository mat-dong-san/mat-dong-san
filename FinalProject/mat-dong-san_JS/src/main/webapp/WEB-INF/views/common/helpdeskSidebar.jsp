<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        html, body{
            margin:0;
            padding:0;
        }
        #helpdesk_wrapper{
            /* border: 1px solid black; */
            width:1100px;
            margin:0 auto;

        }
        .helpdesk_title{
            text-align:center;
            font-size: 33px;
            margin: 70px auto 45px ;
        }
        .helpdesk_body{
            display:grid;
            grid-template-columns:1fr 1fr 1fr ;
            text-align: center;

        }
        .helpdesk_sideBar{
            padding:20px;
        }
        #noticeClixk,#oneToOneClixk,#FAQClixk{
            border-bottom: 1px solid rgb(235, 235, 235);
        }
        
        a {
        	text-decoration: none;
        }
    </style>
       

</head>
<body>
    <div id="helpdesk_wrapper">
        <div class="helpdesk_head">
            <h2 class="helpdesk_title">고객센터</h2>
        </div>
        <div class="helpdesk_body">
            <div class="helpdesk_sideBar" id="noticeClixk"><a href="boardNoticeList.board">공지사항</a></div>
        
            <div class="helpdesk_sideBar" id="oneToOneClixk"><a href="boardOneToOne.board">1:1문의</a></div>
        
            <div class="helpdesk_sideBar" id="FAQClixk"><a href="boardFAQ.board">자주 묻는 질문</a></div>
        </div>
    </div>
</body>
<script>
	
	

</script>



</html>