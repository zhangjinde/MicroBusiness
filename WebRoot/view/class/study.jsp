<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>title</title>
		<%@ include file="/common/head.jsp" %>
	</head>
	<body style="margin-left:0px;margin-top:0px;padding:0 0;">
		<c:set var="strLen" value="${fn:length(param.player)}" />
		<c:choose>
			<c:when test="${fn:substring(param.player,strLen-3,strLen) == 'swf'}">
				<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" WIDTH="1000" HEIGHT="500" id="myMovieName"> 
					<PARAM NAME=movie VALUE="/movie/${param.player}"> 
					<PARAM NAME=quality VALUE=high> 
					<PARAM NAME=bgcolor VALUE=#FFFFFF> 
					<EMBED src="/movie/${param.player}" quality=high bgcolor=#FFFFFF WIDTH="1000" HEIGHT="500" NAME="myMovieName" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED> 
				</OBJECT>
				<div style="margin:0 auto;text-align:center;margin-top:5px"><a href="javascript:void(0)" title="全屏" onclick="largestFunc()"><img src="/pub/img/largest.jpg" width="25" height="25" style="border:none" /></a></div>
			</c:when>
			<c:when test="${fn:substring(param.player,strLen-3,strLen) == 'pdf'}">
				<script type="text/javascript" src="/pub/js/pdfobject.js"></script>
				<script type="text/javascript">
					window.onload = function (){
						var success = new PDFObject({url:"/movie/${param.player}"}).embed();
						if(!success)
						{
							var showPdf = document.getElementById("showPdf");
							var pdfTips = document.getElementById("pdfTips");
							showPdf.src = "/movie/${param.player}";
							showPdf.style.display = "block";
							pdfTips.style.display = "block";
						}
					};
				</script>
				<iframe id="showPdf" src='' style="width:1000px;height:540px;margin-left:0px;padding:0 0;display:none" frameborder="0"></iframe>
				<div style="margin:0 auto;text-align:center;margin-top:5px"><a href="javascript:void(0)" title="全屏" onclick="largestFunc()"><img src="/pub/img/largest.jpg" width="25" height="25" style="border:none" /></a></div>
				<div id="pdfTips" style="font-family:'微软雅黑';margin-top:2px;margin-left:5px;font-size:14px;display:none">温馨提示：请确保您的电脑已安装pdf查看软件</div>
			</c:when>
			<c:when test="${fn:substring(param.player,strLen-3,strLen) == 'tml'}">
				<iframe src="http://www.xxsyd.com/ebooks/treasures/${param.player}" width="850" height="638" style="margin-top:-44px" scrolling="no" frameborder="0"></iframe>
			</c:when>
			<c:otherwise>
				<script type="text/javascript" src="/pub/js/CuPlayer/swfobject.js"></script>
				<div class="video" id="CuPlayer"><strong>提示：您的Flash Player版本过低，请升级您的Flash插件</a>！</strong></div>
				<script type="text/javascript">
					var so = new SWFObject("/pub/js/CuPlayer/CuPlayerMiniV4.swf","CuPlayerV4","1000","500","9","#000000");
					so.addParam("allowfullscreen","true");
					so.addParam("allowscriptaccess","always");
					so.addParam("wmode","opaque");
					so.addParam("quality","high");
					so.addParam("salign","lt");
					so.addVariable("CuPlayerSetFile","/pub/js/CuPlayer/CuPlayerSetFile.jsp?pageUrl=/movie/${param.player}");
					so.addVariable("CuPlayerFile","/movie/${param.player}"); //视频文件地址
					so.addVariable("CuPlayerImage","/pub/js/CuPlayer/images/start.jpg");//视频略缩图,本图片文件必须正确
					so.addVariable("CuPlayerWidth","1000"); //视频宽度
					so.addVariable("CuPlayerHeight","500"); //视频高度
					so.addVariable("CuPlayerAutoPlay","yes"); //是否自动播放
					so.write("CuPlayer");
				</script>
			</c:otherwise>
		</c:choose>
		<script language="javascript">
			function largestFunc()
			{
				var scrHeight = window.screen.height-200;
				var scrWidth = window.screen.width-30;
				window.open("largest.jsp?player=${param.player}&scrHeight="+scrHeight+"px&scrWidth="+scrWidth+"px","","menubar=no,toolbar=no,location=no,status=no,fullscreen=yes") 
			}
		</script>
	</body>
</html>