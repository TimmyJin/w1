<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">

        <title>MY JSP 'login.jsp' starting page</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <!--
        link rel="stylesheet" type="text/css" href="styles.css">
        -->

    </head>

<body>
<div id="main">
    <table width="100%" bgcolor="0" cellpadding="0"cellspacing="0">
        <tr>
            <td height="129" align="center" background="images/shop_17.gif">
                <form name="login" method="POST" action="LoginServlet" onsubmit="return Check();">
                    <input type="hidden" id="action" name="action" value="1"/>
                    <table width="128" height="122" style="left: 0px;top:0px;width: 60px;">
                        <% if (request.getAttribute("error")!=null){ %>
                        <tr>
                            <td align=Left colspan=0 height=18 >
                                <font color=red><b><%=request.getAttribute("error") %></b></font>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td align=Left width="80">用户名：</td>
                            <td>
                            <input type="text" name="name" size="11"></td>
                        </tr>
                        <tr>
                            <td align="left"width="80">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
                            <td> <input type="password" name="password" size="11"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="left">
                                <input type="radio" value="0" name="role" id="role" checked="checked"/>操作人员
                                <input type="radio" value="1" name="role" id="role" />用户</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="left">
                                <input type="button" name="role" value="登录" onclick="check()"/>
                                <a href="register.jsp" target="middleown">注册</a>
                                <script language="javascript">
                                    function Check()
                                    {
                                        if (document.login.name.value=="")
                                        {
                                            window.alert("用户名不得为空!");
                                            window.login.password.focus();
                                            return false;
                                        }
                                        if (document.login.password.value.length<6)
                                        {
                                            window.alert("密码长度大于六!");
                                            window.login.password.focus();
                                            return false;
                                        }
                                        document.login.submit();
                                    }

                                </script>
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
