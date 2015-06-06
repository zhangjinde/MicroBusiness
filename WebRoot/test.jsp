<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="/pub/css/magnific-popup.css" >
		<script src="/pub/js/zepto.min.js" type="text/javascript"></script>
		<script src="/pub/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
		<style type="text/css">
			body,h6,h5,h4,h3,h2,h1
			{
			  margin: 0;padding: 0;
			  font-family: "Arial, Helvetica, sans-serif";line-height: 23px;font-size: 13px;
			}
			#con{
			  border: 1px solid #009933;margin: 0px;width: 180px;height: 200px;position: absolute;left: 30px;top:40px;
			}
			#title,#main{
			  margin: 10px;text-align: center;
			}
			#title{
			  background:#009933;height: 30px;line-height: 30px;font-size: 16px;color: #fff;
			}
			#main{
			  height: 140px;font-size: 14px;line-height: 20px;color:#0058d2;
			}
		</style>
	</head>
	<body>
		<div id="con">
		  <div id="title">title</div>
		  <div id="main">点击title,移动整个框</div> 
		</div>
		<script type="text/javascript">
			(function($){
			  /*touchstart the title and drag the con moving*/
			  var moveX,moveY,startX,startY;
			  $(document).on("touchstart","#title",function(event){
			    if($(event.target).attr('id') == 'title'){
			      var touchPros = event.touches[0];
			      startX = touchPros.pageX - event.target.parentNode.offsetLeft;
			      startY = touchPros.pageY - event.target.parentNode.offsetTop;
			    }
			    return false;
			  }).on("touchmove","#title",function(event){
			    if($(event.target).attr('id') == 'title'){
			      var touchPros = event.touches[0];
			      moveX = touchPros.pageX - startX;
			      moveY = touchPros.pageY - startY;
			      $('#con').css('left',moveX).css('top',moveY);
			      }
			  });
			})(Zepto); 
		</script>
	</body>
</html>