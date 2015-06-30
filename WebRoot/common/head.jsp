<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link href="<%=path %>/pub/js/easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path %>/pub/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/pub/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=path %>/pub/js/jquery.json.min.js"></script>
<script type="text/javascript" src="<%=path %>/pub/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/pub/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<%@ include file="theme.jsp" %>
<style type="text/css">
	.txtNode{
		color:#000000;
		text-decoration:none !important;
		display:block;
		width:250px;
	}
	.txtNode:HOVER{
		text-decoration: none;
	}
	.tree-node-selected{
		background-color:#cccccc !important;
		color:#0081c2 !important;
	}
</style>