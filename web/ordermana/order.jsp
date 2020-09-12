<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="vo.cart"%>
<%@ page import="java.util.Vector"%>
<%@ page import="dao.DBUtil"%>
<%@ page import="vo.consumer"%>
<%String username="";
username=(String)session.getAttribute("consumer");
if(username==""||username==null) {
	out.println("<script language='javascript'>alert('请先登录');window.location.href='index.jsp';</script>");
}else{Vector ct=(Vector)session.getAttribute("ct");
	if(ct==null||ct.size()==0){
		response.sendRedirect("cart-null.jsp");
	}
	}

%>
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
		
		<script type="text/iavascript">
		function check(){
		if(document.order.Truename.value=="")
{
	window.alert("真实姓名不为空！");
	window.order.Truename.focus();
	return false;
}
	if(document.order.address.value=="")
{
	window.alert("地址不为空！");
	window.order.address.focus();
	return false;
	}
	order.submit();
	}
	
	</script>
	
	</head>
	
	<body>
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td height="80" background="inages/center_checkout.gif">&nbsp;</td>
		</tr>
		<tr valign="top">
		<td height="134" align="center">
		<form name=“order” action="OrdServlet" method="post">
		<%
		String username123="";
		username123=(String)session.getAttribute("consumer");
		%>
		