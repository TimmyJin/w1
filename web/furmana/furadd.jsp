<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="vo.furniture" %>
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
		if(document.form1.fname.value==""){
		window.alert("家具名不为空！");
		window.furadd.fname.focus();
		return false;
		}
		if(document.form1.fsummary.value==""){
		window.alert("请输入商品简介！");
		window.furadd.fsummary.focus();
		return false;
		}
		if(isNaN(form1.fmoney.value))
		{
		alert("商品定价错误！");
		document.form1.fmoney.value="";
		document.form1.fmoney.focus();
		return false;
		}
		if(document.form1.fpic.value=="")
		{
		alert("请输入图片文件的路径！");
		document.form1.fpic.focus();
		return false;
		}
		form1.submit();
		}
		</script>
		
		
		</head>
		
		<body>
		<form method="post" name="form1" action="FurServlet">
		<input type="hidden" name="action" id="action" value= "4" />
		<table align=center border=0 width=80% cellspacing=2 cellpadding=0 height=400>
		<tr>
		<img src="images/manage_center_goodsadd.gif" width="100%" height="128">
		</tr>
		<tr>
		<td align=right width=40%>家具名：</td>
		<td colspan=2 width=70%><input type="text" name="fname"></td>
		</tr>
		<tr>
		<td align=right width=40%>简介：</td>
		<td colspan=2 width=70%><input type="text" name="fsummary"></td>
		</tr>
		<tr>
		<td align=right width=40%>价格：</td>
		<td colspan=2 width=70%><input type="text" name="fmoney"></td>
		</tr>
		<tr>
		<td align=right width=40%>图片：</td>
		<td colspan=2 width=70%><input type="text" name="fpic"></td>
		</tr>
		<tr>
		<td align=left>&nbsp;</td>
		<td align=left colspan=2><input type=button value="添加" onclick="check()">
		<input type="button"value="返回" onclick="JScript:history.back(-1)"/>
		</td>
		
		</tr>
		</table>
		</form>
		
		</body>
		</html>
		