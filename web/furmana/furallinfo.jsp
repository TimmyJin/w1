<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.util.List" %>
<%@ page import="vo.count" %>
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
		alert("�������ѯ����");return;
		}
		if(form1.edate.value==0){
			form1.edate.focus();
			alert("�������ֹ����");return;
			}
			form1.submit();
			}
			</script>
			
			</head>
			
			<body>
			<table width="550" border="0" cellspacing="-2" cellpadding="-2">
			<form name="form1" method="POST" action="OrdServlet">
			<input type="hidden" id="action" name="action" value="2"/>
			<tr>
			<td align="center">
			��ѡ���ѯ��������
			<input type="text" name="sdate" value="������������" size="11">
			����
			<input type="text" name="edate" value="������������" size="11">
			
			<input type="button" value="�鿴����" onclick="check()">
			</td>
			</tr>
			<div style="margin-top:20px">
			<table style="border:1px #000000 solid" width="550" border="0" cellspacing="-2" cellpadding="-2">
			<tr>
			<td align="center" width="10%">��Ʒ��</td>
			<td align="center" width="10%">������</td>
			</tr>
			<%List<count> clist=(List<count>)request.getAttribute("clist");
			String s=request.getAttribute("ssum").toString();
			int percent;
			int sum=Integer.parseInt(s);
			for(count c :clist){
			int i=c.getNum();
			percent=i*100/sum;
			%>
			<tr>
			<td align="center" width="15%"><%=c.getFname() %></td>
			<td align="center" width="25%">������Ϊ��<%= c.getNum() %>��</td>
			<td width="50%"><img src="images/shop_13.gif" width="<%=percent %>%" height="10"></td>
			<td></td>
			<td align="center" width="10%">ռ<%=percent %>%</td>
			</tr>
			<tr></tr>
			<%} %>
			<tr><td></td><td></td>
			<td align="left">��������Ϊ��<%= sum %>��</td></tr>
			</table>
			</div>
			<%@include file="page.jsp" %>
			</form>
			</table>
			</body>
			</html>