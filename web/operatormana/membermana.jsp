<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.DBUtil"%>
<%@ page import="vo.consumer"%>
<% DBUtil conn=new DBUtil();
	ResultSet rs=conn.executeQuery("select*form consumer");
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
		
		</head>
		
		<body>
		<table width="600"height="100" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
		<tr>
		<td valign="top" background="inages/manage_center_memberlist.gif">
		<table width="100%" height="36" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="98%" align="right">&nbsp;</td>
			<td width="2%">&nbsp;</td>
			<td>
		</table>
		</td>
		</tr>
		<table width="600" align="center"height="48"border="1"cellpadding="0"cellspacing="0"
		bordercolor="#FFFFFF"bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
		<tr>
			<td width="50"height="27"align="center">用户名</td>
			<td width="150" align="center">密码</td>
			<td width="150" align="center">电话</td>
			<td width="100" align="center">金额</td>
		</tr>
		<%
	String str=(String)request.getParameter("page");
		if(str==null){
			str="0";
		}
		int pagesize=7;
		rs.last();
		int RecordCount=rs.getRow();
		rs.first();
		int maxpage=0;
		maxpage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);
		int Page=Integer.parseInt(str);
		if(Page<1){
			Page=1;
		}
		else{
			if(Page>maxpage){
				Page=maxpage;
			}
		}
		rs.absolute((Page-1)*pagesize+1);
		for(int i=1;i<=pagesize;i++){
			consumer con=new consumer();
			con.setCname(rs.getString("cname"));
			con.setCpassword(rs.getString("cpassword"));
			con.setCtel(rs.getString("ctel"));
			con.setCmoney(rs.getInt("cmoney"));
		%>
		<tr style="padding:5px;">
		<td align="center"><%con.getCname(); %></td>
		<td align="center"><%con.getCpassword();%></td>
		<td align="center"><%con.getCtel();%></td>
		<td align="center"><%con.getCmoney(); %></td>
		
		<td align="left" width="6%">
		<form method="post" name="deleteform"action="OperServlet">
		<input type="hidden" name="action" id="action"value=6>
		<input type="hidden" name="cname" value=<%=con.getCname()%>>
		<input type="submit" name="delete" value="删除"></form>
		</td>
		</tr>
		
		<%
		try{
		if(!rs.next()){break;}	
		}catch(Exception e){}
		}
		%>
		</table>
		<table width="100%" border="0"cellspacing="0"cellpadding="0">
		<tr>
		<td align="right">当前页数：[<%=Page%>/<%=maxpage %>]&nbsp;
		<%if(Page>1){ %>
		<a href="index.jsp?Page=1">第一页</a><a href="index.jsp?Page=<%=Page-1%>">上一页</a>
		<%}
		if(Page<maxpage){%>
		<a href="index.jsp?Page=<%=Page+1%>">下一页</a><a href="index.jsp?Page=<%=maxpage%>">最后一页&nbsp;</a>
		<%}%>
		</td>
		</tr>
		</table>
		</table>
		</body>
		</html>
		
			
			