<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String phone =(String) request.getAttribute("telephone");
%>
<!DOCTYPE html><html class="no-js " lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
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
    <script type="text/javascript" src="/pub/js/jquery-1.11.3.min.js">
    <title>购物车</title>

    <script src="购物车_files/hm.js"></script><script>
    var _global = {"kdt_id":"803178","user_id":0,"run_mode":"online","debug":false,"project":"default","online_debug":false,"js":{"js_compress":true,"css_compress":true,"use_js_cdn":true,"use_css_cdn":true,"message_report":true,"checkbrowser":true,"hide_wx_nav":true,"qn_public":"kdt_img","qn_private":"kdt-private"},"query_path":"\/trade\/cart","query_key":"source=weixin11&kdt_id=803178&spm=h801336_sc801118_fake803178","real_query_path":"get:\/trade\/cart\/index.html","module":"trade","controller":"Trade_Cart_Controller","action":"index","full_action":"getIndexHtml","method":"get","format":"html","platform":"mobile","is_mobile":true,"authorize":"unknown","platform_version":"","mobile_system":"android","isFromShare":false,"page_size":320,"isShopDomain":false,"share":{"notShare":true},"jsBradgeSupport":true,"wuxi1_0_0":false,"source":"","track":"","nobody":"9aluue88uttl8g9khnnuh14gr4","mp_changed":false,"team_certificate":true,"is_secured_transactions":0,"hide_shopping_cart":0,"mp_data":{"logo":"http:\/\/imgqn.koudaitong.com\/upload_files\/2015\/01\/15\/Fsm23pJaMB-VvmrtOcwwv21VcIPc.jpg","team_name":"\u534e\u83b1\u58eb\u70b8\u9e21\u6c49\u5821","intro":"\u534e\u83b1\u58eb\u70b8\u9e21\u6c49\u5821\u5e97","is_display_footbar":"1","is_display_suffix_name":"1","suffix_name":"\u534e\u83b1\u58eb\u70b8\u9e21\u6c49\u5821","shopping_cart_style":"2","team_type":"youzan","team_physical":0},"wxpay_big":false,"alipay_env":true,"wxpay_env":false,"wxaddress_env":false,"is_owner_team":false,"weixin_jssdk_use":0,"fans_id":0,"is_fans":2,"fans_nickname":"","fans_type":0,"fans_token":"","mp_id":0,"fans_picture":"","proxy_fans_id":0,"youzan_fans_id":0,"youzan_fans_nickname":"","youzan_fans_picture":"","no_user_login":false,"buyer_id":"6167813","change_password_url":"","buyer":{"id":"6167813","phone":"18907181648","nick_name":"Lapland_Alone","avatar":"http:\/\/imgqn.koudaitong.com\/upload_files\/avatar.png"},"open_token":[],"directSeller":{"seller":"","is_display_directseller_button":false},"spm":{"logType":"sc","logId":"803178"},"url":{"base":"http:\/\/koudaitong.com","bbs":"http:\/\/bbs.youzan.com","cdn":"http:\/\/kdt-static.qiniucdn.com\/","cdn_static":"http:\/\/kdt-static.qiniucdn.com\/v2","cp":"http:\/\/cp.koudaitong.com","daxue":"http:\/\/xt.youzan.com","fenxiao":"http:\/\/fx.youzan.com","fuwu":"http:\/\/fuwu.youzan.com","img":"http:\/\/img.koudaitong.com","imgqn":"http:\/\/imgqn.koudaitong.com","login":"http:\/\/login.youzan.com","open":"\/\/open.koudaitong.com","static":"http:\/\/static.koudaitong.com\/v2","trade":"http:\/\/trade.koudaitong.com","v1":"http:\/\/koudaitong.com\/v1","v1_static":"http:\/\/static.koudaitong.com\/v1","v2":"http:\/\/koudaitong.com\/v2","wap":"http:\/\/wap.koudaitong.com\/v2","ws":"ws:\/\/im.koudaitong.com:83","www":"http:\/\/koudaitong.com\/v2","youzan":"http:\/\/youzan.com","matrix":"http:\/\/cp.qima-inc.com"}};        function _cdnFallback(n){if(!_cdnFb){var i=n.src;(new Image).src="//tj.koudaitong.com/1.gif?net_error=1&fileurl="+i,-1===window.location.href.indexOf("fenxiao/active/index")&&(motify.error("啊哦，有东西加载失败了，刷新下试试~"),_cdnFb=!0)}}function onReady(n,i){if(i){var o=function(){window[n]?i():setTimeout(function(){o(n,i)},1e3)};o(n,i)}}window.motify=window.motify||{},window.motify.error=function(n){document.body.insertAdjacentHTML("afterbegin",'<div class="common-error-tips c-red clearfix font-size-12"><a class="btn btn-white pull-right" onclick="location.reload();">刷新</a><p>'+n+"</p></div>")};var _cdnFb=!1;
</script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="stylesheet" href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/base_2ced031129.css"
    onerror="_cdnFallback(this)">
    <link rel="stylesheet" href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/projects/uc/order_list_50b8447040.css"
    onerror="_cdnFallback(this)">
    <link rel="stylesheet" href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/base_2ced031129.css"
    onerror="_cdnFallback(this)">
    <link rel="stylesheet" href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/projects/trade_626cf27050.css"
    onerror="_cdnFallback(this)">
    <link rel="stylesheet" href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/pages/trade/cart_579e7a1291.css"
    onerror="_cdnFallback(this)">
    
 </head>

<body class=" body-fixed-bottom">

    
    <div class="container ">
                <div class="content clearfix">
	
<div class="tabber  tabber-n3 tabber-double-11 clearfix">
	<a class="active" href="http://wap.koudaitong.com/v2/trade/cart?source=weixin11&amp;kdt_id=803178">购物车</a>
    <a class="" href="http://wap.koudaitong.com/v2/trade/record/index?source=weixin11&amp;kdt_id=803178">购物记录</a>
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
		
		
		<div class="js-bottom-opts bottom-fix" style="padding:0;">
			<div class="bottom-cart clear-fix">
				<div class="select-all checked"><span onclick="selectAll()" id="allselect" class="check"></span>全选</div>
				<div class="total-price">合计：<span id="totalPrice" class="js-total-price">0</span>元</div>
				<button id='pay' onclick="pay()" href="javascript:;" class="js-go-pay btn btn-orange-dark font-size-14">结算</button>
				<button id='deleteProd' onclick="deleteProd() " href="javascript:;" class="j-delete-goods btn font-size-14 btn-red hide" disabled="true">删除</button>
			</div>
		</div>
	</div>
	</div>        <div class="footer">
        <textarea id="footer-delay" style="display:none;">	&lt;div class="footer"&gt;
	    &lt;div class="copyright"&gt;
	    &lt;div class="ft-copyright"&gt;
    &lt;a href="http://m.youzan.com" target="_blank"&gt;有赞微商城提供技术支持&lt;/a&gt;
&lt;/div&gt;
	    &lt;/div&gt;
	&lt;/div&gt;
</textarea>    	<div class="footer">
	    <div class="copyright">
	    <div class="ft-copyright">
    <a href="http://m.youzan.com/" target="_blank">有赞微商城提供技术支持</a>
</div>
	    </div>
	</div>
</div>    </div>

    
</body></html>

<script type="text/javascript" language="JavaScript">

 var prodsNum=0;
 var prodsCount=0;
 var prodsArray;
 // qryProds("", "18907181648");

 function pay()
 {
	 
 }
 
 function deleteProd()
 {
	 for(var i=0;i<prodsArray.length;i++)
     {
		var id= prodsArray[i].productId;
	 	if($("#div"+id).attr("choose")=='true')
	 	{
	 		$("#li"+id).addClass("hide");
	 	}
     }
 }
 
 function edit()
 {
	 if( $("#edit").html()=="编辑")
	 {
		 for(var i=0;i<prodsArray.length;i++)
	     {
			 $("#tradeNumDiv"+prodsArray[i].productId).addClass("hide");
			 $("#editNum"+prodsArray[i].productId).removeClass("hide");
	     }
		 $("#deleteProd").removeClass("hide");
		 $("#pay").addClass("hide");
		 $("#edit").html("完成");
	 }else
     {
    	 for(var i=0;i<prodsArray.length;i++)
         {
    		var id= prodsArray[i].productId;
    		 $("#tradeNumDiv"+id).removeClass("hide");
    		 $("#editNum"+id).addClass("hide");
    		 $("#tradeNum"+id).html($("#prodNum"+id).val());
         }
    	 $("#deleteProd").addClass("hide");
    	 $("#pay").removeClass("hide");
		 $("#edit").html("编辑");
     }
 }
 
  function qryProds(id, telephone) {
    var obj = "";
    var dig = null;
    $.ajax({
      type: "POST",
      url: "/product.do?method=getCartProds&id=" + id + "&telephone=" + telephone,
      data: obj,
      contentType: "application/json;charset=UTF-8",
      dataType: "json",
      beforeSend: function() {
        //	$(".overlay").css({ 'display': 'block', 'opacity': '0.8' }); $(".showbox").stop(true).animate({ 'margin-top': '300px', 'opacity': '1' }, 0);
      },
      success: function(data) {
        // $(".showbox").stop(true).animate({ 'margin-top': '250px', 'opacity': '0' }, 0); $(".overlay").css({ 'display': 'none', 'opacity': '0' });
        try {
          dig.close();
        } catch(e) {

}
        var content = "";
        count = data.size;
       
        $.each(data.prods,
        function(i, obj) {
          content += "";
          content += "<div class='block-item name-card name-card-3col clearfix'>";
          content += "<span id='div"+obj.productId+"' choose='false'  onclick=chooseProd("+obj.productId+","+obj.productPrice+") class='check'></span>";
          content += "<a href='' class='thumb'>";
          content += "<img class='goods-photo' src='" + obj.imgUrl + "'>";
          content += "</a>";
          content += "<div class='detail'>";
          content += "<a href=''><h3>" + obj.productName + "</h3></a>";
          content += "</div>";
          content += "<div class='right-col'>";
          content += "<div class='price'>￥<span>"+obj.productPrice+"</span></div>";
          content += "<div class='num'>";
          content += "<span class='num-txt'>1</span>";
          content += "</div>";
          content += "</div>";
          content += "</div>";
          content += "</div>";
        });

        $("#template").html(content);
        //var result=data.wakeContent;
        //	$("#result").html(result);
      },
      error: function(data) {
        $(".showbox").stop(true).animate({
          'margin-top': '250px',
          'opacity': '0'
        },
        0);
        $(".overlay").css({
          'display': 'none',
          'opacity': '0'
        });
        $("#template").html("暂无信息");
        //	$.dialog.alert(data.statusText, function(){window.location.reload(); return true;});
      }
    });
  }
  
  function chooseProd(id,price)
  {
	  var oldTotal=Number($("#totalPrice").html());
	  var choose= $("#div"+id).attr("choose");
	  var priceNum=Number(price);
	 
	  if(choose=='true')
	  {
		  $("#totalPrice").html(oldTotal-priceNum); 
		  $("#div"+id).attr("choose",'false');
		  $("#div"+id).removeClass("checked");
		  prodsCount--;
	  }else
	  {
		  $("#totalPrice").html(oldTotal+priceNum);  
		  $("#div"+id).attr("choose",'true');
		  $("#div"+id).addClass("checked");
		  prodsCount++;
	  }
	 
	  if(prodsCount==prodsNum)
	  {
		  $("#allselect").addClass("checked");
	  }else
	  {
		  $("#allselect").removeClass("checked");
	  }
  }
  
  function addNum(id)
  {
	var num=$("#prodNum"+id).val();
	var numInt=Number(num);
	$("#prodNum"+id).val(++numInt);
  }
  
  function deleteNum(id)
  {
	 	var num=$("#prodNum"+id).val();
		var numInt=Number(num);
		var n=--numInt;
		if(n==0)
		{
			return;
		}
		$("#prodNum"+id).val(numInt);
  }
  
  qryCartProds("", <%=phone%>);

  function qryCartProds(id, telephone) {
    var obj = "";
    var dig = null;
    $.ajax({
      type: "POST",
      url: "/product.do?method=getCartProds&id=" + id + "&telephone=" + telephone,
      data: obj,
      contentType: "application/json;charset=UTF-8",
      dataType: "json",
      beforeSend: function() {
        //	$(".overlay").css({ 'display': 'block', 'opacity': '0.8' }); $(".showbox").stop(true).animate({ 'margin-top': '300px', 'opacity': '1' }, 0);
      },
      success: function(data) {
        // $(".showbox").stop(true).animate({ 'margin-top': '250px', 'opacity': '0' }, 0); $(".overlay").css({ 'display': 'none', 'opacity': '0' });
        try {
          dig.close();
        } catch(e) {

}
        var content = "";
        count = data.size;
        prodsNum=data.size;
        prodsArray=data.prods;
        $.each(data.prods,
        function(i, obj) {
        	content+="<li id='li"+obj.productId+"' class='block-item block-item-cart relative clearfix'>";
        	content+="<div class='check-container'>"; 
        	content+="<span id='div"+obj.productId+"' choose='false'  onclick=chooseProd("+obj.productId+","+obj.productPrice+") class='check'>"; 
        	content+="</span>"; 
        	content+="</div>"; 
        	content+="<div class='name-card name-card-3col clearfix'>"; 
        	content+="<a href='http://wap.koudaitong.com/v2/showcase/goods?alias=jnknohil' class='thumb'>"; 
        	content+="<img src='"+obj.imgUrl+"'>"; 
        	content+="</a>"; 
        	content+="<div class='detail'>"; 
        	content+="<a href='http://wap.koudaitong.com/v2/showcase/goods?alias=jnknohil'>"; 
        	content+="<h3 class='js-ellipsis' style='height: 32px; overflow: hidden;'>"; 
        	content+="<i>"; 
        	content+=obj.productName; 
        	content+="</i>"; 
        	content+="</h3>"; 
        	content+="</a>"; 
        	content+="<p class='ellipsis'>"; 
        	content+="</p>"; 
        	content+="</div>"; 
        	content+="<div class='right-col price-num'>"; 
        	content+="<div class='price'>"; 
        	content+="￥"; 
        	content+="<span>"; 
        	content+=obj.productPrice; 
        	content+="</span>"; 
        	content+="</div>";
        	 
        	content+="<div id='tradeNumDiv"+obj.productId+"' class='num'>"; 
        	content+="×"; 
        	content+="<span id='tradeNum"+obj.productId+"' class='num-txt'>"; 
        	content+="1"; 
        	content+="</span>"; 
        	content+="</div>"; 
        	 
        	content+="<div id='editNum"+obj.productId+"' class='num hide'>";
        	content+="<div class='quantity'>";
        	content+="<button class='minus' type='button' >";
        	content+="</button>";
        	content+="<input id='prodNum"+obj.productId+"' type='text' class='txt' value='1'>";
        	content+="<button class='plus' type='button'>";
        	content+="</button>";
        	content+="<div id='deleteNum"+obj.productId+"' onclick=deleteNum("+obj.productId+") class='response-area response-area-minus'>";
        	content+="</div>";
        	content+="<div id='addNum"+obj.productId+"' onclick=addNum("+obj.productId+") class='response-area response-area-plus'>";
        	content+="</div>";
        	content+="<div class='txtCover'>";
        	content+="</div>";
        	content+="</div>";
        	content+="</div>";
        	
        	content+="<div class='error-box'>"; 
        	content+="</div>"; 
        	content+="</div>"; 
        	content+="</div>"; 
        	content+="<div class='delete-btn'> "; 
        	content+="<span>"; 
        	content+="删除"; 
        	content+="</span>"; 
        	content+="</div>"; 
        	content+="</li>"; 
        });

        $("#template").html(content);
        //var result=data.wakeContent;
        //	$("#result").html(result);
      },
      error: function(data) {
        $(".showbox").stop(true).animate({
          'margin-top': '250px',
          'opacity': '0'
        },
        0);
        $(".overlay").css({
          'display': 'none',
          'opacity': '0'
        });
        $("#template").html("暂无信息");
        //	$.dialog.alert(data.statusText, function(){window.location.reload(); return true;});
      }
    });
  }
  function selectAll()
  {
	 var total=0;
	 if(!$("#allselect").hasClass("checked"))
     {
		 for(var i=0;i<prodsArray.length;i++)
	     {
			  var price=Number(prodsArray[i].productPrice);
			  total=price+total;
			  $("#div"+prodsArray[i].productId).addClass("checked");
	     } 
		  $("#totalPrice").html(total); 
		  $("#allselect").addClass("checked");
     }else
   	 {
    	 for(var i=0;i<prodsArray.length;i++)
	     {
			 $("#div"+prodsArray[i].productId).removeClass("checked");
	     } 
    	  $("#totalPrice").html(0); 
    	 $("#allselect").removeClass("checked");
   	 }
	
	 
  }
</script>