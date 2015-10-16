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
		<title>全部商品</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="/micro/pub/css/base.css" >
		<link rel="stylesheet" href="/micro/pub/css/showcase_admin.css" >
		<link rel="stylesheet" href="/micro/pub/css/goods.css" >
		<script type="text/javascript" src="/micro/pub/js/jquery-1.11.3.min.js">
	    <script type="text/javascript" src="/micro/pub/js/jquery.cookie.js"></script>
	    <script type="text/javascript" src="/micro/pub/js/jquery.json.min.js"></script>
	    <script type="text/javascript" src="/micro/js/global.js"></script>
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
        <div class="content-sidebar" style="display:none;">
          <a href="/micro/shop.jsp"
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
              <a href="/micro/shop.jsp" style="
              background-image: url(/micro/pub/img/pic/homePic.jpg);
              background-size: 50px 50px
              ">
              </a>
            </li>
            <li>
              <a href="/micro/view/shop/user_center.jsp?busId=100" style="
              background-image: url(/micro/pub/img/pic/qryOrder.jpg);
              background-size: 50px 50px
              ">
              </a>
            </li>
            <li>
              <a href="/micro/view/shop/user_center.jsp?busId=100" style="
              background-image: url(/micro/pub/img/pic/userCenter.jpg);
              background-size: 50px 50px
              ">
              </a>
            </li>
            <li>
              <a href="tel://4007366517" style="
              background-image: url(/micro/pub/img/pic/callCustomer.jpg);
              background-size: 50px 50px
              ">
              </a>
            </li>
            <li>
              <a href="http://wap.koudaitong.com/v2/feature/oma5aeh1" style="
              background-image: url(/micro/pub/img/pic/navigator.jpg);
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
              <a href="/micro/shop.jsp"
              target="_blank">
                店铺主页
              </a>
              <a href="/micro/view/shop/user_center.jsp?busId=100"
              target="_blank">
                会员中心
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="right-icon" class="js-right-icon no-text" style="display:none">
      <div class="js-right-icon-container right-icon-container clearfix" style="width: 50px;">
        <a id="global-cart" href="/micro/cart.do?method=gotoShopCart&openid=${param.openId}&busId=${param.busId}"
        class="icon hide" style="background-image: url(/micro/pub/img/pic/s2.png);">
          <p class="icon-img">
          </p>
          <p class="icon-txt">
            购物车
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
	   		url : "/micro/product.do?method=getProds&page="+page,
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
   					//content+="<a href='javascript:void(0)' class='js-goods link clearfix' target='_blank' data-goods-id='9937870' title='"+obj.productName+"'>";  
   					content+="<div class='photo-block' style='background-color: rgb(255, 255, 255);' onclick=getProds("+obj.productId+")>";                             
   					content+="<img class='goods-photo js-goods-lazy' data-src=''src='"+obj.imgUrl+"' style='display: block;'>";                   
   					content+="</div>";                                                                                              
   					content+="<div class='info'>";                                                                          
   					content+="<p class='goods-title'>"+obj.productName+"</p>";                                                                         
   					content+="<p class='goods-price'><em style='font-style:normal;color:#ff6600'>￥"+obj.productPrice+"</em></p>";                                                             
   					content+="<div class='goods-buy btn1' >";
					content+="</div>";
					content+="<div class='js-goods-buy buy-response' onclick=addCart("+obj.productId+")></div>";
   					content+="</div>"; 
   					//content+="</a>"; 
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
   
   function addCart(productId)
   {
		var cart={"weixinId":"${param.openId}","productId":productId,"num":1};
		$.ajax({
			url:"/micro/cart.do?method=addCart",
			type:"POST",
			data:"cart="+JSON.stringify(cart),
			success:function(data){
				$("#right-icon").removeClass("hide");
				alert("已加入购物车!")
			}
		});
  }
   
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