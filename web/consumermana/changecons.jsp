<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="dao.imp.userdaoimpl"%>
<%@ page import="dao.userdao"%>
<%@ page import="vo.consumer"%>
<%
	String uname=(String)session.getAttribute("consumer");
%>
<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		
		<title>My JSP 'membermana.jsp' starting page</title>
		
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<!--
		<link rel="stylesheet" type="text/css"href="styles.css">
		-->
		
		<script type="text/javascript">
		function check(){
			if(document.changeform.cname.value=="")
				{
				window.alert("�û�����Ϊ�գ�");
				window.changeform.cname.focus();
				return false;
				}
			if(document.changeform.cname.value=="")
				{
				window.alert("���������룡");
				window.changeform.password.focus();
				return false;
		}
		if(document.changeform.password.value!=document.changeform.confpwd.value)
		{
			window.alert("�����������벻һ�£�����������");
			window.changeform.confpwd.focus();
			return false;
		}
		document.changeform.submit();
		}
		</script>
		
		</head>
		
		<body>
       <form method="post" name="changeform" action="ConsServlet">

<input type="hidden" name="action" value="2"/>
<input type="hidden" name="id" value="<%=uname %>/">
<table width="100%" border="0" cellspacing="-2" cellpadding="-2" bgcolor="#EEEEEE">
<tr>
<td valign="top" align="center" height="28">�û������޸�</td>
</tr>
<tr>
 <td height="28" align="center">�û�����</td>
<td height="28"><input type="text" name="cname" value="<%=uname %>" class="txt" size=16></td>
<td><%=request.getAttribute("iderror")==null?"":request.getAttribute("iderror")%></td>
</tr>
<tr>
 <td height="28" align="center">���룺</td>
<td height="28"><input type="password" name="password" size=16/></td>
 </tr>
<tr>
 <td height="28" align="center">ȷ�����룺</td>
<td height="28"><input type="password" name="confpwd" size=16/></td>
</tr>
<tr>
 <td height="28" align="center">�绰��</td>
<td height="28"><input type="text" name="ctel" class="txt" size=16/></td>
</tr>
<tr>
 <td height="34">&nbsp;</td>
<td class="word_grey"><input type="button" value="�޸�" onclick="check()"/></td>
<td class="word_grey"><input type="button" value="����" onclick="JScript:history.back(-1)"/></td>
</tr>
</table>
</form>
</body>
</html>