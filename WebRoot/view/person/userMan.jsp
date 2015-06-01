<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>用户管理</title>
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
			var url;
			function newUser(){
				$('#dlg').dialog('open').dialog('setTitle','新增用户');
				$('#fm').form('clear');
				url = '/user.do?method=newUser';
			}
			function editUser(){
				var row = $('#dg').datagrid('getSelected');
				if (row){
					var classPhare = document.getElementsByName("classPhare");
					for(var i = 0,n = classPhare.length;i < n;i++)
					{
						if(row.userPriv.charAt(n-i-1) == '1')
						{
							classPhare[i].checked = true;
						}
					}
					$('#dlg').dialog('open').dialog('setTitle','修改用户');
					$('#fm').form('load',row);
					url = '/user.do?method=updateUser&userId='+row.userId;
				}
			}
			function saveUser(){
				$('#fm').form('submit',{
					url: url,
					onSubmit: function(){
						return $(this).form('validate');
					},
					success: function(result){
						var result = eval('('+result+')');
						if (result.success){
							$('#dlg').dialog('close');		
							$('#dg').datagrid('reload');	
						} else {
							$.messager.show({
								title: 'Error',
								msg: result.msg
							});
						}
					}
				});
			}
			function removeUser(){
				var row = $('#dg').datagrid('getSelected');
				if (row){
					$.messager.confirm('提示','您确定要移除当前选中用户吗?',function(r){
						if (r){
							$.post('/user.do?method=delUser',{userId:row.userId},function(result){
								if (result.success){
									$('#dg').datagrid('reload');	
								} else {
									$.messager.show({	
										title: '错误',
										msg: result.msg
									});
								}
							},'json');
						}
					});
				}
			}
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
		<table id="dg" title="人员管理" class="easyui-datagrid" width="100%" style="height:570px" url="/user.do?method=qryUserList" toolbar="#toolbar" pagination="true" rownumbers="true" fitColumns="true" singleSelect="true">
			<thead>
				<tr>
					<th field="userName" width="25%">账户名称</th>
					<th field="realName" width="25%">用户姓名</th>
					<th field="startDate" width="25%">账户生效时间</th>
					<th field="endDate" width="25%">账户失效时间</th>
				</tr>
			</thead>
		</table>
		<div id="toolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增用户</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改用户</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">删除用户</a>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:380px;height:220px;padding:10px 20px" modal="true" closed="true" buttons="#dlg-buttons">
			<form id="fm" method="post" novalidate>
				<div class="fitem">
					<label style="text-align:right">账户名称:</label>
					<input name="userName" style="width:147px" class="easyui-validatebox" required="true">
				</div>
				<div class="fitem">
					<label style="text-align:right">用户姓名:</label>
					<input name="realName" style="width:147px" class="easyui-validatebox" required="true">
				</div>
				<div class="fitem">
					<label style="text-align:right">生效时间:</label>
					<input class="easyui-datebox" name="startDate" id="startDate" data-options="formatter:myformatter,parser:myparser" />
				</div>
				<div class="fitem">
					<label style="text-align:right">失效时间:</label>
					<input class="easyui-datebox" name="endDate" id="endDate" data-options="formatter:myformatter,parser:myparser" />
				</div>
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
	</body>
</html>