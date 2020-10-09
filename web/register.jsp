<%--
  Created by IntelliJ IDEA.
  User: 24596
  Date: 2020/9/13
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="gb2312" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="vo.consumer" %>
<%@ page import="dao.userdao" %>
<%@ page import="dao.imp.userdaoimpl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <base href="<%=basePath%>">
    <title>My JSP 'order_user.jsp' starting page</title>

    <meta HTTP-EQUIV="pragma" content="no-cache">
    <meta HTTP-EQUIV="cache-control" content="no-cache">
    <meta HTTP-EQUIV="expires" content="0">
    <meta HTTP-EQUIV="keywords" content="keyword1,keyword2,keyword3">
    <meta HTTP-EQUIV="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <script type="text/javascript">
        function check(){
            if (document.register.cname.value==""){
                window.alert("用户名不为空！");
                window.register.cname.focus();
                return false;
            }
            if (document.register.password.value==""){
                window.alert("请输入密码！");
                window.register.password.focus();
                return false;
            }
            if (document.register.password.value!=document.register.confpwd.value){
                window.alert("两次输入密码不一致，请重新输入");
                window.register.confpwd.focus();
                return false;

            }
            document.register.submit();
        }

    </script>

</head>
<body>
<div id="dv">用户注册</div>
<hr/>
<br/>
<form name="register" action="LoginServlet" method="post">
    <input type="hidden" name="action" value="4"/>
    <table align="center">
        <tr>
            <td>用&nbsp;户&nbsp;名:<input type="text" name="cname" size="36"/>
            </td>
            <td><%=request.getAttribute("iderror")==null?"":request.getAttribute("iderror")%></td>
        </tr>
        <tr>
            <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" size="40"/></td>
        </tr>
        <tr>
            <td>确认密码：<input type="password" name="confpwd" size="40"/></td>
        </tr>
        <tr>
            <td>电话号码：<input type="text" name="tel" size="36"/></td>
        </tr>
        <tr>
            <td><input type="button" value="立即注册" onclick="check()">
            <input type="button" value="返回" onclick="JScript:history.back(-1)"></td>
        </tr>
    </table>


</form>

</body>
</html>
