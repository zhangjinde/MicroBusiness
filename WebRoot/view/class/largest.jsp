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
		<script language="javascript">
			function recover()
			{
				window.close();
			}
		</script>
	</head>
	<body style="margin-left:0px;margin-top:0px;padding:0 0;">
		<c:set var="strLen" value="${fn:length(param.player)}" />
		<c:choose>
			<c:when test="${fn:substring(param.player,strLen-3,strLen) == 'swf'}">
				<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" WIDTH="${param.scrWidth}" HEIGHT="${param.scrHeight}" id="myMovieName"> 
					<PARAM NAME=movie VALUE="/movie/${param.player}"> 
					<PARAM NAME=quality VALUE=high> 
					<PARAM NAME=bgcolor VALUE=#FFFFFF> 
					<EMBED src="/movie/${param.player}" quality=high bgcolor=#FFFFFF WIDTH="${param.scrWidth}" HEIGHT="${param.scrHeight}" NAME="myMovieName" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED> 
				</OBJECT>
				<div style="margin:0 auto;text-align:center;margin-top:5px"><a href="javascript:void(0)" title="还原" onclick="recover()"><img src="/pub/img/smallest.jpg" width="25" height="25" style="border:none" /></a></div>
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
				<iframe id="showPdf" src='' style="width:${param.scrWidth};height:${param.scrHeight};margin-left:0px;padding:0 0;display:none" frameborder="0"></iframe>
				<div style="margin:0 auto;text-align:center;margin-top:5px"><a href="javascript:void(0)" title="还原" onclick="recover()"><img src="/pub/img/smallest.jpg" width="25" height="25" style="border:none" /></a></div>
				<div id="pdfTips" style="font-family:'微软雅黑';margin-top:2px;margin-left:5px;font-size:14px;display:none">温馨提示：请确保您的电脑已安装pdf查看软件</div>
			</c:when>
		</c:choose>
	</body>
</html>