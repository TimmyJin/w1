<%--
  Created by IntelliJ IDEA.
  User: TimmyJin
  Date: 2020/9/10
  Time: 14:28
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
    <title>MY JSP 'homepage.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>
<frameset rows="110,76%" frameborder="0" framespacing="0" scrolling="no" noresize="noresize">
    <frame id="top" name="top" src="top.jsp"/>
    <frameset rows="498,14%" frameborder="0" framespacing="0" scrolling="no" noresize="noresize">
        <frameset cols="217,72%" frameborder="0" framespacing="0" scrolling="no" noresize="noresize">
        <frameset rows="197,31%" frameborder="0" framespacing="0" scrolling="no" noresize="noresize">
            <frame id="lefttop" name="lefttop" src="login.jsp"/>
            <frame id="leftdown" name="leftdown" src="placardmana/placard_show.jsp"/>
        </frameset>
        <frame id="middledown" name="middledown" src="index.jsp"/>
    </frameset>
    <frameset rows="68,2%" frameborder="0" framespacing="0" scrolling="no" noresize="noresize">
        <frame id="down" name="down" src="down.jsp"/>
    </frameset>
</frameset>
</frameset>>
</html>
