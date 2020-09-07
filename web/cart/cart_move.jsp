<%--
  Created by IntelliJ IDEA.
  User: Jeperdre
  Date: 2020-09-06
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="gb2312" %>
    <%@page import="java.util.*" %>
<%@page import="vo.cart" %>
<%
    Vector ct=(Vector)session.getAttribute("ct");
    try{
    int id=Integer.parseInt(request.getParameter("ID"));
    ct.removeElementAt(id);
    session.setAttribute("ct",ct);
    response.sendRedirect("cart-seel.jsp");
    }catch (Exception e){}
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
