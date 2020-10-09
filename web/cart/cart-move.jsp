<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.cart"%>
<%
    Vector ct=(Vector)session.getAttribute("ct");
    try{
    int id=Integer.parseInt(request.getParameter("ID"));
    ct.removeElementAt(id);
    session.setAttribute("ct",ct);
    //request.getRequestDispatcher("cart-see.jsp").forward(request,response);
    response.sendRedirect("cart-see1.jsp");
    }catch(Exception e){}
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>My JSP 'cart-move.jsp' starting page</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <!--
        <link rel="stylesheet"type="text/css"href="styles.css">
        -->
    </head>
    <body>
    </body>>
</html>
