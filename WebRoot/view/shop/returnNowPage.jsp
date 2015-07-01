<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<html class="no-js " lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta name="keywords" content="移动电商服务平台">
		<meta name="HandheldFriendly" content="True">
		<meta name="MobileOptimized" content="320">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="cleartype" content="on">
		<title>返现记录</title>
		<script type="text/javascript" src="<%=path %>/pub/js/jquery-1.11.3.min.js">
	   	<script type="text/javascript" src="<%=path %>/js/global.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="<%=path %>/pub/css/base_2ced031129.css" />
		<link rel="stylesheet" href="<%=path %>/pub/css/tuan_4b504bcff2.css" />
	</head>
	<body class=" ">
		<div class="container ">
			<div class="content" style="min-height: 581px;">
				<div class="tabber  tabber-n3 tabber-double-11 clearfix">
					<a class="" href="<%=path %>/view/shop/shopCart.jsp?openid=${param.openid}&busId=100">购物车</a>
				    <a class="" href="<%=path %>/view/shop/pay_history.jsp?orderType=F&busId=100">购物记录</a>
				    <a class="active" href="<%=path %>/view/shop/returnNowPage.jsp">我的返现</a>
				</div>
				<div id="backs-list-container" class="block" style="margin-top: 20px;">
					<div class="empty-list" style="margin-top: 30px;">
						<div>
							<h4>
								哎呀，还没返现？
							</h4>
							<p class="font-size-12">
								不落单一起团
							</p>
						</div>
						<div>
							<a href="/micro/shop.jsp" class="tag tag-big tag-orange" style="padding: 8px 30px;">找返现</a>
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
				<div class="footer">
					<div class="copyright">
						<div class="ft-copyright">
							<a href="#" target="_blank">华莱士提供技术支持</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>