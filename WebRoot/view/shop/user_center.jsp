<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html class="no-js admin" lang="zh-CN">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta name="HandheldFriendly" content="True">
		<meta name="MobileOptimized" content="320">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="cleartype" content="on">
		<title>订单中心</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="/micro/pub/css/base.css">
		<link rel="stylesheet" href="/micro/pub/css/showcase.css">
		<script type="text/javascript" src="/micro/pub/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/micro/js/global.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".js-lazy").css("width",$(".admin").width());
			});
		</script>
	</head>
	<body class=" " style="padding-bottom: 50px;">
		<div class="container">
			<div class="content " style="min-height: 530px;">
				<div class="content-body">
					<div class="custom-level">
						<img class="custom-level-img js-lazy" src="<%=path %>/pub/img/user_bk.jpg" style="display: block;">
					</div>
					<div class="order-related">
						<div class="block block-list list-vertical">
							<a class="block-item link clearfix icon-order" href="<%=path %>/view/shop/pay_order_list.jsp?orderType=F&busId=${param.busId}" target="_blank"><p class="title-info c-black font-size-14">全部订单</p></a>
						</div>
						<div class="block block-list list-vertical">
							<a class="block-item link clearfix icon-gift" href="<%=path %>/view/shop/pay_order_list.jsp?orderType=A&busId=${param.busId}" target="_blank"><p class="title-info c-black font-size-14">待付款</p></a>
							<a class="block-item link clearfix icon-coupon"	href="<%=path %>/view/shop/pay_order_list.jsp?orderType=R&busId=${param.busId}" target="_blank"><p class="title-info c-black font-size-14">待发货</p></a>
							<a class="block-item link clearfix icon-promocode" href="<%=path %>/view/shop/pay_order_list.jsp?orderType=H&busId=${param.busId}" target="_blank"><p class="title-info c-black font-size-14">已发货</p></a>
							<a class="block-item link clearfix icon-present" href="<%=path %>/view/shop/pay_order_list.jsp?orderType=O&busId=${param.busId}" target="_blank"><p class="title-info c-black font-size-14">已完成</p></a>
						</div>
					</div>
				</div>
				<div class="js-navmenu js-footer-auto-ele shop-nav nav-menu nav-menu-2 has-menu-3" style="background-color: #02813e;">
					<ul class="clearfix">
						<li>
							<a href="/micro/shop.jsp" style="background-image: url(/micro/pub/img/pic/homeIndex.jpg); background-size: 50px 50px"></a>
						</li>
						<li>
							<a href="/micro/view/shop/user_center.jsp?busId=${param.busId}" style="background-image: url(/micro/pub/img/pic/userIndex.jpg); background-size: 50px 50px"></a>
						</li>
						<li>
							<a href="javascript:gotoShopCart()" onclick="gotoShopCart()" style="background-image: url(/micro/pub/img/pic/qryOrder.jpg); background-size: 50px 50px"></a>
						</li>
					</ul>
				</div>
			</div>
			<div class="js-footer" style="min-height: 1px;">
				<div class="footer">
					<div class="copyright">
						<div class="ft-copyright">
							华莱士提供技术支持
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		   function gotoShopCart()
		   {
		   		var url="/micro/cart.do?method=gotoShopCart&busId=100";
				var openid=getCookie("openid");
				if(openid=='' || openid==null)
				{
				  	encodeURL(url); 
				}
				else
				{
				 	window.location.href = url+"&openid="+openid;
				}
		   }
		</script>
	</body>
</html>