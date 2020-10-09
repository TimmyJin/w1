<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="vo.cart"%>
<%@ page import="java.util.*"%>
<% Vector ct=(Vector)session.getAttribute("ct");
    Vector newct = new Vector();
    for(int i=0;i<ct.size();i++)
    {
        String number=request.getParameter("num"+i);
        cart cb=(cart)ct.elementAt(i);      //取得要修改变量的元素
        String num=request.getParameter("num"+i);
        try {
            int newnum = Integer.parseInt(num);
            cb.setNum(newnum);
            if (newnum != 0) {
                newct.addElement(cb);
            }
        }
        catch(Exception e)
        {
        out.println("<script language='javascript'> alert('您输入的数量不是有效地整数！');history.back();</script>");
        return;
        }
    }
    %>
<%session.setAttribute("ct",newct);
    response.sendRedirect("cart-see.jsp");
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'cart-modify.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet"type="text/css"href="styles.css">
    -->

</head>

<body>

</body>
</html>