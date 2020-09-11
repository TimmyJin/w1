<%--
  Created by IntelliJ IDEA.
  User: TimmyJin
  Date: 2020/9/11
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="dao.DBUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%
    DBUtil conn=new DBUtil();
    ResultSet rs = conn.executeQuery("select * from placard");
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <base href="<%=basePath%>">
    <title>My JSP 'placard_mana.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <!--
    <link rel="stylesheet" type="test/css" herf="styles.css">
    -->
    <script type="text/javascript">
        function checkdel() {
            if (confirm("确定要删除吗？")){
                document.placardmanaform.submit();
            }
        }
    </script>
</head>
<body>
    <form method="post" name="placardmanaform" action="PlacardServlet">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <img src="images/manage_center_placardlist.gif" width="100%" height="156">
            </tr>
            <tr bgcolor= "#eeeeee">
                <td width= "32%" height= "24" align= "center">公告标题</td>
                <td width="60%" align= "center">公告内容</td>
                <td width="8%" align= "center">删除</td>
            </tr>
            <%
                int ID=0;
                String content="";
                String title="";
                while(rs .next()){
                    ID=rs. getInt(1);
                    title=rs. getString(2);
                    content=rs .getString(3);

            %>
            <tr bgcolor= "eeeee">
                <td width= "32%" height= "24" align="center"><%=title %></td>
                <td width= "60%" align= "center"><%=content %></td>
                <td align= "center"><input name= "delid" type= "checkbox" class= "noborder" value="<%=ID%> "></td>
            </tr>
            <%} %>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td></td><td width= "8%" height= "24" align= "right"> <input type= "button" name= "ddplacard" value="添加"onclick="window. location. href= 'placardmana/placard.jsp'"></td>
                <td width= "8%"align= "right">
                [<a sty1e="color :red; cursor :hand;" onclick="checkdel()">删除</a>]
                <div id= "ch"><input name= "delid" type= "checkbox" class= "noborder" value= "e"></div>
                <script language= "javascript"> ch.style.display="none";</script>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
