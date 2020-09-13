<%--
  Created by IntelliJ IDEA.
  User: TimmyJin
  Date: 2020/9/10
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basepath%>">
    <title>MY JSP 'login.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>
<body>
    <div id="main">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
            <td height="129" align="center" background="images/shop_17.gif">
            <form name="login" method="POST" action="LoginServlet" onsubmit="return Cheak();">
            <input type="hidden" id="action" name="action" value="1"/>
                <table width="128" height="122" style="left: 0px; top: 0px;width: 60px;">
                    <%if(request.getAttribute("error")!=null){ %>

</body>
</html>
