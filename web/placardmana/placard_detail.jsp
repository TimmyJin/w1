<%--
  Created by IntelliJ IDEA.
  User: TimmyJin
  Date: 2020/9/11
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="vo.placard"%>

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
    </head>
    <body>
    <table width= "98%"height= "79"border="0" cellpadding="0" cellspacing= "0" class= "noborder">
            <%placard pla=new placard();
            pla=(placard)request.getAttribute("pla1");
            %>
            <tr>
                <td width="2%" height= "12" align= "center">&nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td width= "95%" height= "27">&nbsp;&nbsp; &nbsp ;&nbsp;&nbsp; &nbsp ; &nbsp;&nbsp; &nbsp ;&nbsp;&nb
                    &nbsp ;&nbsp;&nbsp; &nbsp ;&nbsp;&nbsp; &nbsp ;&nbsp;&nbsp; &nbsp; <%=pla.getTitle() %></td>
            <td width= "3%">&nbsp;</td>
        </tr>
        <tr>
            <td width= "2%" height= "12"align="center">&nbsp; &nbsp;&nbsp;&nbsp;</td>
            <td height= "27">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <%=pla.getContent() %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td width="2%" height= "47" align="center" >&nbsp;</td>
            <td align= "center"><input name= "Submit" type= "submit" class= "btn_ grey"
                                       onClick="history. back(-1);" value="·µ»Ø"></td>
            <td></td>
        </tr>
    </table>
    </body>
</html>