<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js " lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="keywords" content="有赞,移动电商服务平台">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="cleartype" content="on">
    <link rel="dns-prefetch" href="http://tj.koudaitong.com/">
    <link rel="dns-prefetch" href="http://imgqn.koudaitong.com/">
    <link rel="dns-prefetch" href="http://kdt-static.qiniudn.com/">
    <link rel="shortcut icon" href="http://kdt-static.qiniucdn.com/v2/image/yz_fc.ico">
    <title>购物记录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/base_2ced031129.css" onerror="_cdnFallback(this)">    <link rel="stylesheet" href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/projects/uc/order_list_50b8447040.css" onerror="_cdnFallback(this)">        </head>

<body class=" ">

    
    <div class="container ">
                <div class="content" style="min-height: 667px;">
                    
<div class="tabber  tabber-n3 tabber-double-11 clearfix">
	<a class="" href="/view/shop/gwc.html">购物车</a>
    <a class="active" href="/micro/cart.do?method=getOrder&phone=18907181259">购物记录</a>
    <a class="" href="">我的返现</a>
</div>
                        <p style="height:10px;">&nbsp;</p>
                <div id="order-list-container">

        <div class="js-list b-list">
        <c:forEach items="${list }" var="order">
					
		
        <li class="block block-order animated"><div class="header">
    <span class="font-size-12">订单号：${order.orderId}</span>
    
</div>
<hr class="margin-0 left-10">
<div class="block block-list block-border-top-none block-border-bottom-none">
    <div class="block-item name-card name-card-3col clearfix">
        <a href="http://trade.koudaitong.com/wxpay/pay?order_no=E20150605162006026143904&showwxpaytitle=1&kdt_id=803178" class="thumb">
            <img src="${order.imgUrl}">
        </a>
        <div class="detail">
            <a href="http://trade.koudaitong.com/wxpay/pay?order_no=E20150605162006026143904&showwxpaytitle=1&kdt_id=803178"><h3>${order.productName}</h3></a>
            
        </div>
        <div class="right-col">
            <div class="price">￥<span>${order.productPrice}</span></div>
            <div class="num">
                ×<span class="num-txt">1</span>
            </div>
        </div>
    </div>
    
</div>
<hr class="margin-0 left-10">
<div class="bottom">
    总价：<span class="c-orange">￥${order.orderPrice}</span>
    <div class="opt-btn">
        <a class="btn btn-in-order-list" href="http://trade.koudaitong.com/wxpay/pay?order_no=E20150605162006026143904&showwxpaytitle=1&kdt_id=803178">详情</a>
    </div>
</div>
</li>
</c:forEach>
</div></div>
    </div>        <div class="footer">
          	<div class="footer">
	    <div class="copyright">
	    <div class="ft-copyright">
    <a href="http://youzan.com/" target="_blank">有赞微商城提供技术支持</a>
</div>
	    </div>
	</div>
</div>    </div>
</body></html>