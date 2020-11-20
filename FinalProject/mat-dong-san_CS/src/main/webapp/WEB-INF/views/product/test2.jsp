<html>
<head>
<title> New Document </title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
    html,body {margin:0;padding:0;font-size:20px;color:#fff;text-align:center;}
</style>
<script type="text/javascript">
    (function($){
        $.aniPage=function(e){
            if(e.originalEvent.wheelDelta > 0){
                $("body, html").animate({
                    scrollTop:$(window).scrollTop()-$(window).height()
                },800,function(){
                        $.aniOk = 0;
                });
            }else{
                $("body, html").animate({
                    scrollTop:$(window).scrollTop()+$(window).height()
                },800,function(){
                        $.aniOk = 0;
                });
            }
        };
    })(jQuery);
    
    
    $(function(){
        $(".contInner").height(300);
        $.aniOk=0;
        $(window).scrollTop(0);
    });
    $(document).on("mousewheel",function(e){
        e.preventDefault();
        if($.aniOk == 0){
            $.aniPage(e);
            $.aniOk = 1;
        }
    });
</script>
</head>
<body> 
 
<div id="wrap" style="width:300px;">
    <div class="contInner" style="height:100px; background-color:#339966">1</div>
    <div class="contInner" style="height:100px; background-color:#663366">2</div>
    <div class="contInner" style="height:100px; background-color:#CC0066">3</div>
    <div class="contInner" style="height:100px; background-color:#3366FF">4</div>
</div> 
</body>
</html>