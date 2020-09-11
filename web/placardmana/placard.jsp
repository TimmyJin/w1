<%--
  Created by IntelliJ IDEA.
  User: TimmyJin
  Date: 2020/9/11
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
    <script language="JavaScript">
        function mycheck() {
            if (form1.title.value==""){
                alert("请输入公告标题");form1.title.focus();return;
            }
            if (form1.content.value==""){
                alert("请输入公告内容");form1.content.focus();return;
            }
            form1.submit();
        }
    </script>
</head>
<body>
    <table width= "100%"height="156" border= "0" cellpadding="0" cellspacing= "0">
        <tr>
        <td width="100%"><img src="images/manage_center.placardadd.gif" width="100%" height= "156"></td>
        </tr>
    </table>
    <form method= "post"name= "form1" action= "PlacardServlet" >
    <input type= "hidden" name= "action" id="action" value="1"/>
    <table width="100%" border=0 align= "center" cellpadding="-2" cellspacing= "-2" bordercolordark= "#FFFF">
        <tr height=10epx>
            <td width=140px></td>
            <td width=208px></td>
            <td width=208px></td>
        </tr>
        <tr>
            <td height="45">标题: </td>
            <td ><input type=text name=title id=title size=27 ></td>
        </tr>
        <tr>
            <td width= "14%"height= "272"rowspan= "2">&nbsp;公告内容: </td>
            <td width= "86%"><textarea name= "content" id= "content" cols="60" rows= ”15" class= "textarea"></textarea></td>
        </tr>
        <tr>
            <td width=148px></td>
            <td width=200px>
                <input type=button value= "提交"onclick= "mycheck()">
                <input type=reset value="重置">
                <input type=button value= "返回"onclick=" JScript:history.back(-1)">
            </td>
            <td width=200px></td>
        </tr>
    </table>
    </form>
    。:


</body>
</html>
