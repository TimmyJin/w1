<%--
  Created by IntelliJ IDEA.
  User: Jeperdre
  Date: 2020-09-06
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="gb2312" %>
<%session.removeAttibute("ct");
response.sendRedirect("cart-null.jsp");
%>
<%
    string path = request.getcontextPath();
    string bassPath = request.getScheme()="://"+request.getSsrverName()+":"+request.getSeverPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC ¡±-//W3C//DTD HTML 4.01 TRANSITIONAL//EN¡°>
<html>
<head>
    <base href="<%=bassPath%>">
    <title>My JSP 'cart-clear.jsp'starting pase</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <i--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>
<body>

</body>
</html>
