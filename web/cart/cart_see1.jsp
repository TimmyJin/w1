<%--
  Created by IntelliJ IDEA.
  User: Jeperdre
  Date: 2020-09-06
  Time: 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="vo.cart" %>
<%@ page import="dao.DBUtil" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>My JSP 'cart-see.jsp' starting pase</title>

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
<form method="post" name="form1" action="cart/cart_modify.jsp">
    <table width="92%" height="48" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center" valign="middle">
            <td height="27" class="tableBoarder_B1">编号</td>
            <td height="27" class="tableBoarder_B1">商品编号</td>
            <td class="tableBoarder_B1">商品名称</td>
            <td height="27" class="tableBoarder_B1">单价</td>
            <td height="27" class="tableBoarder_B1">数量</td>
            <td height="27" class="tableBoarder_B1">金额</td>
            <td class="tableBoarder_B1">退回</td>
        </tr>
<%String username="";
    username=(String)session.getAttribute("consumer");
    if (username==""||username==null){
        out.println("<script langyage='javascript'>alert('请先登录！');window.ocation.href='index1.jsp';</script>");
    }else {
        DBUtil conn=new DBUtil();
        Vector ct=(Vector)session.getAttribute("ct");
        if (ct==null||ct.size()==0) {
            out.println("<script langyage='javascript'>window.ocation.href='cart/cart-null.jsp';</script>");
        }else{
            int sum=0;
            int ID=-1;
            int finum=0;
            String goodsname="";
            for(int i=0,j=0;i<ct.size();i++) {
                snum = i;
                cart cb = (cart) ct.elementAt(i);
                j = cb.getNum();
                K = cb.getPrice();
                ID = cb.getID();
                if (ID > 0) {
                        }
                        ResultSet rs = conn.executeQuery("select*from furniture where fid=" + ID)
                        if (rs.next()) {
                            goodsname = rs.getString("fname");
                        }
                        finum = rs.getInt("fnum");
                        if(j<=finum){sum=sum+j*k;}
                        else{ sum=sum+finum*k;}
                    }%>
        <tr align="center" valign="middle">
            <td width="32" height="27"><%=i+1%></td>
            <td width="109" height="27"><%=ID%></td>
            <td width="199" height="27"><%=goodsname%></td>
            <td width="59" height="27"><%=k%></td>
            <td width="51" height="27">
                <%if (j<=finum){%>
                <input name="num<%=i %>" size="7" type="text" class="txt_grey" value="<%=j%>" onBlur="check(this.form)">
                <%}else{%>
                <input name="num<%=i %>" size="7" type="text" class="txt_grey" value="<%=finum%>" onBlur="check(this.form)">
                <%}%>
            </td>
            <td width="65" height="27">$<%=k*j%></td>
            <td width="34"><a href="cart/cart_move.jsp"?ID="<%=i%>">移除</a></td>
            <script language="JavaScript">
                function check (myform) {
                    if (isNaN(myform.num<%=i%>.value)||myform.num<%=i%>.value.indexOf('.',0)!=-1){
                        alert("请不要输入非法字符");myform.num<%=i%>.focus();return;
                    }
                    if (myform.num<%=i%>.value==""){
                        alert("请输入修改的数量");myform.num<%=i%>.focus();return;
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
            <a href="cart/cart_clear.jsp">清空购物车</a>
            <a href="cart/cart_modify.jsp?num=<%=snum%>">修改数量</a>
            <a href="ordermana/order.jsp">去购物台结账</a>
        </tr>
    </table>
    <% }
        }%>
</form>
</body>
</html>
