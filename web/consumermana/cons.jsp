<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		
		<title>My JSP 'membermana.jsp' starting page</title>
		
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<!--
		<link rel="stylesheet" type="text/css"href="styles.css">
		-->
		
		</head>
		
		<body>
		<table width="92%" height="48" border="0" align="center" cellspacing="0" cellpadding="0">
<tr><a href="ConsServlet?action=1" target="middledown">个人信息修改<br/></a></tr>
<tr><a href="ConsServlet?action=4" target="middledown">购物车<br/></a></tr>
<tr><a href="ConsServlet?action=5" target="middledown">订单查询<br/></a></tr>
<tr><a href="ConsServlet?action=3" target="_parent">注销<br/></a></tr>
</table>


</body>
</html>
