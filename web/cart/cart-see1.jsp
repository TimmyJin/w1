<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.util.Vector" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="vo.cart" %>
<%@ page import="dao.DBUtil" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'cart-see.jsp' starting page</title>

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

<form method="post" name="form1" action="cart/cart-modify.jsp">
    <table width="92%" height="48" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center" valign="middle">
            <td height="27" class="tableBoarder_B1">商品编号</td>
            <td class="tableBoarder_B1">商品编号</td>
            <td height="27" class="tableBoarder_B1">单价</td>
            <td height="27" class="tableBoarder_B1">数量</td>
            <td height="27" class="tableBoarder_B1">金额</td>
            <td  class="tableBoarder_B1">退回</td>
        </tr>

<%String username="";
    username=(String)session.getAttribute("consumer");
    if (username==""||username==null)
    {
        out.println("<script language='javascript'>alert('请先登录！');window.location.href='index1.jsp';</script>");
    }
    else
    {
        DBUtil conn=new DBUtil();
        Vector ct=(Vector)session.getAttribute("ct");
        if (ct==null||ct.size()==0)
        {
            out.println("<script language='javascript'>window.location.href='cart-null.jsp';</script>");
        }
    else
    {
        int sum=0;
        int ID=-1;
        int snum=0;
        int finum=0;
        String goodsname="";
        for (int i=0,j=0,k=0;i<ct.size();i++)
        {
            snum=i;
            cart cb=(cart)ct.elementAt(i);
            j=cb.getNum();
            k=cb.getPrice();
            //sum=sum+j*k;
            ID=cb.getID();
            if(ID>0)
            {
                ResultSet rs=conn.executeQuery("select * from furniture where fid="+ID);
                if (rs.next())
                {
                    goodsname=rs.getString("fname");
                }
                finum=rs.getInt("fnum");
                if (j<=finum) {sum=sum+j*k;}
                else{ sum=sum+finum*k; }
            }
%>
        <tr align="center" valign="middle">
        <td width="32" height="27"><%=i+1 %></td>
        <td width="109" height="27"><%=ID %></td>
        <td width="199" height="27"><%=goodsname%></td>
        <td width="59" height="27"><%=k %></td>
        <td width="51" height="27">
        <%if(j<=finum)
            {%>
             <input name="num<%=i%>" size="7" type="text" class="txt_grey" value="<%=j %>" onBlur="check(this.from)">
             <%
            }
            else
            {%>
            <input name="%=i %" size="7" type="text" class="txt_grey" value="<%=finum%>" onBlur="check(this.form)">
            <%}
            %>
        </td>
            <td width="65" height="27">$<%=k*j%></td>
            <td width="34" ><a href="cart/cart-move.jsp?ID=<%=i%>">移除</a></td>
            <script language="javascript">
                function check(myform)
                {
                    if (isNaN(myform.num<%=i%>.value)||myform.num<%=i%>.value.indexOf('.',0)!=-1)
                    {
                        alert("请不要输入非法字符");myform.num<%=i%>.focus();
                        return;
                    }
                    if (myform.num<%=i%>.value=="")
                    {
                        alert("请输入修改的数量");myform.num<%=i%>.focus();
                        return;
                    }
                    myform.submit();
                }
            </script>
<%}%>
        </tr></table>
    <table width="92%" height="48" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="right" valign="middle">
            <td width="65" height="27">$<%=sum%></td>
        </tr>
        <tr>
            <a href="index.jsp">继续购物</a>
            <a href="cart/cart-clear.jsp">清空购物车</a>
            <a href="cart/caet-modify.jsp?num=<%=sum %>">修改数量</a>
            <a href="ordermana/order.jsp">去购物台结账</a>
        </tr>
    </table>
    <%}
    }%>

</form>
</body>
</html>




