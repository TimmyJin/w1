<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.DBUtil"%>
<%@ page import="vo.order"%>
<%
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
		<table width="100%"height="48" border="1"  cellpadding="0" cellspacing="0" bordercolor="FFFFFF">
		<tr>
		<img src="images/manage_center_orderlist.gif" width="100%" heigh="156">
		</tr>
		<tr>
		<td width="10%"  height="24" align="center">������</td>
		<td width="10%"  height="24" align="center">Ʒ����</td>
		<td width="10%"  height="24" align="center">��ʵ����</td>
		<td width="35%"  height="24" align="center">��ַ</td>
		<td width="25%"  height="24" align="center">��ע</td>
		<td width="10%"  height="24" align="center">ִ��</td>
		</tr>
		<%
		String username="";
			username=(String)session.getAttribute("consumer");
			if(username==""||username==null){
				out.println("<script language='javascript'>alert('���ȵ�¼��');window.location.href='index1.jsp';</script>");
				}else{
				DBUtil conn=new DBUtil();
				ResultSet rs=conn.executeQuery("select* form oorder where username'"+username+"'");
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
					rs.absolute((Page-1)*(pagesize+1));
					
					for(int i=1;i<=pagesize;i++){
						order ord=new order();
						ord.setOrderID(rs.getInt("orderID"));
						ord.setBnumber(rs.getInt("bnumber"));
						ord.setTruename(rs.getString("Truename"));
						ord.setAddress(rs.getString("address"));
						ord.setBz(rs.getString("bz"));
						ord.setEnforce(rs.getInt("enforce"));
						%>
						<tr>
						<td height="20" align="center"><%=ord.getOrderID()%></td>
						<td align="center"><%=ord.getBnumber()%></td>
						<td align="center"><%=ord.getTruename()%></td>
						<td align="center"><%=ord.getAddress()%></td>
						<td align="center"><%=ord.getBz()%></td>
						<td align="center"><%if (ord.getEnforce()==0){%>
						δִ��
						<%}else{%>��ִ��<%} %></td>
						
						</tr>
						<%
							try{
								if(!rs.next()){break;}
							}catch(Exception e){}
					}
					%>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
					<td align="right">��ǰҳ��:[<%=Page%>/<%=maxpage%>]&nbsp;
					<%if(Page>1){%>
					<a href="ordermana/order_user.jsp?Page=1">��һҳ</a><a href="ordermana/order_user.jsp?Page=<%=Page-1%>">
					��һҳ</a>
					<%}
					if(Page<maxpage){%>
					<a href="ordermana/order_user.jsp?Page=<%=Page+1%>">��һҳ</a>
					<a href="ordermana/order_user.jsp?Page=<%=maxpage%>">���һҳ&nbsp;</a>
					<%} }%>
					</td>
					</tr>
					</table>
					
					</body>
					</html>