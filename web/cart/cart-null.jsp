<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'cart-null.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet"type="text/css"href="styles.css">
    -->

</head>

<td>
 <td height="189" valign="top">
     <table width="610" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="80" background="images/center_empy.gif">&nbsp;</td>>
            </tr>
                <tr valign="top">
               <td height="134" align="center">
                <table width="600" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                      <td height="24" colspan="2" align="center">&nbsp;</td>>
                  </tr>
                  <tr>
                      <td width="48" height="38" align="right" class="word_orange">您的购物车为空！</td>
                      <td width="52%" rowspan="3" align="right" valign="bottom">
                          <img src="../images/cart.gif" width="150" height="186"></td>
                  </tr>
                  <tr>
                      <td height="57" align="right"><input name="Button" type="button" class="btn_grey"
                       value="我要购买商品！" onClick="window.Location.herf='index1.jsp'"></td>
                  </tr>
                </table>
               </td>
                </tr>
        </table>
    </td>
    </body>
</html>



