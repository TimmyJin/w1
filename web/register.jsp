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
                window.alert("�û�����Ϊ�գ�");
                window.register.cname.focus();
                return false;
            }
            if (document.register.password.value==""){
                window.alert("���������룡");
                window.register.password.focus();
                return false;
            }
            if (document.register.password.value!=document.register.confpwd.value){
                window.alert("�����������벻һ�£�����������");
                window.register.confpwd.focus();
                return false;

            }
            document.register.submit();
        }

    </script>

</head>
<body>
<div id="dv">�û�ע��</div>
<hr/>
<br/>
<form name="register" action="LoginServlet" method="post">
    <input type="hidden" name="action" value="4"/>
    <table align="center">
        <tr>
            <td>��&nbsp;��&nbsp;��:<input type="text" name="cname" size="36"/>
            </td>
            <td><%=request.getAttribute("iderror")==null?"":request.getAttribute("iderror")%></td>
        </tr>
        <tr>
            <td>��&nbsp;&nbsp;&nbsp;&nbsp;�룺<input type="password" name="password" size="40"/></td>
        </tr>
        <tr>
            <td>ȷ�����룺<input type="password" name="confpwd" size="40"/></td>
        </tr>
        <tr>
            <td>�绰���룺<input type="text" name="tel" size="36"/></td>
        </tr>
        <tr>
            <td><input type="button" value="����ע��" onclick="check()">
            <input type="button" value="����" onclick="JScript:history.back(-1)"></td>
        </tr>
    </table>


</form>

</body>
</html>
