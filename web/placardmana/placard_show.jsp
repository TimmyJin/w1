<%--
  Created by IntelliJ IDEA.
  User: TimmyJin
  Date: 2020/9/11
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBUtil.*" %>
<%@ page import="dao.DBUtil" %>
<%
    DBUtil conn = new DBUtil();
    ResultSet rs = conn.executeQuery("select * from placard order by ID desc limit 0,5");
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>My JSP 'placard_detail.jsp' starting page</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="this is my page">
        <!--
        <link rel="stylesheet" type="test/css" herf="styles.css">
        -->
    </head>
    <body>
    <table width= "100%" height= "155"border= "e"cellpadding="0" cellspacing="e">
    <tr>
        <td><img src= "images/shop_22.gif" width= "182" height= "58"></td>
    </tr>
    <tr>
        <td height="97" align= "center" valign= "top" class= "tableBorder_l">
            <table width= "88%"border="0" cellspacing= "0" cellpadding="0">
                <%
                int ID=0;
                String title="";
                while(rs.next()){
                ID=rs.getInt(1);
                title=rs.getString(2);
                %>
    <tr>
        <td height= "24" class= "tableBorder_T_.dashed">
            ka href= "PlacardServlet ?action=2&ID=<%=ID %>¡±target= "middledown "><%=title%></a>
        </td>
    </tr>
    <%
        }%>
    </table>
    </td>
    </tr>
    </table>

    </body>
</html>
