<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html class="no-js admin responsive-320" lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta name="keywords" content=",移动电商服务平台">
		<meta name="HandheldFriendly" content="True">
		<meta name="MobileOptimized" content="320">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="cleartype" content="on">
		<link rel="shortcut icon" href="*.ico">
		<title>微商城--${product.productName}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="/micro/pub/css/base.css" >
		<link rel="stylesheet" type="text/css" href="/micro/pub/css/showcase_admin.css" >
		<link rel="stylesheet" type="text/css" href="/micro/pub/css/goods.css" >
		<link rel="stylesheet" type="text/css" href="/micro/pub/css/detail.s.min.css" >
		<link rel="stylesheet" type="text/css" href="/micro/pub/css/magnific-popup.css" >
		<script src="/micro/js/location.js" type="text/javascript"></script>
		<script src="/micro/pub/js/util.js" type="text/javascript"></script>
		<script src="/micro/pub/js/zepto.min.js" type="text/javascript"></script>
		<script src="/micro/pub/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
		<style type="text/css">
			.custom-richtext td{
				border:none;
				border-bottom:1px solid #f0f0f0;
			}
			.addrForm td{
				border-top:1px solid #f0f0f0;
				vertical-align:middle;
			}
		</style>
	</head>
	<body class=" body-fixed-bottom">
		<div class="container wap-goods internal-purchase">
			<div class="header">
				<div class="js-mp-info share-mp-info ">
					<a class="page-mp-info" href="http://wap.koudaitong.com/v2/showcase/homepage?kdt_id=1836140">
						<img class="mp-image" width="24" height="24" src="/pub/img/shop2.png">
						<i class="mp-nickname"> XXXXX</i> </a>
					<div class="links">
						<span class="js-search mp-search search-icon"></span>
						<a class="mp-homepage" href="http://wap.koudaitong.com/v2/showcase/usercenter?kdt_id=1836140">我的记录</a>
					</div>
				</div>
			</div>
			<div class="content " style="min-height: 548px;">
				<div class="content-body">
					<div class="custom-image-swiper custom-goods-swiper js-swp swp">
						<div class="swiper-wrapper js-swp-wrap" style="height: 320px;">
							<div class="swp-page">
								<img src="${product.imgUrl}">
							</div>
						</div>
						<div class="swiper-pagination js-swiper-pagination"></div>
					</div>
					<div class="goods-header">
						<h2 class="title">
							${product.productName}
						</h2>
						<span class="hide js-add-wish js-wish-animate wish-add  font-size-12 tag tag-redf30 pull-right">
							喜欢 </span>
						<div class="goods-price ">
							<div class="current-price">
								<span>￥&nbsp;</span><i class="js-goods-price price" id="productPrice">${product.productPrice}</i>
							</div>
						</div>
					</div>
					<hr class="with-margin">
					<div class="sku-detail adv-opts" style="border-top: none;">
						<div class="sku-detail-inner adv-opts-inner">
				            <dl>
								<dt style="margin-top:10px">
									数量：
								</dt>
								<dd>
									<div class="num_wrap">
					                    <span class="minus minus_disabled" id="minus" ptag="7001.1.11"></span>
					                    <input class="num" id="buyNum" type="tel" value="1" readonly="readonly">
					                    <span class="plus" id="plus" ptag="7001.1.11"></span>
					                </div>
								</dd>
							</dl>
							<dl>
								<dt>
									送至：
								</dt>
								<dd>
									<div class="promote_tag" id="addrArea" ptag="7001.1.4">
							            <div class="extra"><span id="postNotice2">当前位置</span></div>
							            <div class="addr"><span id="addrName"></span><span class="postage" id="postPrice"></span></div>
							        </div>
								</dd>
							</dl>
							<dl>
								<dt>
									剩余：
								</dt>
								<dd>
									<span id="prodStock">${product.productStock}</span>&nbsp;&nbsp;<span class="yh"><span class="tag" id="postNotice1">有货</span></span>
								</dd>
							</dl>
							<dl>
								<dt>
									运费：
								</dt>
								<dd>
									免运费
								</dd>
							</dl>
						</div>
					</div>
					<div class="js-store-info">
						<div class="block block-list goods-store">
							<div class="custom-store block-item ">
								<a class="custom-store-link clearfix" href="/view/shop/main.html">
									<div class="custom-store-img"></div>
									<div class="custom-store-name">XXXXX</div>
									<span class="custom-store-enter">进入店铺</span>
								</a>
							</div>
					</div>
					<div class="mod_fix_wrap">
					    <div class="mod_fix">
					        <div class="mod_tab" id="detailTab">
					            <span class="cur" no="1" id="pDesc" style="width:50%">商品详情</span>
					            <span no="2" class="" id="pOrder" style="width:50% !important;">本店成交</span>
					        </div>
					    </div>
					</div>
					<div class="js-detail-container" style="margin-top: 5px;" id="prodDesc">
						<div class="js-tabber-container goods-detail">
							<div class="js-tabber-content">
								<div class="js-part js-goods-detail goods-tabber-c" data-type="goods">
									<div class="js-components-container components-container">
										<div class="custom-richtext js-view-image-list">
											<p>
												<span style="font-size: 14px;">${product.productDesc}</span>
											</p>
											<!-- 
											<p>
												<span style="font-size: 14px;">---------------------</span>
											</p>
											<p>
												<span style="font-size: 14px; color: rgb(255, 0, 0);">什么什么什么什么</span>
											</p>
											 -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="js-detail-container" style="margin-top: 5px;display:none;" id="prodOrder">
						<div class="js-tabber-container goods-detail">
							<div class="js-tabber-content">
								<div class="js-part js-goods-detail goods-tabber-c" data-type="goods">
									<div class="js-components-container components-container">
										<div class="custom-richtext js-view-image-list" style="font-size:12px;text-align:center;padding:0 0">
											<c:choose>
												<c:when test="${fn:length(product.productOrderList)==0}">
													该商品暂时没有交易记录
												</c:when>
												<c:otherwise>
													<table style="margin:0 auto;width:100%" align="center" border="0">
														<tr>
															<td width="27%" align="left">买家</td>
															<td width="27%" align="center">数量</td>
															<td width="46%" align="right">成交时间</td>
														</tr>
														<c:forEach items="${product.productOrderList}" var="node">
															<tr style="background-color:#fff">
																<td style="background-color:#fff" align="left">${node.customerName}</td>
																<td style="background-color:#fff" align="center">${node.productNum}</td>
																<td style="background-color:#fff" align="right"><fmt:formatDate value="${node.createDate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
															</tr>
														</c:forEach>
													</table>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="js-bottom-opts js-footer-auto-ele bottom-fix">
						<div class="btn-2-1">
							<a href="#receiveAddrForm" class="js-buy-it btn btn-orange-dark" id="gotoBuy" data-effect="bounceInDown">立即购买</a>
						</div>
						<div class="btn-2-1">
							<a href="javascript:;" class="js-add-cart btn btn-white" id="joinShopCart">加入购物车</a>
						</div>
					</div>
				</div>
				<div class="content-sidebar">
					<a href="#" class="link">
						<div class="sidebar-section shop-card">
							<div class="table-cell">
								<img src="/pub/img/shop2_2x.jpg" width="60" height="60" class="shop-img" alt="公众号头像">
							</div>
							<div class="table-cell">
								<p class="shop-name">
									XXXX
								</p>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="js-footer" style="min-height: 1px;">
				<div class="footer">
					<div class="copyright">
						<div class="ft-links">
							<a href="#" target="_blank">店铺主页</a>
							<a href="#" target="_blank">会员中心</a>
						</div>
						<div class="ft-copyright" style="background-image:url()">
							<a href="#" target="_blank">华莱士提供技术支持</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script id="tmpl-sku" type="text/template">
			<div class="layout-title sku-box-shadow name-card sku-name-card">
                <div class="thumb"><img src="http://imgqn.koudaitong.com/upload_files/2015/01/18/Fj_qDo90aKhgN6p3wz8gWmd2bw0S.png!100x100.jpg" alt=""></div>
                        <div class="detail goods-base-info clearfix">
                <p class="title c-black ellipsis">回锅肉</p>
                <div class="goods-price clearfix">
                                    <div class="current-price c-black pull-left">
                        <span class='price-name pull-left font-size-14 c-orange'>￥</span><i class="js-goods-price price font-size-18 c-orange vertical-middle">0.01</i>
                    </div>
                                                    </div>
            </div> 
            <div class="js-cancel sku-cancel">
                <div class="cancel-img"></div>
            </div>
            </div>
    		<div class="adv-opts layout-content">
        		<div class="goods-models js-sku-views block block-list block-border-top-none"></div>
        		<div class="confirm-action content-foot"></div>
    		</div>
		</script>
		<script src="/js/u_b.js"></script>
		<div class="search-container hide">
			<form class="search-form" action="/v2/search" method="GET">
				<input type="search" class="search-input" placeholder="搜索本店所有商品" name="q" value="">
				<input type="hidden" name="kdt_id" value="1836140">
				<a class="js-search-cancel search-cancel" href="javascript:;">取消</a><span class="search-icon"></span><span class="close-icon hide"></span>
			</form>
			<div class="history-wrap center">
				<ul class="history-list"></ul>
				<a class="tag tag-clear c-gray-darker hide" href="javascript:;">清除历史搜索</a>
			</div>
		</div>
		<div id="right-icon" class="js-right-icon hide">
			<div class="js-right-icon-container right-icon-container clearfix">
				<a id="global-cart" href="/micro/view/shop/shopCart.jsp" class="icon">
					<p class="icon-img"></p>
					<p class="icon-txt">
						购物车
					</p>
				</a>
				<a class="js-show-more-btn icon show-more-btn"></a>
			</div>
		</div>
		<form id="receiveAddrForm" class="mfp-hide white-popup-block" style="background-color:#fafafa;position:fixed;bottom:0px;left:0px;right:0px;margin:0 auto;height:70%">
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
					<td valign="middle" style="padding-left:0px">
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
					<td><input id="address" name="address" type="text" placeholder="街道门牌信息" style="border:none;background-color:transparent" required></td>
				</tr>
				<tr>
					<td style="padding-left:10px;color:#000">邮政编码</td>
					<td><input id="postCode" name="postCode	" type="tel" placeholder="邮政编码(选填)" style="border:none;background-color:transparent" /></td>
				</tr>
				<tr>
					<td valign="middle" colspan="2"><a href="javascript:;" id="saveBtn" style="background-color:#44b549;color:#fff;width:95%;height:35px;display:block;margin:0 auto;padding:0 0;text-align:center;line-height:35px;border-radius:5px">保存</a></td>
				</tr>
			</table>
		</form>
		<input id="xPos" type="hidden" value="" />
		<input id="yPos" type="hidden" value="" />
		<input id="busId" type="hidden" value="${param.busId}" />
		<input id="phoneNum" type="hidden" value="${param.phoneNum}" />
		<input id="productId" type="hidden" value="${param.productId}" />
		<script type="text/javascript" language="javascript" src="/micro/js/prodDetail.js"></script>
		<script type="text/javascript">
			<c:choose>
				<c:when test="${newUser=='Y'}">
					$('#gotoBuy').magnificPopup({
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
			            }
			          }
			        });
				</c:when>
				<c:otherwise>
					$("#gotoBuy").on('touchend',function(){
						addOrder();
					});
				</c:otherwise>
			</c:choose>
			
		</script>
	</body>
</html>
