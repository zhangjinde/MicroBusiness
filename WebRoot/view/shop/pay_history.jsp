<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String openId =(String) request.getParameter("openId");
%>
<html class="no-js " lang="zh-CN">
	<head>
	    <meta charset="utf-8">
	    <meta name="keywords" content="移动电商服务平台">
	    <meta name="HandheldFriendly" content="True">
	    <meta name="MobileOptimized" content="320">
	    <meta name="format-detection" content="telephone=no">
	    <meta http-equiv="cleartype" content="on">
	    <title>购物记录</title>
	    <script type="text/javascript" src="<%=path %>/pub/js/jquery-1.11.3.min.js"></script>
	    <script type="text/javascript" src="<%=path %>/js/global.js"></script>
	    <script type="text/javascript" src="<%=path %>/pub/js/iscroll-probe.js"></script>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <link rel="stylesheet" href="<%=path %>/pub/css/base_2ced031129.css" />
		<link rel="stylesheet" href="<%=path %>/pub/css/order_list_50b8447040.css" />
		<style type="text/css">
			#wrapper {
				position: absolute;
				z-index: 1;
				top: 40px;
				bottom: 0px;
				left:9999px;
				width: 100%;
				overflow: hidden;
			}
			#scroller {
				position: absolute;
				z-index: 1;
				-webkit-tap-highlight-color: rgba(0,0,0,0);
				width: 100%;
				-webkit-transform: translateZ(0);
				-moz-transform: translateZ(0);
				-ms-transform: translateZ(0);
				-o-transform: translateZ(0);
				transform: translateZ(0);
				-webkit-touch-callout: none;
				-webkit-user-select: none;
				-moz-user-select: none;
				-ms-user-select: none;
				user-select: none;
				-webkit-text-size-adjust: none;
				-moz-text-size-adjust: none;
				-ms-text-size-adjust: none;
				-o-text-size-adjust: none;
				text-size-adjust: none;
			}
			#scroller ul {
				list-style: none;
				padding: 0;
				margin: 0;
				width: 100%;
				text-align: left;
			}
			#scroller li {
				padding: 0 10px;
				border-bottom: 1px solid #ccc;
				border-top: 1px solid #fff;
				background-color: #fafafa;
				font-size: 14px;
			}
			.pullUpLabel {color:#999}
			.pullUp {background:#fff;height:40px;line-height:40px;font-weight:bold;font-size:0.8em;color:#888}
			.pullUp .pullUpIcon {display:block;float:left;opacity:0.4;width:40px;height:40px;background:url(<%=path %>/pub/img/pull_to_refresh.png) 0 0 no-repeat;-webkit-background-size:40px 80px;-ms-background-size:40px 80px; background-size:40px 80px;-webkit-transition-property:-webkit-transform;-ms-transition-property:-webkit-transform;-webkit-transition-duration:250ms;-ms-transition-duration:250ms}
			.pullUp .pullUpIcon  {-webkit-transform:rotate(-180deg) translateZ(0);-ms-transform:rotate(-180deg) translateZ(0)}
			.pullUp.flip .pullUpIcon {-webkit-transform:rotate(0deg) translateZ(0);-ms-transform:rotate(0deg) translateZ(0)}
			.pullUp.loading .pullUpIcon {background-position:0 100%;-webkit-transform:rotate(0deg) translateZ(0);-ms-transform:rotate(0deg) translateZ(0);-webkit-transition-duration:0ms;-ms-transition-duration:0ms;-webkit-animation-name:loading;-ms-animation-name:loading;-webkit-animation-duration:1s;-ms-animation-duration:1s;-webkit-animation-iteration-count:infinite;-ms-animation-iteration-count:infinite;-webkit-animation-timing-function:linear;-ms-animation-timing-function:linear}
			@-webkit-keyframes loading {
				from {-webkit-transform:rotate(0deg) translateZ(0)}
				to {-webkit-transform:rotate(360deg) translateZ(0)}
			}
			@-ms-keyframes loading {
				from {-ms-transform:rotate(0deg) translateZ(0)}
				to {-ms-transform:rotate(360deg) translateZ(0)}
			}
		</style>
	</head>
	<body class=" " onload="loaded()">
		<input type="hidden" id="orderType" value="${param.orderType}" />
		<input type="hidden" id="openId" value="${param.openId}" />
		<input type="hidden" id="busId" value="${param.busId}" />
    	<div class="container" style="height:100%;width:100%">
	        <div class="content">
	        	<div class="tabber  tabber-n3 tabber-double-11 clearfix">
					<a class="" href="<%=path %>/view/shop/shopCart.jsp?openid=${param.openid}busId=100">购物车</a>
				    <a class="active" href="<%=path %>/view/shop/pay_history.jsp?orderType=F&busId=100">购物记录</a>
				    <a class="" href="<%=path %>/view/shop/returnNowPage.jsp">我的返现</a>
				</div>
	        	<div id="order-list-container">
	        		<div id="wrapper" style="min-height:308px;">
						<div id="scroller">
							<ul></ul>
							<div class="pullUp" style="text-align:center;position:relative;"></div>
							<div class="js-footer" style="padding:0 0;margin:0 auto;height:80px">
								<div class="footer">
									<div class="copyright">
										<div class="ft-copyright">
											华莱士提供技术支持
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    <div class="container ">
     <script language="javascript">
    		$(document).ready(function(){
			  	 var url="http://www.hbcnhls.com/micro/oauth.do?method=getCode&page=pay_order_list";
			  	 var openid=getCookie("openid");
			  	 var id='<%=openId%>';
			  	 if(openid=='' || openid==null)
			  	 {
			  		  encodeURL(url); 
			  	 }
			  	 else if(id!='' && id!=null && id!='null')
			  	 {
			  		 setCookie("openid",'<%=openId%>');
			  		 openid=getCookie("openid");
			  	 }
				 $("#openId").val(openid);
			});
    	</script>
		<script type="text/javascript" src="<%=path %>/js/pay_order_list.js"></script>
	</body>
</html>