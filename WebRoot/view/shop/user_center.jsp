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
				<div class="js-navmenu js-footer-auto-ele shop-nav nav-menu nav-menu-2 has-menu-5" style="background-color: #02813e;">
					<ul class="clearfix">
						<li>
							<a href="/micro/shop.jsp" style="background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/27/FgoMDhfG936BFs3_HI83rWv7YgPb.jpg); background-size: 50px 50px"></a>
						</li>
						<li>
							<a href="/micro/view/shop/user_center.jsp?busId=${param.busId}" style="background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/27/FloXBZIB_ZdrgWQ9RbL9_KII7vRp.jpg); background-size: 50px 50px"></a>
						</li>
						<li>
							<a href="/micro/view/shop/user_center.jsp?busId=${param.busId}" style="background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/29/FipGucD7DSfIDx8A-5MZhNShqCj6.jpg); background-size: 50px 50px"></a>
						</li>
						<li>
							<a href="tel://4007366517" style="background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/27/FvYYLvzwv0CJGxbWSM-jdF2NcgxB.jpg); background-size: 50px 50px"></a>
						</li>
						<li>
							<a href="http://wap.koudaitong.com/v2/feature/oma5aeh1" style="background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/28/Fmy18MTGsvgvsYbxrRvl47g6Vbzg.jpg); background-size: 50px 50px"></a>
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
		<div class="search-container hide">
			<form class="search-form" action="http://wap.koudaitong.com/v2/search" method="GET">
				<input type="search" class="search-input" placeholder="搜索本店所有商品" name="q" value="">
				<input type="hidden" name="kdt_id" value="803178">
				<a class="js-search-cancel search-cancel" href="javascript:;">取消 </a>
				<span class="search-icon"></span>
				<span class="close-icon hide"></span>
			</form>
			<div class="history-wrap center">
				<ul class="history-list"></ul>
				<a class="tag tag-clear c-gray-darker hide" href="javascript:;">清除历史搜索 </a>
			</div>
		</div>
	</body>
</html>