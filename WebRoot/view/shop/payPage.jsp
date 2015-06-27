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
        <link rel="stylesheet" href="<%=path %>/pub/css/base_2ced031129.css" />
		<link rel="stylesheet" href="<%=path %>/pub/css/trade_626cf27050.css">
		<script src="<%=path %>/pub/js/util.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=path %>/js/location.js"></script>
		<script src="<%=path %>/pub/js/zepto.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="<%=path %>/pub/css/magnific-popup.css">
		<script type="text/javascript" src='<%=path %>/pub/js/jquery.magnific-popup.min.js'></script>
		<style type="text/css">
			.custom-richtext td{
				border:none;
				border-bottom:1px solid #f0f0f0;
			}
			.addrForm td{
				border-top:1px solid #f0f0f0;
				vertical-align:middle;
			}
			.gouPic{
				width:26px;
				height:26px;
				display:block;
				background-image:url('<%=path %>/pub/img/gouPic.png');
				background-repeat:repeat;
			}
			.chaPic{
				width:26px;
				height:26px;
				display:block;
				background-image:url('<%=path %>/pub/img/chaPic.png');
				background-repeat:repeat;
			}
		</style>
	</head>
    <body class=" " style="overflow: visible; height: auto; padding: 0px;">
    	<input type="hidden" id="orderId" value="${param.orderId}" />
    	<input type="hidden" id="busId" value="${param.busId}" />
    	<input type="hidden" id="openId" value="${param.openId}" />
    	<input type="hidden" id="xPos" value="" />
    	<input type="hidden" id="yPos" value="" />
        <div class="container js-page-content wap-page-order">
            <div class="content confirm-container" style="min-height: 568px;">
                <div class="app app-order">
                    <div class="app-inner inner-order" id="js-page-content">
                        <!-- 物流 -->
                        <div class="block express" id="js-logistics-container" style="margin-top: -1px;"><div class="block-item logistics hide">
                            <!-- <h4 class="block-item-title">配送方式</h4> -->
                            <div class="pull-left js-logistics-select">
                                <button data-type="express" class="tag tag-big tag-orange" style="margin-top:-3px;">快递配送</button>
                                <button data-type="self-fetch" class="tag tag-big hide js-tabber-self-fetch" style="margin-top:-3px;margin-left: 5px">到店自提</button>
                            </div>
                        </div>
                        <a href="#selectAddrForm" id="selectAddr" data-effect="bounceInDown">
                        <div class="js-logistics-content logistics-content js-express" ><div class=""><div class="block block-form block-border-top-none block-border-bottom-none">
                            <div class="js-edit-address js-order-address express-panel express-panel-edit" style="padding-left:0;">
                                <ul class="express-detail">
                                    <li class="clearfix">
                                    	<span class="name">收货人：${orderInfo.customerName}</span>
                                    	<span class="tel">${orderInfo.telephone}</span>
                                    </li>
                                    <li class="address-detail">收货地址：<span id="custAddr">${orderInfo.customerAddress}</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="js-logistics-tips logistics-tips font-size-12 c-orange hide">很抱歉，该地区暂不支持配送。</div>
                    </div></div></a>
                    <input type="hidden" id="customerDetailId" value="${orderInfo.customerDetailId}" />
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
                                	<a href="javascript:void(0)" onclick="getProds(${node.productId})" class="thumb">
                                    <img src="${node.imgUrl}" alt="${node.productName} ${node.productDesc}">
                                    </a>
                                    <div class="detail">
                                        <a href="javascript:void(0)" onclick="getProds(${node.productId})"><h3>${node.productName} ${node.productDesc}</h3></a>
                                        <p class="c-gray ellipsis">
                                        </p>
                                        <p class="js-error c-orange hide"></p>
                                    </div>
                                    <div class="right-col">
                                        <div class="price">￥<span>${node.productPrice}</span></div>
                                        <div class="num">×<span class="num-txt">${node.productNum}</span></div>
                                    </div>
                                </div>
                            </c:forEach>
                         </div>
                         <hr class="margin-0 left-10">
                         <div class="order-message clearfix js-order-message">
                       		<textarea class="js-msg-container font-size-12" placeholder="给卖家留言..."></textarea>
                         </div>
                         <div class="bottom">总价<span class="c-orange pull-right">￥${orderInfo.orderPrice}</span></div>
                     </div>
                        <div class="js-step-topay">
                            <div class="js-used-coupon block" style="display:none">
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
                     		<div class="js-used-coupon block" style="">
                            	<div class="block-item order-coupon relative">
	                                <h4 class="block-item-title">送货店家</h4>
	                                <div class="coupon-info-container">
	                                 <div class="js-normal-coupon coupon-info c-gray-dark">
	                                     <select class="pull-right" style="font-size:12px;font-family:Helvetica, 'STHeiti STXihei', 'Microsoft JhengHei', 'Microsoft YaHei', Tohoma, Arial;margin-top:3px;direction:rtl;" id="busInfo">
			                         		<c:forEach items="${orderInfo.busDetailList}" var="node">
			                         			<c:choose>
			                         				<c:when test="${orderInfo.busDetailId==node.busDetailId}">
					                     				<option value="${node.busDetailId}" selected="selected">${node.busDetailName}</option>
			                         				</c:when>
			                         				<c:otherwise>
			                         					<option value="${node.busDetailId}">${node.busDetailName}</option>
			                         				</c:otherwise>
			                         			</c:choose>
			                         		</c:forEach>
			                         	</select>
			                         	<input type="hidden" id="busInstance" value="" />
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
		                    <div class="action-container" id="confirm-pay-way-opts"><div style="margin-bottom: 10px;"><button type="button" id="payOrderBtn" data-pay-type="umpay" class="btn-pay btn btn-block btn-large btn-umpay  btn-green">货到付款</button></div><div style="margin-bottom: 10px;display:none"><button type="button" data-pay-type="other" class="btn-pay btn btn-block btn-large btn-other  btn-white">其他支付方式</button></div></div>
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
                       	   <div class="ft-links">
						   	  <a href="/micro/shop.jsp" target="_blank">店铺主页</a>
							  <a href="/micro/view/shop/user_center.jsp?busId=100" target="_blank">会员中心</a>
						   </div>
                           <div class="ft-copyright">
                              <a href="#" target="_blank">华莱士提供技术支持</a>
                          </div>
                      </div>
                  </div>
          		 </div>
				</div>
				<form id="selectAddrForm" class="mfp-hide white-popup-block" style="background-color:#fafafa;position:fixed;bottom:0px;left:0px;right:0px;margin:0 auto;height:auto">
					<h1 align="center" style="height:45px;font-size:16px;line-height:45px;color:#000">选择收货地址</h1>
					<table width="100%" height="85%" align="center" style="margin:0 auto;padding:0 0;" class="addrForm">
						<c:forEach items="${orderInfo.custAddrList}" var="node">
							<tr>
								<td height="80" width="15%" align="center">
									<c:choose>
										<c:when test="${node.isPrimary == 'A'}">
											<a href="javascript:void(0)" class="gouPic" value="${node.customerDetailId}">&nbsp;</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0)" class="chaPic" value="${node.customerDetailId}">&nbsp;</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td height="80" width="70%">
									<input type="hidden" class="customerId" value="${node.customerId}" />
									<input type="hidden" class="customerDetailId" value="${node.customerDetailId}" />
									<input type="hidden" id="customerName${node.customerDetailId}" value="${node.customerName}" />
									<input type="hidden" id="customerTelephone${node.customerDetailId}" value="${node.customerTelephone}" />
									<input type="hidden" id="provId${node.customerDetailId}" value="${node.provId}" />
									<input type="hidden" id="cityId${node.customerDetailId}" value="${node.cityId}" />
									<input type="hidden" id="districtId${node.customerDetailId}" value="${node.districtId}" />
									<input type="hidden" id="customerAddress${node.customerDetailId}" value="${node.customerAddress}" />
									<input type="hidden" id="customerPostcode${node.customerDetailId}" value="${node.customerPostcode}" />
									<p>${node.customerName},${node.customerTelephone}</p>
									<p style="color:#777777">${node.customerAddress}</p>
								</td>
								<td height="80" width="15%" align="center">
									<a href="javascript:void(0)" class="addrUpdateInfo" value="${node.customerDetailId}" data-effect="bounceInDown"><img src="<%=path %>/pub/img/infoPic.png" /></a>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td height="80" align="center"><a href="javascript:void(0)" class="addrInfo" data-effect="bounceInDown"><img src="<%=path %>/pub/img/addPic.png" /></a></td>
							<td height="80"><a href="#receiveAddrForm" class="addrInfo" data-effect="bounceInDown">新增地址</a></td>
							<td height="80" align="center"><span class="arrow">&nbsp;</span></td>
						</tr>
					</table>
				</form>
				<form id="updateAddrForm" class="mfp-hide white-popup-block" style="background-color:#fafafa;position:fixed;bottom:0px;left:0px;right:0px;margin:0 auto;height:90%">
					<h1 align="center" style="height:45px;font-size:16px;line-height:45px;color:#000">收货地址</h1>
					<table width="100%" height="85%" align="center" style="margin:0 auto;padding:0 0;" class="addrForm">
						<tr>
							<td width="25%" style="padding-left:10px;color:#000;">收货人</td>
							<td width="75%"><input id="uname" name="uname" type="text" placeholder="名字" style="border:none;background-color:transparent" required></td>
						</tr>
						<tr>
							<td style="padding-left:10px;color:#000">联系电话</td>
							<td><input id="uphonenum" name="uphonenum" type="tel" placeholder="手机或固话" style="border:none;background-color:transparent" required></td>
						</tr>
						<tr>
							<td valign="middle" style="padding-left:10px;color:#000">选择地区</td>
							<td valign="middle" style="padding-left:8px">
								<select id="uprovince" style="border:none;background-color:transparent">
					        		<option value="">选择省份</option>
					        		<c:forEach items="${provList}" var="node">
					        			<option value="${node.provinceId}">${node.provinceName}</option>
					        		</c:forEach>
					        	</select>
					        	<select id="ucity" style="border:none;background-color:transparent">
					        		<option value="">选择城市</option>
					        	</select>
					        	<select id="udistrict" style="border:none;background-color:transparent">
					        		<option value="">选择区县</option>
					        	</select>
							</td>
						</tr>
						<tr>
							<td style="padding-left:10px;color:#000">详细地址</td>
							<td><input id="uaddress" name="uaddress" type="text" placeholder="街道门牌信息" style="border:none;background-color:transparent;width:100%" required></td>
						</tr>
						<tr>
							<td style="padding-left:10px;color:#000">邮政编码</td>
							<td style="padding-left:8px"><input id="upostCode" name="upostCode" type="tel" placeholder="邮政编码(选填)" style="border:none;background-color:transparent;width:100%" /></td>
						</tr>
						<tr>
							<td valign="middle" colspan="2"><a href="javascript:;" id="usaveBtn" style="background-color:#44b549;color:#fff;width:95%;height:35px;display:block;margin:0 auto;padding:0 0;text-align:center;line-height:35px;border-radius:5px">保存</a></td>
						</tr>
						<tr>
							<td valign="middle" colspan="2"><a href="javascript:;" id="udelBtn" style="background-color:#777;color:#fff;width:95%;height:35px;display:block;margin:0 auto;padding:0 0;text-align:center;line-height:35px;border-radius:5px">删除该地址</a></td>
						</tr>
					</table>
				</form>
		        <form id="receiveAddrForm" class="mfp-hide white-popup-block" style="background-color:#fafafa;position:fixed;bottom:0px;left:0px;right:0px;margin:0 auto;height:90%">
					<h1 align="center" style="height:45px;font-size:16px;line-height:45px;color:#000">收货地址</h1>
					<table width="100%" height="85%" align="center" style="margin:0 auto;padding:0 0;" class="addrForm">
						<tr>
							<td width="25%" style="padding-left:10px;color:#000;">收货人</td>
							<td width="75%"><input id="name" name="name" type="text" placeholder="名字" style="border:none;background-color:transparent" required></td>
						</tr>
						<tr>
							<td style="padding-left:10px;color:#000">联系电话</td>
							<td><input id="phonenum" name="phonenum" type="tel" placeholder="手机或固话" style="border:none;background-color:transparent" required></td>
						</tr>
						<tr>
							<td valign="middle" style="padding-left:10px;color:#000">选择地区</td>
							<td valign="middle" style="padding-left:8px">
								<select id="province" style="border:none;background-color:transparent" onchange="areaChange(this,'city')">
					        		<option value="">选择省份</option>
					        		<c:forEach items="${provList}" var="node">
					        			<option value="${node.provinceId}">${node.provinceName}</option>
					        		</c:forEach>
					        	</select>
					        	<select id="city" style="border:none;background-color:transparent" onchange="areaChange(this,'district')">
					        		<option value="">选择城市</option>
					        	</select>
					        	<select id="district" style="border:none;background-color:transparent">
					        		<option value="">选择区县</option>
					        	</select>
							</td>
						</tr>
						<tr>
							<td style="padding-left:10px;color:#000">详细地址</td>
							<td><input id="address" name="address" type="text" placeholder="街道门牌信息" style="border:none;background-color:transparent;width:100%" required></td>
						</tr>
						<tr>
							<td style="padding-left:10px;color:#000">邮政编码</td>
							<td style="padding-left:8px"><input id="postCode" name="postCode" type="tel" placeholder="邮政编码(选填)" style="border:none;background-color:transparent;width:100%" /></td>
						</tr>
						<tr>
							<td valign="middle" colspan="2"><a href="javascript:;" id="saveBtn" style="background-color:#44b549;color:#fff;width:95%;height:35px;display:block;margin:0 auto;padding:0 0;text-align:center;line-height:35px;border-radius:5px">保存</a></td>
						</tr>
					</table>
				</form>
				<script type="text/javascript" src="<%=path %>/js/payPage.js"></script>
           </body>
       </html>