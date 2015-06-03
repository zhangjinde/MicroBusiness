<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<title>回锅肉</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="/pub/css/base.css" >
		<link rel="stylesheet" href="/pub/css/showcase_admin.css" >
		<link rel="stylesheet" href="/pub/css/goods.css" >
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
								<img src="/pub/img/goods123123.png">
							</div>
						</div>
						<div class="swiper-pagination js-swiper-pagination"></div>
					</div>
					<div class="goods-header">
						<h2 class="title">
							回锅
						</h2>
						<span class="hide js-add-wish js-wish-animate wish-add  font-size-12 tag tag-redf30 pull-right">
							喜欢 </span>
						<div class="goods-price ">
							<div class="current-price">
								<span>￥&nbsp;</span><i class="js-goods-price price">0.01</i>
							</div>
						</div>
					</div>
					<hr class="with-margin">
					<div class="sku-detail adv-opts" style="border-top: none;">
						<div class="sku-detail-inner adv-opts-inner">
							<dl>
								<dt>
									剩余：
								</dt>
								<dd>
									999
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
								<a class="custom-store-link clearfix" href="#">
									<div class="custom-store-img"></div>
									<div class="custom-store-name">XXXXX</div>
									<span class="custom-store-enter">进入店铺</span>
								</a>
							</div>
					</div>
					<div class="js-detail-container" style="margin-top: 5px;">
						<div class="js-tabber-container goods-detail">
							<div class="js-tabber-content">
								<div class="js-part js-goods-detail goods-tabber-c" data-type="goods">
									<div class="js-components-container components-container">
										<div class="custom-richtext js-view-image-list">
											<p>
												<span style="font-size: 14px;">什么什么什么什么</span>
											</p>
											<p>
												<span style="font-size: 14px;">---------------------</span>
											</p>
											<p>
												<span style="font-size: 14px; color: rgb(255, 0, 0);">什么什么什么什么</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script type="text/javascript" charset="utf-8" async="" src="/js/swp_goods.js"></script>
					</div>
					<div class="js-bottom-opts js-footer-auto-ele bottom-fix">
						<div class="btn-2-1">
							<a href="javascript:;" class="js-buy-it btn btn-orange-dark">立即购买</a>
						</div>
						<div class="btn-2-1">
							<a href="javascript:;" class="js-add-cart btn btn-white">加入购物车</a>
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
							<a href="#" target="_blank">微商城提供技术支持</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="/js/common_jquery.js" ></script>
		<script src="/js/base.js" ></script>
		<script src="/js/base_showcase.js" ></script>
		<script src="/js/global_icon.js"></script>
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
		<script src="/js/sku.js"></script>
		<script	src="/js/goods.js"></script>
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
				<a id="global-cart" href="#" class="icon hide">
					<p class="icon-img"></p>
					<p class="icon-txt">
						购物车
					</p>
				</a>
				<a class="js-show-more-btn icon show-more-btn hide"></a>
			</div>
		</div>
	</body>
</html>