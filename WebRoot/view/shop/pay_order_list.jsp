<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String openId =(String) request.getAttribute("openid");
%>
<html class="no-js " lang="zh-CN">
	<head>
	    <meta charset="utf-8">
	    <meta name="keywords" content="移动电商服务平台">
	    <meta name="HandheldFriendly" content="True">
	    <meta name="MobileOptimized" content="320">
	    <meta name="format-detection" content="telephone=no">
	    <meta http-equiv="cleartype" content="on">
	    <c:choose>
	    	<c:when test="${param.orderType == 'F'}">
			    <title>所有订单</title>
	    	</c:when>
	    	<c:when test="${param.orderType == 'A'}">
			    <title>待付款</title>
	    	</c:when>
	    	<c:when test="${param.orderType == 'R'}">
	    		<title>待发货</title>
	    	</c:when>
	    	<c:when test="${param.orderType == 'H'}">
	    		<title>已发货</title>
	    	</c:when>
	    	<c:when test="${param.orderType == 'O'}">
	    		<title>已完成</title>
	    	</c:when>
	    </c:choose>
	    <script type="text/javascript" src="<%=path %>/pub/js/jquery-1.11.3.min.js">
	    <script type="text/javascript" src="<%=path %>/js/global.js"></script>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <link rel="stylesheet" href="<%=path %>/pub/css/base_2ced031129.css" />
		<link rel="stylesheet" href="<%=path %>/pub/css/order_list_50b8447040.css" />
	</head>
	<body class=" ">
		<input type="hidden" id="orderType" value="${param.orderType}" />
		<input type="hidden" id="openId" value="" />
		<div class="container ">
	        <div class="content" style="min-height: 308px;">
	        	<div id="order-list-container">
					<div class="js-list b-list">
						<li class="block block-order animated">
							<div class="header">
    							<span class="font-size-12">订单号：E20150624164843067399623</span>
    							<a class="js-cancel-order pull-right font-size-12 c-blue" href="javascript:;">取消</a>
							</div>
							<hr class="margin-0 left-10">
							<div class="block block-list block-border-top-none block-border-bottom-none">
    							<div class="block-item name-card name-card-3col clearfix">
							        <a href="http://trade.koudaitong.com/wxpay/pay?order_no=E20150624164843067399623&amp;kdt_id=803178" class="thumb">
							            <img src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FtvEyKV5PcFXijpcr29VW6n5OvIz.jpg!100x100.jpg">
							        </a>
							        <div class="detail">
							            <a href="http://trade.koudaitong.com/wxpay/pay?order_no=E20150624164843067399623&amp;kdt_id=803178"><h3>鳕鱼堡+上校鸡块（5块）+香辣鸡翅（2块）</h3></a>
							        </div>
							        <div class="right-col">
							            <div class="price">￥<span>18.00</span></div>
							            <div class="num">
							                ×<span class="num-txt">1</span>
							            </div>
							        </div>
							    </div>
							</div>
							<hr class="margin-0 left-10">
							<div class="bottom">
							    总价：<span class="c-orange">￥18.00</span>
							    <div class="opt-btn">
							        <a class="btn btn-orange btn-in-order-list" href="http://trade.koudaitong.com/wxpay/pay?order_no=E20150624164843067399623&amp;kdt_id=803178">付款</a>
							    </div>
							</div>
						</li>
					</div>
				</div>
    		</div>
            <div class="footer">
            	<div class="copyright">
                	<div class="ft-links">
                        <a href="/micro/shop.jsp" target="_blank">店铺主页</a>
                        <a href="/micro/view/shop/user_center.jsp" target="_blank">会员中心</a>
                    </div>
                    <div class="ft-copyright">
    					<a href="http://m.youzan.com" target="_blank">华莱士提供技术支持</a>
					</div>
            	</div>
        	</div>
    	</div>
    	<script language="javascript">
    		$(document).ready(function(){
			  	 var url="https://www.hbywzc.cn/micro/oauth.do?method=getCode&page=pay_order_list";
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