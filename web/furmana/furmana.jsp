<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.DBUtil"%>
<%@ page import="vo.furniture"%>
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
		<table width="100%"height="48" border="1" cellpadding="0" cellspacing="0" bordercolor="FFFFFF">
		<tr>
		<td width="6%" height="24" align="center">商品号</td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td width="6%" height="24" align="center">名称</td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td width="20%" height="24" align="center">简介</td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td width="5%" height="24" align="center">数量</td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td width="5%" height="24" align="center">价格</td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td width="15%" height="24" align="center">图片</td><td width="2%">
		</td>
		<%
		String str=(String)request.getParameter("Page");
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
		rs.absolute((Page-1)*(pagesize+1));
		
		for(int i=1;i<=pagesize;i++){
			furniture fur=new furniture();
			fur.setFid(rs.getInt("fid"));
			fur.setFname(rs.getString("fname"));
			fur.setFsummary(rs.getString("fsummary"));
			fur.setFnum(rs.getInt("fnum"));
			fur.setFmoney(rs.getInt("fmoney"));
			fur.setFpic(rs.getString("fpic"));
			
			
		%>
		<tr>
		<td height="20" align="center"><%=fur.getFid() %></td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td align="center"><%=fur.getFname() %></td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td align="center"><%=fur.getFsummary() %></td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td align="center"><%=fur.getFnum() %></td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td align="center"><%=fur.getFmoney() %></td><td width="2%"><img src="images/shop_09.gif"
		width="3" height="57"></td>
		<td align="center"><img sec=<%out.print(fur.getFpic());%> width=60 height=80></td>
		
		<td align="lest" width="6%">
		<form method="post" name="changeform" action="FurServlet">
		<input type="hidden" name="action" id="action" value="1"/>
		<input type="hidden" name="id" value=<%=fur.getFid() %>>
		<input type="post" name="change" value="修改">
		</form></td>
		
		
		<td align="lest" width="6%">
		<form method="post" name="changeform" action="FurServlet">
		<input type="hidden" name="action" id="action" value=3>
		<input type="hidden" name="id" value=<%=fur.getFid() %>>
		<input type="submit" name="delete" value="删除"></form>
		</td>
		</tr>
		<%
		try{
		if(!rs.next()){break;}
			}catch(Exception e){}
			}
			%>
			<td align="center"><input type="button" value="添加" onclick="window.location.href='furmana/furadd.jsp'"/></td>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td align="right">当前页数：[<%=Page %>/<%=maxpage %>]&nbsp;
			<%if(Page>1){ %>
			<a href="furmana/furmana.jsp?Page=1">第一页</a><a href="furmana/furmana.jsp?Page=<%=Page-1 %>">上一页</a>
			<%}
			if(Page<maxpage){ %>
			<a href="furmana/furmana.jsp?Page=<%=Page+1 %>">下一页</a> <a href="furmana/furmana.jsp?Page=<%=maxpage %>">
			最后一页&nbsp;</a>
			<%} %>
			</td>
			</tr>
			</table>
			</body>
			</html>