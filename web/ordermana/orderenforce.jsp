<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.DBUtil"%>
<%
    DBUtil conn=new DBUtil();
    if(request.getParameter("ID")!=""){
        int ID=Integer.parseInt(request.getParameter("ID"));
        int ret=0;
        ret=conn.executeUpdate(ID);
        if(ret!=0){
            out.println("<script language='javascript'>alert('订单执行成功!');window.location.href='ordermanage.jsp';</script>");
        }else{
            out.println("<script language='javascript'>alert('订单执行失败!');window.location.href='ordermanage.jsp';</script>");
        }
    }
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
    <link rel="stylesheet" type="text/沧桑s"href="styles.css">
    -->

</head>

<body>
</body>
<html>