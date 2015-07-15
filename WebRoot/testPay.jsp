<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String openId =(String) request.getAttribute("openid");
%>
<!DOCTYPE html>
<html class="no-js admin" lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>My JSP 'testPay.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="/micro/pub/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/micro/pub/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="/micro/pub/js/jquery.json.min.js"></script>
    <script type="text/javascript" src="/micro/js/global.js"></script>
    <script type="text/javascript">
	  init();
	  function init()
	  {
		 //setCookie("openid","oLsjhsuYDJZMpNK0jt09X8Wtt5DY"); 
	  	 var url="/micro/oauth.do?method=getCode&page=testPay";
	  	 var openid=getCookie("openid");
	  	 var id='<%=openId%>';
	  	 if((openid=='' || openid==null || openid=='null') && (id=='' || id==null || id=='null'))
	  	 {
	  		  encodeURL(url); 
	  	 }
	  	 if(id!='' && id!=null && id!='null')
	  	 {
	  		 setCookie("openid",id); 
	  	 }
	  }
	  $(document).ready(function(){
	  	 var out_trade_no = document.getElementById("out_trade_no");
	  	 out_trade_no.value = "test"+new Date().getTime();
	  })
	</script>
  </head>
  
  <body>
    <form action="/micro/pay/payUnifiedorder.do" method="post">
    	<input type="hidden" id="openid" name="openid" value="<%=openId%>" />
    	<table>
    		<tr>
    			<td>商品描述*</td>
    			<td><input type="text" id="body" name="body" value="测试商品" /></td>
    		</tr>
    		<tr>
    			<td>商品详情</td>
    			<td><input type="text" id="detail" name="detail" value="测试商品详情" /></td>
    		</tr>
    		<tr>
    			<td>商户订单号*</td>
    			<td><input type="text" id="out_trade_no" name="out_trade_no" value="" /></td>
    		</tr>
    		<tr>
    			<td>总金额*</td>
    			<td><input type="text" id="total_fee" name="total_fee" value="1" /></td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<input type="submit" value="测试一把" />
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
