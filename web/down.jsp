<%@page language="java.util.*" pageEncoding="gb2312"%>
<%
String path= request.getContextPath();
String basePath= request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">

        <title>My JSP'down.jsp'starting page</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keywrd3">
        <meta http-equiv="description" content="This is my page">
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css"
        -->

    </head>

    <body>
    <tr >家具网站客服热线：0431-4978981</tr>
        <tr bgcolor="#cccccc">
            <td height="8" colspan="2"></td>
            <td height="8" align="center"></td>
            <td height="8" colspan="2"></td>
        </tr>
    </body>
</html>

