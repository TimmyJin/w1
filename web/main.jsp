<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="dao.DBUtil"%>
<%@page import="vo.furniture"%>
<%@page import="java.util.List" %>


<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>MY JSP 'main.jsp'staring page</title>



    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <style type="text/css">
        td{
            width:140px;
            height:30px;
        }
    </style>
    <script type="text/javascript">
        function goPage(toPage){
            document.getElementById("page").value=toPage;
            document.furform.submit();
        }
    </script>




</head>

<body style="text-align: center">
<form method="post" name="furform" action="FurServlet">
    <input type="hidden" name="action" id="action" value="5"/>
    <input type="hidden" name="page" id="page" value="1"/>
    <tr>
        家具名：<input type="text" id="fname" name="fname" size="66"/>
        <input type="submit" value="查询"/>
        <td bgcolor="#CCCCCC" height="6px"></td>
    </tr>
    <div style="margin-top:20px">
        <table style="border: 1px #000000 solid" align="center">
            <td>
                <td width="10%" height="24" align="center">商品号</td><td width="2%"><img src="images/shop_09.gif" width="3"
                height="57"></td>
                <td width="10%" height="24" align="center">名称</td><td width="2%"><img src="images/shop_09.gif" width="3"
                height="57"></td>
                <td width="35%" height="24" align="center">简介</td><td width="2%"><img src="images/shop_09.gif" width="3"
                height="57"></td>
                <td width="5%" height="24" align="center">数量（个）</td><td width="2%"><img src="images/shop_09.gif" width="3"
                height="57"></td>
                <td width="5%" height="24" align="center">价格（元）</td><td width="2%"><img src="images/shop_09.gif" width="3"
                height="57"></td>
                <td width="35%" height="24" align="center">图片</td><td width="2%"><img src="images/shop_09.gif" width="3"
                height="57"></td>
            </tr>
            <%List<furniture> flist=(List<furniture>)request.getAttribute("flist");
            for(furniture fur:flist){
                %>
            <tr>
                <td height="20" align="center"><%=fur.getFid()%></td><td width="2%"><img src="images/shop_09.gif"
                                                                                         width="3" height="57"></td>
                <td align="center"><%=fur.getFname()%></td><td width="2%"><img src="images/shop_09.gif" width="3"
                                                                              height="57"></td>
                <td align="center"><%=fur.getFsummary()%></td><td width="2%"><img src="images/shop_09.gif" width="3"
                                                                                  height="57"></td>
                <td align="center"><%=fur.getFnum()%></td><td width="2%"><img src="images/shop_09.gif" width="3"
                                                                              height="57"></td>
                <td align="center"><%=fur.getFmoney()%></td><td width="2%"><img src="images/shop_09.gif" width="3"
                                                                                height="57"></td>
                <td align="center"><img src=<%out.print(fur.getFpic());%> width=80 height=100></td><td width="2%">
            <img src="images/shop_09.gif" width="3" height="57"></td>
                
                <td align="right">
                    <form method="post" name="addfur" action="FurServlet">
                    <input type="hidden" name="cation" id="action" value=6>
                    <input type="hidden" name="id" value=<%=fur.getFid() %>>
                    <input type="submit" name="addfur" value="购买"></form>
                </td>
            </tr>
            <%} %>
        </table>
    </div>
    <%@include file="page.jsp"%>
</form>
</body>
</html>