<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>待确定</title>
		<%@ include file="/common/head.jsp" %>
		<%@ include file="/common/formvalidator.jsp" %>
		<style type="text/css">
			#fm{
				margin:0;
				padding:10px 30px;
			}
			.ftitle{
				font-size:14px;
				font-weight:bold;
				color:#666;
				padding:5px 0;
				margin-bottom:10px;
				border-bottom:1px solid #ccc;
			}
			.fitem{
				margin-bottom:5px;
			}
			.fitem label{
				display:inline-block;
				width:80px;
			}
		</style>
		<script type="text/javascript">
			function showOrder(){
				var row = $('#dg').datagrid('getSelected');
				if (row){
					$('#dlg').dialog('open').dialog('setTitle','订单'+row.orderId+'明细');
					$("#dgDetail").datagrid({url:"/micro/order.do?method=getOrderDetailInfo&orderId="+row.orderId});	
					$('#dgDetail').datagrid('reload');
				}
			}
			function cancelOrder(){
				var row = $('#dg').datagrid('getSelected');
				if (row){
					$.messager.confirm('提示','您确定要取消当前选中订单吗?',function(r){
						if (r){
							$.post('/micro/order.do?method=cancelOrder',{orderId:row.orderId},function(result){
								if (result == "success"){
									$('#dg').datagrid('reload');	
								} else {
									$.messager.show({	
										title: '错误',
										msg: "订单取消失败"
									});
								}
							});
						}
					});
				}
			}
			$(document).ready(function(){
				$("#dg").datagrid({
					onDblClickRow:function(rowIndex, rowData){
						$("#showOrder").dialog('open').dialog('setTitle','订单详情');
						$('#fm').form('load',rowData);
					}
				})
			});
			function myformatter(date) {
				var y = date.getFullYear();
				var m = date.getMonth() + 1;
				var d = date.getDate();
				return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
			}
			function myparser(s) {
				if (!s)
					return new Date();
				var ss = (s.split('-'));
				var y = parseInt(ss[0], 10);
				var m = parseInt(ss[1], 10);
				var d = parseInt(ss[2], 10);
				if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
					return new Date(y, m - 1, d);
				}else{
					return new Date();
				}
			}
		</script>
	</head>
	<body>
		<table id="dg" title="待付款订单" class="easyui-datagrid" width="100%" style="height:570px" url="<%=path %>/order.do?method=getOrderList&orderType=A" toolbar="#toolbar" pagination="true" rownumbers="true" fitColumns="true" singleSelect="true">
			<thead>
				<tr>
					<th field="orderId" width="10%">订单号</th>
					<th field="customerName" width="10%">客户名称</th>
					<th field="telephone" width="10%">客户电话</th>
					<th field="customerAddress" width="10%">客户地址</th>
					<th field="orderPrice" width="10%">订单价格</th>
					<th field="stsName" width="10%">订单状态</th>
					<th field="busDetailName" width="10%">店铺名称</th>
					<th field="busAddr" width="10%">店铺地址</th>
					<th field="createDate" width="10%">下单时间</th>
					<th field="stateDate" width="10%">订单状态时间</th>
				</tr>
			</thead>
		</table>
		<div id="toolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="showOrder()">查看订单明细</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="cancelOrder()">取消订单</a>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:650px;height:400px;padding:0 0" modal="true" closed="true" buttons="#dlg-buttons">
			<table id="dgDetail" title="" class="easyui-datagrid" width="636px" style="height:326px" url="#" pagination="true" rownumbers="true" fitColumns="true" singleSelect="true">
				<thead>
					<tr>
						<th field="productName" width="32%">餐名</th>
						<th field="productPrice" width="32%">单价</th>
						<th field="productNum" width="32%">数量</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="dlg-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="javascript:$('#dlg').dialog('close')">确定</a>
		</div>
		<div id="showOrder" class="easyui-dialog" style="width:450px;height:325px;padding:0 0" modal="true" closed="true" buttons="#showOrder-buttons">
			<form id="fm" method="post" novalidate>
				<div style="height:100%;width:100%">
					<div class="fitem">
						<label style="text-align:right">订&nbsp;&nbsp;单&nbsp;&nbsp;号:</label>
						<input name="orderId" id="orderId" type="text" style="width:250px" readonly="readonly"/>
					</div>
					<div class="fitem">
						<label style="text-align:right">客户名称:</label>
						<input name="customerName" id="customerName" type="text" style="width:250px" readonly="readonly"/>
					</div>
					<div class="fitem">
						<label style="text-align:right">客户电话:</label>
						<input name="telephone" id="telephone" type="text" style="width:250px" readonly="readonly"/>
					</div>
					<div class="fitem">
						<label style="text-align:right">客户地址:</label>
						<input name="customerAddress" id="customerAddress" type="text" style="width:250px" readonly="readonly"/>
					</div>
					<div class="fitem">
						<label style="text-align:right">订单价格:</label>
						<input name="orderPrice" id="orderPrice" type="text" style="width:250px" readonly="readonly"/>
					</div>
					<div class="fitem">
						<label style="text-align:right">订单状态:</label>
						<input name="stsName" id="stsName" type="text" style="width:250px" readonly="readonly"/>
					</div>
					<div class="fitem">
						<label style="text-align:right">店铺名称:</label>
						<input name="busDetailName" id="busDetailName" type="text" style="width:250px" readonly="readonly"/>
					</div>
					<div class="fitem">
						<label style="text-align:right">店铺地址:</label>
						<input name="busAddr" id="busAddr" type="text" style="width:250px" readonly="readonly"/>
					</div>
					<div class="fitem">
						<label style="text-align:right">下单时间:</label>
						<input name="createDate" id="createDate" type="text" style="width:250px" readonly="readonly"/>
					</div>
					<div class="fitem">
						<label style="text-align:right">订单状态时间:</label>
						<input name="stateDate" id="stateDate" type="text" style="width:250px" readonly="readonly"/>
					</div>
				</div>
			</form>
		</div>
		<div id="showOrder-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="javascript:$('#showOrder').dialog('close')">确定</a>
		</div>
	</body>
</html>