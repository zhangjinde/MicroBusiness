<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html class="no-js " lang="zh-CN" style="overflow: visible; height: auto; position: static;">
	<head>
    	<meta charset="utf-8">
    	<meta name="keywords" content=",移动电商服务平台">
        <meta name="HandheldFriendly" content="True">
        <meta name="MobileOptimized" content="320">
        <meta name="format-detection" content="telephone=no">
        <meta http-equiv="cleartype" content="on">
        <title>待付款的订单</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="/pub/css/base_2ced031129.css" />
		<link rel="stylesheet" href="/pub/css/trade_626cf27050.css">
	</head>
    <body class=" " style="overflow: visible; height: auto; padding: 0px;">
        <div class="container js-page-content wap-page-order">
            <div class="content confirm-container" style="min-height: 568px;">
                <div class="app app-order">
                    <div class="app-inner inner-order" id="js-page-content">
                        <!-- 通知 -->
                        <!-- 物流 -->
                        <div class="block express" id="js-logistics-container" style="margin-top: -1px;"><div class="block-item logistics hide">
                            <!-- <h4 class="block-item-title">配送方式</h4> -->
                            <div class="pull-left js-logistics-select">
                                <button data-type="express" class="tag tag-big tag-orange" style="margin-top:-3px;">快递配送</button>
                                <button data-type="self-fetch" class="tag tag-big hide js-tabber-self-fetch" style="margin-top:-3px;margin-left: 5px">到店自提</button>
                            </div>
                        </div>
                        <div class="js-logistics-content logistics-content js-express"><div class=""><div class="block block-form block-border-top-none block-border-bottom-none">
                            <div class="js-edit-address js-order-address express-panel express-panel-edit" style="padding-left:0;">
                                <ul class="express-detail">
                                    <li class="clearfix">
                                    	<span class="name">收货人：${orderInfo.customerName}</span>
                                    	<span class="tel">${orderInfo.telephone}</span>
                                    </li>
                                    <li class="address-detail">收货地址：${orderInfo.customerAddress}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="js-logistics-tips logistics-tips font-size-12 c-orange hide">很抱歉，该地区暂不支持配送。</div>
                    </div></div>
                    <div class="js-logistics-content logistics-content js-self-fetch hide"></div>
                </div>
                <!-- 商品列表 -->
                <div class="js-goods-list-container block block-order block-border-top-none">
                    <div class="header">
                        <span>店铺：${orderInfo.busName}</span>
                    </div>
                    <hr class="margin-0 left-10">
                        <div class="js-goods-list block block-list block-border-top-none block-border-bottom-none">
                            <c:forEach items="${orderInfo.orderDetailList}" var="node">	
                            	<div class="block-item name-card name-card-3col clearfix block-sku-35857182">
                                	<a href="#" class="thumb">
                                    <img src="#" alt="豆角茄子炒菜，米饭需单独购买 - 测试商品，不发货，不退款">
                                    </a>
                                    <div class="detail">
                                        <a href="#"><h3>豆角茄子炒菜，米饭需单独购买 - 测试商品，不发货，不退款</h3></a>
                                        <p class="c-gray ellipsis">
                                        </p>
                                        <p class="js-error c-orange hide"></p>
                                    </div>
                                    <div class="right-col">
                                        <div class="price">￥<span>0.01</span></div>
                                        <div class="num">×<span class="num-txt">1</span></div>
                                    </div>
                                </div>
                            </c:forEach>
                         </div>
                         <hr class="margin-0 left-10">
                         <div class="order-message clearfix js-order-message">
                       		<textarea class="js-msg-container font-size-12" placeholder="给卖家留言..."></textarea>
                         </div>
                         <div class="bottom">总价<span class="c-orange pull-right">￥0.01</span></div>
                     </div>
                        <div class="js-step-topay">
                            <div class="js-used-coupon block" style="">
                            	<div class="block-item order-coupon relative">
	                                <h4 class="block-item-title">优惠</h4>
	                                <div class="coupon-info-container">
	                                 <div class="js-normal-coupon coupon-info c-gray-dark">
	                                     <span class="js-change-coupon">使用优惠</span>
	                                 </div>
	                                 <span class="arrow"></span>
	                                </div>
	                            </div>
                     		</div>
		                     <div class="block">
		                        <div class="js-order-total block-item order-total"><p style="display:none">￥0.01 + ￥0.00运费
		                        </p>
		                        <strong class="js-real-pay c-orange js-real-pay-temp">
		                            需付：￥${orderInfo.orderPrice}
		                        </strong></div>
		                    </div>
		                    <div class="action-container" id="confirm-pay-way-opts"><div style="margin-bottom: 10px;"><button type="button" data-pay-type="umpay" class="btn-pay btn btn-block btn-large btn-umpay  btn-green">信用卡付款</button></div><div style="margin-bottom: 10px;"><button type="button" data-pay-type="other" class="btn-pay btn btn-block btn-large btn-other  btn-white">其他支付方式</button></div></div>
		                    <div class="action-container hide" id="get-present-btn"></div>
                    		<div class="center action-tip js-pay-tip">支付完成后，如需退换货请及时联系卖家</div>
                         </div>
                        </div>
                        <div class="app-inner inner-order peerpay-gift" style="display:none;" id="sku-message-poppage">
                            <div class="js-list block block-list"></div>
                            <h2>备注信息</h2>
                            <ul class="block block-form js-message-container"></ul>
                            <div class="action-container">
                                <button class="btn btn-white btn-block js-cancel">查看订单详情</button>
                            </div>
                        </div>
                    </div>
                </div>
                    <div id="js-self-fetch-modal" class="modal order-modal"></div>
  					<div class="footer">
                         <textarea id="footer-delay" style="display:none;">	&lt;div class="footer"&gt;
                          &lt;div class="copyright"&gt;
                          &lt;div class="ft-copyright"&gt;
                          &lt;a href="#" target="_blank"&gt;华莱士提供技术支持&lt;/a&gt;
                          &lt;/div&gt;
                          &lt;/div&gt;
                          &lt;/div&gt;
                      </textarea>
                      <div class="footer">
                       <div class="copyright">
                           <div class="ft-copyright">
                              <a href="#" target="_blank">华莱士提供技术支持</a>
                          </div>
                      </div>
                  </div>
          		 </div>
				</div>
               <script src="/js/base.js" language="javascript" type="text/javascript"></script>
               <script src="/js/u_b.js" language="javascript" type="text/javascript"></script>
           </body>
       </html>