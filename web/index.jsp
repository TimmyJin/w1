<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="dao.DBUtil"%>
<%@page import="vo.furniture"%>
<% String sql="select * from furniture";
    String d = (String)request.getAttribute("k");
      if(d==null)
      sql="select * from furniture";
else if (d=="fname")
    sql="select * from furniture order by fname desc";
else if (d=="fsummary")
    sql="select * from furniture order by fsummary desc";
else if (d=="fnum")
    sql="select * from furniture order by fnum desc";
else if (d=="fmoney")
    sql="select * from furniture order by fmney desc";
    else;
    DBUtil conn=new DBUtil();
    ResultSet rs=conn.executeQuery(sql);
%>
<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">


        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->

        <script type="text/javascript" language="javascript">
            function check1(obj) {
                location.href = "OperServlet?action=7";
            }
            function check2(obj)
            {
            location.href="OperServlet?cation=8";
            }
            function check3(obj)
            {
            location.href="OperServlet?action=9";

            }
            function check4(obj)
            {
            location.href="OperServlet?cation=10";

            }
            function check0(obj)
            {
            location.href="OperServlet?cation=11";

            }
            </script>

    </head>

    <body>
    <form method="post" name="furform" action="FurServlet">
        <input type="hidden" name="action" id="action" value="5"/>
        <table width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
        <tr>
    <td colspan="2" height="7"></td>
        </tr>
            <tr>
            家具名：<input type="text" id="fname" name="fname" size=66/>
            <input type="submit" value="查询"/>
            <td bgcolor="#CCCCCC" height="6px"></td>
            </tr>
        </table>
    </form>
<table width="100%" height="48" border="1" cellpadding="0" cellpadding="0" bordercolor="FFFFFF">
    <tr>
        <td width="100%" height="24" align="center" onclick="check0(this)">商品号</td><td width="2%"><img
        src="images/shop_09.gif" width="3" height="57"></td>
        <td width="10%" height="24" align="center" onclick="check1(this)">名称</td><td width="2%"><img
        src="images/shop_09.gif" width="3" height="57"></td>
        <td width="35%" height="24" align="center" onclick="check2(this)">简介</td><td width="2%"><img
        src="images/shop_09.gif" width="3" height="57"></td>
        <td width="5%" height="24" align="center" onclick="check3(this)">数量（个）</td><td width="2%"><img
        src="images/shop_09.gif" width="3" height="57"></td>
        <td width="5%" height="24" align="center" onclick="check4(this)">价格（元）</td><td width="2%"><img
        src="images/shop_09.gif" width="3" height="57"></td>
        <td width="35%" height="24" align="center">图片</td><td width="2%"><img src="images/shop_09.gif"
        width="3" height="57"></td>
    </tr>

    <%
        String str=(String)request.getParameter("Page");
        if(str==null){
            str="0";
        }
        int pagesize=7;
        rs.last();
        int RecordCount=rs.getRow();
        rs.first();
        int maxpage = 0;
        maxpage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);
        int Page=Integer.parseInt(str);
        if (Page<1){
            Page=1;
        }
        else{
            if(Page>maxpage){
                Page=maxpage;
        }
        }
        rs.absolute((Page-1)*pagesize+1);

        for(int i=1;i<=pagesize;i++){
            furniture fur=new furniture();
            fur.setfid(rs.getInt("fid"));
            fur.setfname(rs.getString("fname"));
            fur.setfsummary(rs.getString("fsummary"));
            fur.setfnum(rs.getInt("fnum"));
            fur.setfmoney(rs.getInt("fmoney"));
            fur.setfpic(rs.getString("fpic"));


        %>
        <tr>
            <td height="20" align="center"><%=fur.getfid()%></td><td width="2%"><img src="images/shop_09.gif"
            width="3" height="50"></td>
            <td align="center"><%=fur.getfname()%></td><td width="2%"><img src="images/shop_09.gif" width="3"
            height="50"></td>
            <td align="center"><%=fur.getfsummary()%></td><td width="2%"><img src="images/shop_09.gif" width="3"
            height="50"></td>
            <td align="center"><%=fur.getfnum()%></td><td width="2%"><img src="images/shop_09.gif" width="3"
            height="50"></td>
            <td align="center"><%=fur.getfmoney()%></td><td width="2%"><img src="images/shop_09.gif" width="3"
            height="50"></td>
            <td align="center"><img src=<%out.print(fur.getfpic());%> width=80 height=100></td><td width="2%>
            <img src="images/shop_09.gif" width="3" height="50"></td>

            <td align="right">
            <form method="post" name="addfur" action="FurServlet">
            <input type="hidden" name="action" id="action" value=6>
            <input type="hidden" name="id" value=<%=fur.getfid() %>>
            <input type="submit" name="addfur" value="购买"></form>
            </td>
        </tr>
    <%
        try{
        if(!rs.next()){break;}
             }catch(Exception e){}
        }
        %>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td align="right">当前页数：[<%=Page %>/<%=maxpage %>]&nbsp;
<% if(Page > 1){ %>
    <a href="index.jsp?Page=1">第一页</a> <a href="index.jsp>Page=<%=Page-1%>">上一页</a>
    <%}
    if(Page<maxpage){ %>
    <a href="index.jsp?Page=<%=Page+1%>">下一页</a> <a href="index.jsp>Page=<%=maxpage%>">最后一页&nbsp;</a>
    <%}%>
</td>
</tr>

</table>
</body>
</html>
