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
		<style type="text/css">
		td{
		width:200px;
		height:25px;
		}
		.txt{
		width:180px;
		margin-left:10px;
		}
		</style>
		
		</head>
		
		<body>
		<form method="post" name="fchangeform" action="FurServlet">
		<%
		furniture f=(furniture)request.getAttribute("furchange");
		%>
		<input type="hidden" name="action" value="2"/>
		<input type="hidden" name="fid" value="<%=f.getFid() %>"/>
		<table align="center" bgcolor="#EEEEEE" style="border:1px black solid">
		<tr>
		<td colspan="3" align="center" style="text-align:center;height:40px;font-size:20px">家具资料修改</td>
		</tr>
		<tr>
		<td align="right">家具型号：</td>
		<td align="center"><%=f.getFid() %></td>
		<td></td>
		</tr>
		<tr>
		<td align="right">家具名称：：</td>
		<td align="center"><input type="text" name="fname" value="<%=f.getFname()%>" class="txt"/></td>
		<td></td>
		</tr>
		<tr>
		<td align="right">描述：</td>
		<td align="center"><input type="text" name="fsummary" value="<%=f.getFsummary()%>" class="txt"/></td>
		<td></td>
		</tr>
		<tr>
		<td align="right">剩余数量：</td>
		<td align="center"><input type="text" name="fnum" value="<%=f.getFnum()%>" class="txt"/></td>
		<td></td>
		</tr>
		<tr>
		<td align="right">单价：</td>
		<td align="center"><input type="text" name="fmoney" value="<%=f.getFmoney()%>" class="txt"/></td>
		<td></td>
		</tr>
		<tr>
		
		<td align="center"><input type="submit" value="修改"/></td>
		<td align="center"><input type="button" value="返回" onclick="JScript:history.back(-1)"/></td>
		<td></td>
		</tr>
		<tr><td colspan="3" height="40px"></td></tr>
		</table>
		</form>
		</body>
		</html>