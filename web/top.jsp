<%--
  Created by IntelliJ IDEA.
  User: TimmyJin
  Date: 2020/9/10
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@ page import="java.util.*"%>
<%java.util.Date date = new java.util.Date();%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basepath%>">
    <title>MY JSP 'top.jsp' starting page</title>
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
    <table width="1200" height="21" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
        <td valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td bgcolor="#cccccc" height="6px"></td>
            </tr>
        </table>
        <table width="1207" height="60" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="25%" align="center" style="background-color: #ffffff;"><h1><font face="隶书" size="7">家具购物商城</font></h1></td>
                <td width="50%" align="center">
                    <table width="544" height="30" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="32" align="right" valign="top">
                            <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                                <tr align= "center">

                                    <td width="7" valign="top"><img src= "images/T_contact.gif" width= "42" height= "28"></td>
                                    <td width= "72"><a href= "mailto:cctvlxy1457956@163.com">联系我们</a></td>
                                    <td width="10" valign= "top"><img src="images/T_favorite.gif" width= "42" height= "28"></td>
                                    <td width= "68"><a href="javascript:window.external.AddFavorite('http://timmyjin.top:8080/firstwab/','家具购物')">收藏本站</a></td>
                                    <td width="10" valign= "top"><img src= "images/T_home.gif" width= "42" height= "28"></td>
                                    <td width="70"><a href="#" onclick= "this.style.behavior='url(#default#homepage)';this.sethomepage('http://timmyjin.top:8080/firstwab/')">设为首页</a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height= "20" valign= "top" background="images/shop_07.gif">
                            <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
                            <tr align= "right"><td></td><td></td><td></td><td></td><td></td>
                                <%=date.getYear()+1900%>年
                                <%=date.getMonth()+1%>月
                                <%=date.getDate()%>日
                                <%=date.getHours()%>时
                                <%=date.getMinutes()%>分</tr>
                            </table>
                        </td>
                    </tr>
                    </table>
                </td>
                <td width="25%" align="left" style="background-color: #ffffff;">
                    <h1><font face="隶书" size="7">欢迎您的光临</font></h1>
                </td>
            </tr>
        </table>
        </td>
        </tr>
    </table>
</body>
</html>
