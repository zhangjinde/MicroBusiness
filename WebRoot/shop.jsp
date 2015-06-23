<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String openId =(String) request.getAttribute("openid");
%>
<!DOCTYPE html>
<html class="no-js admin responsive-320" lang="zh-CN">
  
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="keywords" content="华莱士移动电商服务平台">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="cleartype" content="on">
    <title>
    	  华莱士炸鸡汉堡
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/micro/pub/css/base.css">
    <link rel="stylesheet" href="/micro/pub/css/showcase.css">
    <script type="text/javascript" src="/micro/pub/js/jquery-1.11.3.min.js">
    </script>
    <script type="text/javascript" src="/micro/pub/js/jquery.cookie.js">
    </script>
    <script type="text/javascript" src="/micro/pub/js/jquery.json.min.js">
    </script>
    <script type="text/javascript" src="/micro/js/global.js">
   
    </script>
  <script type="text/javascript">
  
  init();
  function init()
  {
	 setCookie("openid","oLsjhsuYDJZMpNK0jt09X8Wtt5DY"); 
	  
  	 var url="https://www.hbywzc.cn/micro/oauth.do?method=getCode&page=shop";
  	 var openid=getCookie("openid");
  	 var id='<%=openId%>';
  	 if(openid=='' || openid==null)
  	 {
  		  encodeURL(url); 
  	 }else if(id!='' && id!=null && id!='null')
  	 {
  		 setCookie("openid",'<%=openId%>'); 
  	 }
  }

  
  function toMyCart()
  {
	  var url= "https://www.hbywzc.cn/micro/oauth.do?method=getCode&page=shopCart";
	  alert(getCookie("openid"));
	  var openid=getCookie("openid");
	  if(openid=='' || openid==null)
	  {
		  var url="";
		  encodeURL(url); 
	  }else
	  {
		 // window.location.href="https://www.hbywzc.cn/micro/view/shop/shopCart.jsp?openid="+openid;
		  window.location.href="http://localhost:7001/micro/view/shop/shopCart.jsp?openid="+openid;
	  }
  }
  
</script>
    
    <style>
      .content{background-color:#02813e}
    </style>
  </head>
  
  <body class=" " style="padding-bottom: 50px;">
    <div class="container ">
      <div class="header">
        <div class="headerbar">
        </div>
      </div>
      <div class="content " style="min-height: 576px;">
        <div class="content-body">
          <!--店铺主页模板-默认-->
          <div class="tpl-shop">
            <div class="tpl-shop-header" style="background-color:#EF483F; background-image: url(/micro/pub/img/bk.jpg);">
              <div class="tpl-shop-title">
                华莱士炸鸡汉堡
              </div>
              <div class="tpl-shop-avatar">
                <img src="/micro/pub/img/logo.jpg" alt="头像">
              </div>
            </div>
            <div class="tpl-shop-content">
              <ul class="clearfix">
                <li class="js-all-goods">
                  <a href="/micro/view/shop/product_all.jsp">
                    <span class="count">
                      21
                    </span>
                    <span class="text">
                      全部商品
                    </span>
                  </a>
                </li>
                <li class="js-new-goods">
                  <a href="">
                    <span class="count">
                      0
                    </span>
                    <span class="text">
                      上新商品
                    </span>
                  </a>
                </li>
                <li class="js-order">
                  <a onclick="toMyCart()" href="javascript:;">
                    <span class="count user">
                    </span>
                    <span class="text">
                      我的订单
                    </span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div id="tag-4" class="custom-tags js-custom-tags" data-size="1" data-size_type="0"
          data-buy_btn="1" data-buy_btn_type="3" data-title="1" data-price="1" data-cart="1"
          data-show_wish_btn="0" data-wish_btn_type="1" data-show_sub_title="0">
            <div class="js-tabber-tags tabber tabber-bottom red clearfix tabber-n3 ">
              <a id="tag-1" href="javascript:;" class="active" onclick="cActive('1')">
                精选套餐
              </a>
              <a id="tag-2" href="javascript:;" onclick="cActive('2')">
                主食
              </a>
              <a id="tag-3" href="javascript:;" onclick="cActive('3')">
                经典小吃
              </a>
            </div>
            <script type="text/javascript">
              function cActive(type) {
                if ('1' == type) {
                  $("#tag-1").addClass("active");
                  $("#tag-2").removeClass("active");
                  $("#tag-3").removeClass("active");
                  
                  $("#goods-tag-1").removeClass("hide");
                  $("#goods-tag-2").addClass("hide");
                  $("#goods-tag-3").addClass("hide");
                  
                } else if ('2' == type) {
                  $("#tag-1").removeClass("active");
                  $("#tag-2").addClass("active");
                  $("#tag-3").removeClass("active");
                  
                  $("#goods-tag-1").addClass("hide");
                  $("#goods-tag-2").removeClass("hide");
                  $("#goods-tag-3").addClass("hide");
                  
                } else if ('3' == type) {
                  $("#tag-1").removeClass("active");
                  $("#tag-2").removeClass("active");
                  $("#tag-3").addClass("active");
                  
                  $("#goods-tag-1").addClass("hide");
                  $("#goods-tag-2").addClass("hide");
                  $("#goods-tag-3").removeClass("hide");
                  
                }
              }
            </script>
            <div id="goods-tag-1" class="js-goods-tag js-goods-tag-1" data-alias="1draogn7l" style="min-height:100px;">
              <div class="js-list">
                <ul class="js-goods-list sc-goods-list pic clearfix size-1 " data-size="1"
                data-showtype="card" style="visibility: visible;">
                  <!--商品区域-->
                  <!--展现类型判断-->
                  <li class="js-goods-card goods-card goods-list small-pic card ">
                    <a class="js-goods link clearfix prods"
                    target="_blank" data-goods-id="10001" title="鳕鱼堡+上校鸡块+香辣鸡翅">
                      <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
                        <img class="goods-photo js-goods-lazy"  src="/micro/pub/img/11.jpg"
                        style="display: block;">
                      </div>
                      <div class="info clearfix info-title info-price btn3">
                        <p class=" goods-title ">
                          鳕鱼堡+上校鸡块+香辣鸡翅
                        </p>
                        <p class="goods-sub-title c-black hide">
                        </p>
                        <p class="goods-price">
                          <em>
                            ￥18.00
                          </em>
                        </p>
                        <p class="goods-price-taobao  hide">
                          淘价：
                        </p>
                      </div>
                      <div class="goods-buy btn3 info-title">
                      </div>
                      <div class="js-goods-buy buy-response" data-alias="18uq360cb" data-postage="0"
                      data-buyway="1" data-id="9933317" data-title="鳕鱼堡+上校鸡块+香辣鸡翅" data-price="18.00"
                      data-isvirtual="0">
                      </div>
                    </a>
                  </li>
                  <li class="js-goods-card goods-card goods-list small-pic card ">
                    <a class="js-goods link clearfix prods"
                    target="_blank" data-goods-id="10002" title="牛肉汉堡+田园鲜疏汉堡+可乐">
                      <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
                        <img class="goods-photo js-goods-lazy"   src="/micro/pub/img/12.jpg"
                        style="display: block;">
                      </div>
                      <div class="info clearfix info-title info-price btn3">
                        <p class=" goods-title ">
                          牛肉汉堡+田园鲜疏汉堡+可乐
                        </p>
                        <p class="goods-sub-title c-black hide">
                        </p>
                        <p class="goods-price">
                          <em>
                            ￥14.00
                          </em>
                        </p>
                        <p class="goods-price-taobao  hide">
                          淘价：
                        </p>
                      </div>
                      <div class="goods-buy btn3 info-title">
                      </div>
                      <div class="js-goods-buy buy-response" data-alias="c4vfxjch" data-postage="0"
                      data-buyway="1" data-id="9932992" data-title="牛肉汉堡+田园鲜疏汉堡+可乐" data-price="14.00"
                      data-isvirtual="0">
                      </div>
                    </a>
                  </li>
                  <li class="js-goods-card goods-card goods-list small-pic card ">
                    <a class="js-goods link clearfix prods"
                    target="_blank" data-goods-id="10003" title="田园鲜蔬汉堡+上校鸡块+可乐">
                      <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
                        <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FjcIDaLN6QLbY0VrJWp_XYzc82dT.jpg!140x140+2x.jpg"
                        src="/micro/pub/img/13.jpg" style="display: block;">
                      </div>
                      <div class="info clearfix info-title info-price btn3">
                        <p class=" goods-title ">
                          田园鲜蔬汉堡+上校鸡块+可乐
                        </p>
                        <p class="goods-sub-title c-black hide">
                        </p>
                        <p class="goods-price">
                          <em>
                            ￥12.00
                          </em>
                        </p>
                        <p class="goods-price-taobao  hide">
                          淘价：
                        </p>
                      </div>
                      <div class="goods-buy btn3 info-title">
                      </div>
                      <div class="js-goods-buy buy-response" data-alias="11wrxwmtn" data-postage="0"
                      data-buyway="1" data-id="9932548" data-title="田园鲜蔬汉堡+上校鸡块+可乐" data-price="12.00"
                      data-isvirtual="0">
                      </div>
                    </a>
                  </li>
                  <li class="js-goods-card goods-card goods-list small-pic card ">
                    <a class="js-goods link clearfix prods"
                    target="_blank" data-goods-id="10004" title="双层培根红肠堡+香辣鸡翅一对+可乐">
                      <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
                        <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FkA6p3Qz50aQigc1-2D3c3DJkp0O.jpg!140x140+2x.jpg"
                         src="/micro/pub/img/14.jpg" style="display: block;">
                      </div>
                      <div class="info clearfix info-title info-price btn3">
                        <p class=" goods-title ">
                          双层培根红肠堡+香辣鸡翅一对+可乐
                        </p>
                        <p class="goods-sub-title c-black hide">
                        </p>
                        <p class="goods-price">
                          <em>
                            ￥15.00
                          </em>
                        </p>
                        <p class="goods-price-taobao  hide">
                          淘价：
                        </p>
                      </div>
                      <div class="goods-buy btn3 info-title">
                      </div>
                      <div class="js-goods-buy buy-response" data-alias="doeo4jf1" data-postage="0"
                      data-buyway="1" data-id="9932335" data-title="双层培根红肠堡+香辣鸡翅一对+可乐" data-price="15.00"
                      data-isvirtual="0">
                      </div>
                    </a>
                  </li>
                  <li class="js-goods-card goods-card goods-list small-pic card ">
                    <a class="js-goods link clearfix prods"
                    target="_blank" data-goods-id="10005" title="BBQ烤鸡+紫薯豌豆派+可乐">
                      <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
                        <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FmVCP4H7wLEts1rK6YqoF1ZcNLFa.jpg!140x140+2x.jpg"
                         src="/micro/pub/img/15.jpg" style="display: block;">
                      </div>
                      <div class="info clearfix info-title info-price btn3">
                        <p class=" goods-title ">
                          BBQ烤鸡+紫薯豌豆派+可乐
                        </p>
                        <p class="goods-sub-title c-black hide">
                        </p>
                        <p class="goods-price">
                          <em>
                            ￥22.00
                          </em>
                        </p>
                        <p class="goods-price-taobao  hide">
                          淘价：
                        </p>
                      </div>
                      <div class="goods-buy btn3 info-title">
                      </div>
                      <div class="js-goods-buy buy-response" data-alias="19ducdsvx" data-postage="0"
                      data-buyway="1" data-id="9932001" data-title="BBQ烤鸡+紫薯豌豆派+可乐" data-price="22.00"
                      data-isvirtual="0">
                      </div>
                    </a>
                  </li>
                  <li class="js-goods-card goods-card goods-list small-pic card ">
                    <a class="js-goods link clearfix prods"
                    target="_blank" data-goods-id="10006" title="香辣鸡腿汉堡+墨西哥鸡肉卷+可乐">
                      <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
                        <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FsYO8iqxk0gQGlQ8f3enjA3KUr9Z.jpg!140x140+2x.jpg"
                        src="/micro/pub/img/16.jpg" style="display: block;">
                      </div>
                      <div class="info clearfix info-title info-price btn3">
                        <p class=" goods-title ">
                          香辣鸡腿汉堡+墨西哥鸡肉卷+可乐
                        </p>
                        <p class="goods-sub-title c-black hide">
                        </p>
                        <p class="goods-price">
                          <em>
                            ￥16.00
                          </em>
                        </p>
                        <p class="goods-price-taobao  hide">
                          淘价：
                        </p>
                      </div>
                      <div class="goods-buy btn3 info-title">
                      </div>
                      <div class="js-goods-buy buy-response" data-alias="jnknohil" data-postage="0"
                      data-buyway="1" data-id="9931590" data-title="香辣鸡腿汉堡+墨西哥鸡肉卷+可乐" data-price="16.00"
                      data-isvirtual="0">
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            
            <div id="goods-tag-2" class="js-goods-tag js-goods-tag-2 hide" data-alias="dbcial5o" style="min-height:100px;">
  <div class="js-list">
    <ul class="js-goods-list sc-goods-list pic clearfix size-1 " data-size="1"
    data-showtype="card" style="visibility: visible;">
      <!-- 商品区域 -->
      <!-- 展现类型判断 -->
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10007" title="牛牛牛卷">
          <div class="photo-block" data-width="756" data-height="756" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy"  
            src="/micro/pub/img/21.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              牛牛牛卷
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥10.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="dgs5l35e" data-postage="0"
          data-buyway="1" data-id="9937870" data-title="牛牛牛卷" data-price="10.00"
          data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10008" title="墨西哥鸡肉卷">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" 
            src="/micro/pub/img/22.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              墨西哥鸡肉卷
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥9.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="19b2rzszn" data-postage="0"
          data-buyway="1" data-id="9928438" data-title="墨西哥鸡肉卷" data-price="9.00"
          data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10009" title="BBQ烤鸡">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy"  
            src="/micro/pub/img/23.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              BBQ烤鸡
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥18.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="1acks7p9d" data-postage="0"
          data-buyway="1" data-id="9928154" data-title="BBQ烤鸡" data-price="18.00"
          data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10010" title="双层培根红肠堡">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" 
            src="/micro/pub/img/24.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              双层培根红肠堡
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥10.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="g5g9el3" data-postage="0"
          data-buyway="1" data-id="9927851" data-title="双层培根红肠堡" data-price="10.00"
          data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10011" title="鳕鱼堡">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" 
            src="/micro/pub/img/25.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              鳕鱼堡
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥9.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="68gffzxx" data-postage="0"
          data-buyway="1" data-id="9927253" data-title="鳕鱼堡" data-price="9.00" data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10012" title="德式烤肠牛堡">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy"  
            src="/micro/pub/img/26.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              德式烤肠牛堡
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥9.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="x3s7bkvs" data-postage="0"
          data-buyway="1" data-id="9926886" data-title="德式烤肠牛堡" data-price="9.00"
          data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10013" title="牛肉汉堡">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy"  
             src="/micro/pub/img/27.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              牛肉汉堡
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥8.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="1b8q81poj" data-postage="0"
          data-buyway="1" data-id="9926526" data-title="牛肉汉堡" data-price="8.00" data-isvirtual="0">
          </div>
        </a>
      </li>
    </ul>
  </div>
</div>
  <div id="goods-tag-3" class="js-goods-tag js-goods-tag-3 hide" data-alias="14l1oatc7" style="min-height:100px;">
  <div class="js-list">
    <ul class="js-goods-list sc-goods-list pic clearfix size-1 " data-size="1"
    data-showtype="card" style="visibility: visible;">
      <!-- 商品区域 -->
      <!-- 展现类型判断 -->
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10014" title="香辣鸡翅">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FnfUcgNlTNgKjaaOPCAbC2jRYujZ.jpg!140x140+2x.jpg"
           src="/micro/pub/img/31.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              香辣鸡翅
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥7.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="1gt6z8qgr" data-postage="0"
          data-buyway="1" data-id="9930968" data-title="香辣鸡翅" data-price="7.00" data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10015" title="脆皮炸鸡">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FuhVo0p36Nw4_JFLAdZdwwnSzg90.jpg!140x140+2x.jpg"
            src="/micro/pub/img/32.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              脆皮炸鸡
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥7.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="1cks7z47z" data-postage="0"
          data-buyway="1" data-id="9930477" data-title="脆皮炸鸡" data-price="7.00" data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10016" title="香辣骨肉串">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FiqdsdPmCRaeQJUMm2fwFzr6aRhJ.jpg!140x140+2x.jpg"
           src="/micro/pub/img/33.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              香辣骨肉串
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥3.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="b8ncib10" data-postage="0"
          data-buyway="1" data-id="9930216" data-title="香辣骨肉串" data-price="3.00"
          data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10017" title="鸡米花">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FutSbHGmYc0xoAr2BC99MTByX423.jpg!140x140+2x.jpg"
          src="/micro/pub/img/34.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              鸡米花
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥7.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="1efw7lj3x" data-postage="0"
          data-buyway="1" data-id="9929952" data-title="鸡米花" data-price="7.00" data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10018" title="辣子鸡块">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FlruAxbusd0tADg-OvnQ6FRAOnUx.jpg!140x140+2x.jpg"
            src="/micro/pub/img/35.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              辣子鸡块
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥8.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="kyv7aavg" data-postage="0"
          data-buyway="1" data-id="9929640" data-title="辣子鸡块" data-price="8.00" data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10019" title="上校鸡块">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FiIb6eFAuMp7XzEXMAg2JPLvX3iu.jpg!140x140+2x.jpg"
           src="/micro/pub/img/36.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              上校鸡块
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥7.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="1eemtw13x" data-postage="0"
          data-buyway="1" data-id="9929336" data-title="上校鸡块" data-price="7.00" data-isvirtual="0">
          </div>
        </a>
      </li>
      <li class="js-goods-card goods-card goods-list small-pic card ">
        <a class="js-goods link clearfix prods"
        target="_blank" data-goods-id="10020" title="紫薯豌豆派">
          <div class="photo-block" data-width="640" data-height="640" style="background-color: rgb(255, 255, 255);">
            <img class="goods-photo js-goods-lazy" data-src="http://imgqn.koudaitong.com/upload_files/2015/03/13/FlWLqqlLBJo39jIrP7AG_EmYLaJ0.jpg!140x140+2x.jpg"
            src="/micro/pub/img/37.jpg" style="display: block;">
          </div>
          <div class="info clearfix info-title info-price btn3">
            <p class=" goods-title ">
              紫薯豌豆派
            </p>
            <p class="goods-sub-title c-black hide">
            </p>
            <p class="goods-price">
              <em>
                ￥5.00
              </em>
            </p>
            <p class="goods-price-taobao  hide">
              淘价：
            </p>
          </div>
          <div class="goods-buy btn3 info-title">
          </div>
          <div class="js-goods-buy buy-response" data-alias="impnl2zq" data-postage="0"
          data-buyway="1" data-id="9929119" data-title="紫薯豌豆派" data-price="5.00"
          data-isvirtual="0">
          </div>
        </a>
      </li>
    </ul>
  </div>
</div>
            
            
          </div>
        </div>
        <div class="content-sidebar">
          <a href="http://wap.koudaitong.com/v2/showcase/homepage?kdt_id=803178"
          class="link">
            <div class="sidebar-section shop-card">
              <div class="table-cell">
                <img src="./华莱士炸鸡汉堡_files/Fsm23pJaMB-VvmrtOcwwv21VcIPc.jpg!60x60+2x.jpg"
                width="60" height="60" class="shop-img" alt="公众号头像">
              </div>
              <div class="table-cell">
                <p class="shop-name">
                  湖北华莱士
                </p>
              </div>
            </div>
          </a>
        </div>
        <script type="text/javascript">
          var showQcode = function() {
            if (typeof $ !== 'undefined' && window.zenjs && window.zenjs.UA) {
              var $qrcode = $('.js-follow-qrcode');
              $qrcode.removeClass('js-follow-qrcode');
              if ($qrcode.length == 0) return;
              if (!window._global.mp_data || $qrcode.length <= 0 || (window.zenjs.UA.isMobile() && !window.zenjs.UA.isIPad())) {
                return false
              }
              var followQrcodeSrc = 'http://open.weixin.qq.com/qr/code/?username=' + window._global.mp_data.mp_weixin;
              var img = new Image();
              img.width = 158;
              img.height = 158;
              $(img).on('load',
              function(event) {
                $qrcode.append(img).removeClass('loading')
              });
              img.src = followQrcodeSrc
            } else {
              setTimeout(showQcode, 500)
            }
          };
          showQcode();
        </script>
        <div class="js-navmenu js-footer-auto-ele shop-nav nav-menu nav-menu-2 has-menu-5"
        style="background-color: #02813e;">
          <ul class="clearfix">
            <li>
              <a href="http://wap.koudaitong.com/v2/home/13q1v5ag6" style="
              background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/27/FgoMDhfG936BFs3_HI83rWv7YgPb.jpg);
              background-size: 50px 50px
              ">
              </a>
            </li>
            <li>
              <a href="http://wap.koudaitong.com/v2/usercenter/136i551w3" style="
              background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/27/FloXBZIB_ZdrgWQ9RbL9_KII7vRp.jpg);
              background-size: 50px 50px
              ">
              </a>
            </li>
            <li>
              <a href="http://wap.koudaitong.com/v2/usercenter/136i551w3" style="
              background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/29/FipGucD7DSfIDx8A-5MZhNShqCj6.jpg);
              background-size: 50px 50px
              ">
              </a>
            </li>
            <li>
              <a href="tel://4007366517" style="
              background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/27/FvYYLvzwv0CJGxbWSM-jdF2NcgxB.jpg);
              background-size: 50px 50px
              ">
              </a>
            </li>
            <li>
              <a href="http://wap.koudaitong.com/v2/feature/oma5aeh1" style="
              background-image: url(http://imgqn.koudaitong.com/upload_files/2015/01/28/Fmy18MTGsvgvsYbxrRvl47g6Vbzg.jpg);
              background-size: 50px 50px
              ">
              </a>
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
      <div class="search-container hide">
        <form class="search-form" action="http://wap.koudaitong.com/v2/search"
        method="GET">
          <input type="search" class="search-input" placeholder="搜索本店所有商品" name="q"
          value="">
          <input type="hidden" name="kdt_id" value="803178">
          <a class="js-search-cancel search-cancel" href="javascript:;">
            取消
          </a>
          <span class="search-icon">
          </span>
          <span class="close-icon hide">
          </span>
        </form>
        <div class="history-wrap center">
          <ul class="history-list">
          </ul>
          <a class="tag tag-clear c-gray-darker hide" href="javascript:;">
            清除历史搜索
          </a>
        </div>
      </div>
      <div id="right-icon" class="js-right-icon no-text">
        <div class="js-right-icon-container right-icon-container clearfix" style="width: 50px;">
          <a id="global-cart" href="http://wap.koudaitong.com/v2/trade/cart?kdt_id=803178"
          class="icon hide" style="background-image: url(http://kdt-static.qiniucdn.com//v2/image/setting/shopping-cart/2x/s2.png);">
            <p class="icon-img">
            </p>
            <p class="icon-txt">
              购物车
            </p>
          </a>
          <a id="global-wish" href="http://trade.koudaitong.com/wxpay/wish?kdt_id=803178"
          class="icon">
            <p class="icon-img">
            </p>
            <p class="icon-txt">
              心愿单
            </p>
          </a>
          <a class="js-show-more-btn icon show-more-btn hide">
          </a>
        </div>
      </div>
  </body>

</html>
<script type="text/javascript" language="javascript">
//userLogin();
$(document).ready(function(){
	$(".prods").click(function(){
		getProds($(this).attr("data-goods-id"));
	});
});
function getProds(productId)
{
	 var url="/micro/product.do?method=getProduct&productId="+productId+"&busId=100";
	 var openid=getCookie("openid");
	 if(openid=='' || openid==null)
	 {
		  encodeURL(url); 
	 }
	 else
	 {
	 	 window.location.href = url+"&openId="+openid;
	 }
}

</script>
