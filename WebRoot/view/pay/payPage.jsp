<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.micro.pub.util.RandomStringGenerator" %>
<%@ page import="org.micro.pub.util.MD5Weixin" %>
<%
	String path = request.getContextPath();
	String appId = "wx9de1544a58642739";
	String timeStamp = String.valueOf(new Date().getTime());
	String content = "prepay_id=1228219502";
	String signType = "MD5";
	String nonceStr = RandomStringGenerator.getRandomStringByLength(32);
	String key = "ecf3b6e35cf4dddca7e589850c23e437";
	StringBuffer origin = new StringBuffer("appId=").append(appId).append("&nonceStr=").append(nonceStr).append("&package=").append(content).append("&signType=").append(signType).append("&timeStamp=").append(timeStamp).append("&key=").append(key);
	String paySign = MD5Weixin.MD5Encode(origin.toString());
%>
<!DOCTYPE html>
<html class="no-js admin" lang="zh-CN">
  	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>微信支付</title>
		<script type="text/javascript">
			function onBridgeReady(){
				alert("<%=content %>");
			    WeixinJSBridge.invoke(
			        'getBrandWCPayRequest', {
			            "appId" : "<%=appId %>",     //公众号名称，由商户传入     
			            "timeStamp":"<%=timeStamp %>",         //时间戳，自1970年以来的秒数     
			            "nonceStr" : "<%=nonceStr %>", //随机串     
			            "package" : "<%=content %>",     
			            "signType" : "<%=signType %>",         //微信签名方式:     
			            "paySign" : "<%=paySign %>" //微信签名 
			        },
			        function(res){
			            if(res.err_msg == "get_brand_wcpay_request:ok" ) {}     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
			        	alert(res.err_msg)
			        }
			    ); 
			 }
			 
			 function payFunc()
			 {
				 if(typeof WeixinJSBridge == "undefined"){
				    if( document.addEventListener ){
				        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
				    }else if (document.attachEvent){
				        document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
				        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
				    }
				 }else{
				    onBridgeReady();
				 }
			 }
		</script>
	</head>
	<body>
		<h1>测试支付</h1>
		<input type="button" onclick="payFunc()" value="测试" />
	</body>
</html>