<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%session.removeAttribute("ct");
response.sendRedirect("cart-null.jsp");
//request.getRequestDispatcher("cart-null.jsp").forward(request,response);
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base herf="<%=basePath%>>">

        <title>My JSP 'cart-clear.jsp' starting page</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-contro;" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <!--
        <Link rel="stylesheet"type="text/css" href="styles.css">
        -->

    </head>

    <body>

    </body>
</html>