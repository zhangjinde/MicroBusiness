<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String openId =(String) request.getAttribute("openid");
	if("".equals(openId) || openId==null)
	{
		openId = request.getParameter("openid");
	}
%>
<!DOCTYPE html>
<html class="no-js " lang="zh-CN">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <meta charset="utf-8">
	    <meta name="keywords" content="移动电商服务平台">
	    <meta name="HandheldFriendly" content="True">
	    <meta name="MobileOptimized" content="320">
	    <meta name="format-detection" content="telephone=no">
	    <meta http-equiv="cleartype" content="on">
	    <script type="text/javascript" src="<%=path %>/pub/js/jquery-1.11.3.min.js">
	    <title>购物车</title>
	   	<script type="text/javascript" src="<%=path %>/js/global.js"></script>
	   	<script src="<%=path %>/js/location.js" type="text/javascript"></script>
		<link rel="stylesheet" href="<%=path %>/pub/css/magnific-popup.css" />
		<script src="<%=path %>/pub/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
	  	<link rel="stylesheet" href="<%=path %>/pub/css/base_2ced031129.css" />
	    <link rel="stylesheet" href="<%=path %>/pub/css/order_list_50b8447040.css" />
	    <link rel="stylesheet" href="<%=path %>/pub/css/trade_626cf27050.css" />
	    <link rel="stylesheet" href="<%=path %>/pub/css/cart_579e7a1291.css" />
	</head>
	<body class=" body-fixed-bottom">
	    <div class="container ">
	    	<div class="content clearfix">
				<div class="tabber  tabber-n3 tabber-double-11 clearfix">
					<a class="active" href="/micro/view/shop/shopCart.jsp?openid=${param.openid}">购物车</a>
				    <a class="" onclick="toOrderPage()" href="javascript:;">购物记录</a>
				    <a class="" href="http://wap.koudaitong.com/v2/trade/record/backs?source=weixin11&amp;kdt_id=803178">我的返现</a>
				</div>
				<div id="cart-container" class="block block-order">
					<div class="header js-list-header">
						<span>店铺：华莱士炸鸡汉堡</span>
						<a id='edit' onclick="edit()" href="javascript:;" class="j-edit-list pull-right c-blue font-size-12 edit-list">编辑</a>
					</div>
					<ul class="list block block-list block-list-cart block-border-none">
					 <div id="template" />
					</ul>
					<div class="js-bottom-opts bottom-fix" style="padding:0;z-index:1">
						<div class="bottom-cart clear-fix">
							<div class="select-all checked"><span onclick="selectAll()" id="allselect" class="check"></span>全选</div>
							<div class="total-price">合计：<span id="totalPrice" class="js-total-price">0</span>元</div>
							<button id='pay' href="#receiveAddrForm" class="js-go-pay btn btn-orange-dark font-size-14">结算</button>
							<button id='deleteProd' onclick="deleteProd() " href="javascript:;" class="j-delete-goods btn font-size-14 btn-red hide" disabled="true">删除</button>
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
		        <textarea id="footer-delay" style="display:none;">	&lt;div class="footer"&gt;
					    &lt;div class="copyright"&gt;
					    &lt;div class="ft-copyright"&gt;
				    &lt;a href="http://m.youzan.com" target="_blank"&gt;华莱士提供技术支持&lt;/a&gt;
				&lt;/div&gt;
					    &lt;/div&gt;
					&lt;/div&gt;
				</textarea>    	
				<div class="footer">
				    <div class="copyright">
					    <div class="ft-copyright">
						    <a href="http://m.youzan.com/" target="_blank">华莱士提供技术支持</a>
						</div>
				    </div>
				</div>
			</div>
			<form id="receiveAddrForm" class="mfp-hide white-popup-block" style="background-color:#fafafa;position:fixed;bottom:0px;left:0px;right:0px;margin:0 auto;height:80%;z-index:5">
				<h1 align="center" style="height:45px;font-size:16px;line-height:45px;color:#000">收货地址</h1>
				<table width="100%" height="85%" align="center" style="margin:0 auto;padding:0 0;" class="addrForm">
					<tr>
						<td width="25%" style="padding-left:10px;color:#000;">收货人</td>
						<td width="75%"><input id="name" name="name" type="text" placeholder="名字" style="border:none;background-color:transparent;width:100%" required></td>
					</tr>
					<tr>
						<td style="padding-left:10px;color:#000">联系电话</td>
						<td><input id="phonenum" name="phonenum" type="tel" placeholder="手机或固话" style="border:none;background-color:transparent;width:100%" required></td>
					</tr>
					<tr>
						<td style="padding-left:10px;color:#000">详细地址</td>
						<td><input id="address" name="address" type="text" placeholder="街道门牌信息" style="border:none;background-color:transparent;width:100%" required></td>
					</tr>
					<tr>
						<td style="padding-left:10px;color:#000">邮政编码</td>
						<td><input id="postCode" name="postCode	" type="tel" placeholder="邮政编码(选填)" style="border:none;background-color:transparent;width:100%" /></td>
					</tr>
					<tr>
						<td valign="middle" colspan="2"><a href="javascript:;" id="saveBtn" style="background-color:#44b549;color:#fff;width:95%;height:35px;display:block;margin:0 auto;padding:0 0;text-align:center;line-height:35px;border-radius:5px">保存</a></td>
					</tr>
				</table>
			</form>
			<input id="xPos" type="hidden" value="" />
			<input id="yPos" type="hidden" value="" />
			<input id="busId" type="hidden" value="${param.busId}" />
			<input id="openId" type="hidden" value="<%=openId %>" />
			<span id="addrName" style="display:none"></span>
		</div>
	</body>
	<script type="text/javascript" language="JavaScript" src="/micro/js/shopCart.js"></script>
	<script type="text/javascript">
		<c:choose>
			<c:when test="${newUser=='Y'}">
				$('#pay').magnificPopup({
		          type: 'inline',
		          preloader: false,
		          focus: '#name',
		          fixedContentPos: false,
		          fixedBgPos: true,
		          overflowY: 'auto',
		          closeBtnInside: true,
		          midClick: true,
		          removalDelay: 300,
		          mainClass: 'my-mfp-zoom-in',
		          callbacks: {
		            beforeOpen: function() {
		              if($(window).width() < 700) {
		                this.st.focus = false;
		              } else {
		                this.st.focus = '#name';
		              }
		            },
		            open:function(){
		            	var addrName = $("#addrName").html();
		            	$("#address").val(addrName);
		            }
		          }
		        });
		        $("#saveBtn").click(function(){
					addOrder();
				});
    		</c:when>
        	<c:otherwise>
				$("#pay").click(function(){
					addOrder();
				});
			</c:otherwise>
		</c:choose>
	</script>
</html>