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
		
		
		<script language="javascript">
		function check(){
		if(form1.sdate.value==0){
		form1.sdate.focus();
		alert("请输入查询日期");return false;
		}
		if(form1.edate.value==0){
			form1.edate.focus();
			alert("请输入截止日期");return false;
			}
			form1.submit();
			}
			</script>
			</head>
			
			<body>
			<form method="post" name="form1" action="OrdServlet">
			<input type="hidden" name="action" value="2"/>
			<table width="100%" border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
			<tr height=100px>
			<td width=140px></td>
			<td width=200px></td>
			<td width=200px></td>
			</tr>
			<tr>
			<td align="center">
			请选择查询条件：从
			<input type="text" name="sdate" value="" size="11">
			至：
			<input type="text" name="edate" value="" size="11">
			</td>
			<td width=200px>
			<input type=button value="查询" onclick="check()">
			
			</td>
			</tr>
			</table>
			</form>
			</body>
			</html>
		