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
		<script type="text/javascript" src="/pub/js/jquery-1.11.3.min.js">
    </script>
	</head>
	  <body class=" " style="padding-bottom: 50px;">
    <div class="container ">
      <div class="header">
        <div class="headerbar">
          <div class="headerbar-wrap clearfix">
          </div>
        </div>
      </div>
      <div class="content " style="min-height: 576px;">
        <div class="content-body">
          <!-- 标题 -->
          <div>
            <div class="custom-title  text-left">
              <h2 class="title">
                全部商品
              </h2>
              <p class="sub_title">
              </p>
            </div>
          </div>
          <ul class="js-goods-list sc-goods-list clearfix list size-3" data-size="3">
            <!-- 商品区域 -->
            <!-- 展现类型判断 -->
            <div id="template"/>
            
          </ul>
          <div class="custom-paginations-container">
            <div class="custom-paginations clearfix">
              <a id="before" onclick="beforePage()" href="javascript:;" class="custom-paginations-prev disabled">
                                          上一页
              </a>
              <a id="next" onclick="nextPage()" href="javascript:;" class="custom-paginations-next js-no-follow">
             	   下一页
              </a>
              <script type="text/javascript">

              function beforePage()
              {
            	  page--;
            	  if(page<=0)
            	  {
            		  return;
            	  }
            	  if(page-1<=0)
            	  {
            		  $("#before").addClass("disabled");
            	  }
            	  $("#next").removeClass("disabled");
            	  qryProds(page);
              }
              function nextPage()
              {
            	  page++;
            	  if(page*10>count)
            	  {
            		  return;
            	  }
            	  if((page+1)*10>count)
            	  {
            		  $("#next").addClass("disabled");
            		  $("#before").removeClass("disabled");
            	  }
            	  qryProds(page);
              }
              </script>
            </div>
          </div>
        </div>
        <div class="content-sidebar">
          <a href="http://wap.koudaitong.com/v2/showcase/homepage?kdt_id=803178"
          class="link">
            <div class="sidebar-section shop-card">
              <div class="table-cell">
                <img src="./全部商品 - 华莱士炸鸡汉堡_files/Fsm23pJaMB-VvmrtOcwwv21VcIPc.jpg!60x60+2x.jpg"
                width="60" height="60" class="shop-img" alt="公众号头像">
              </div>
              <div class="table-cell">
                <p class="shop-name">
                  华莱士炸鸡汉堡
                </p>
              </div>
            </div>
          </a>
        </div>
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
            <div class="ft-links">
              <a href="http://wap.koudaitong.com/v2/showcase/homepage?kdt_id=803178"
              target="_blank">
                店铺主页
              </a>
              <a href="http://wap.koudaitong.com/v2/showcase/usercenter?kdt_id=803178"
              target="_blank">
                会员中心
              </a>
            </div>
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
<script type="text/javascript" language="JavaScript" >
   var page=1;
   var count=0;
   qryProds(page);
   function qryProds(page)
   {
	   	var obj = "";
	   	var dig = null;
	   	$.ajax({
	   		type : "POST",
	   		url : "/product.do?method=getProds&page="+page,
	   		data : obj,
	   		contentType : "application/json;charset=UTF-8",
	   		dataType : "json",
	   		beforeSend : function()
	   		{
	   		//	$(".overlay").css({ 'display': 'block', 'opacity': '0.8' }); $(".showbox").stop(true).animate({ 'margin-top': '300px', 'opacity': '1' }, 0);
	   		},
	   		success : function(data)
	   		{
	   		// $(".showbox").stop(true).animate({ 'margin-top': '250px', 'opacity': '0' }, 0); $(".overlay").css({ 'display': 'none', 'opacity': '0' });
	   			try
	   			{
	   				dig.close();
	   			}
	   			catch(e)
	   			{
	   				
	   			}
	   			var content ="";
	   			count=data.size;
	   			$.each(data.prods, function(i, obj)
	   		    {
   					content+="<li class='js-goods-card goods-card goods-list normal'>";                                                
   					content+="<a href='' class='js-goods link clearfix' target='_blank' data-goods-id='9937870' title='"+obj.productName+"'>";  
   					content+="<div class='photo-block' style='background-color: rgb(255, 255, 255);'>";                             
   					content+="<img class='goods-photo js-goods-lazy' data-src=''src='"+obj.imgUrl+"' style='display: block;'>";                   
   					content+="</div>";                                                                                              
   					content+="<div class='info'>";                                                                                    
   					content+="<p class='goods-title'>"+obj.productName+"</p>";                                                                         
   					content+="<p class='goods-price'><em>￥10.00</em></p>";                                                                               
   					content+="<div class='goods-buy btn1'></div>"; 
   					content+="</div>"; 
   					content+="</a>"; 
   					content+="</li>"; 
	   			});
	   			
	   			$("#template").html(content);
	 			//var result=data.wakeContent;
	 		//	$("#result").html(result);
	   		},
	   		error : function(data)
	   		{
	   		    $(".showbox").stop(true).animate({ 'margin-top': '250px', 'opacity': '0' }, 0); $(".overlay").css({ 'display': 'none', 'opacity': '0' });
	   			$("#template").html("暂无信息");
	   		//	$.dialog.alert(data.statusText, function(){window.location.reload(); return true;});
	   		}
   		});
   }
   </script>