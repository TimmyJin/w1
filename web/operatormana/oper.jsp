<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+":/"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
</html>
	<head>
		<base href="<%=basePath%>">
		
		<title>My JSP 'oper.jsp' starting page</title>
		
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control"content="no-cache">
		<meta http-equiv="expires"content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description"content="this is my page">
		<!-- 
		<link rel="stylesheet"type="text/css" href="styles.css">
		 -->
		 
		 </head>
		 
		 </body>
		 <table width="92%" height="48"border="0" align="center" cellpadding="0" cellspacing="0">
		 	<tr><a href="OperServlet?action=1"target="middledown">��Ʒ����<br/></a></tr>
		 	<tr><a href="furmana/furcount.jsp"target="middledown">����ͳ��<br/></a></tr>
		 	<tr><a href="operatormana/membermana.jsp"target="middledown">��Ա����<br/></a></tr>
		 	<tr><a href="OperServlet?action=5"target="middledown">�������<br/></a></tr>
		 	<tr><a href="OperServlet?action=3"target="middledown">��������<br/></a></tr>
		 	<tr><a href="OperServlet?action=4"target="middledown">ע��</a></tr>
		 	</table>
		 	</body>
		 	</html>