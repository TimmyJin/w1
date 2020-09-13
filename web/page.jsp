<%--
  Created by IntelliJ IDEA.
  User: TimmyJin
  Date: 2020/9/10
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<style type="text/css">
a{
    color: #0000ff;
}
</style>
<%
    int currentPage = (Integer)request.getAttribute("currentPage");
    int totalPage = (Integer)request.getAttribute("totalPage");
    int pageMaxNum = (Integer)request.getAttribute("pageMaxNum");
%>
<div>
    <%
    if(currentPage ==1){
    %>
    <span class="firstpage">首页</span>
    <span class="prepage">上页</span>
    <%}else {%>
    <span class="firstpage"><a onclick="goPage(1)">首页</a></span>
    <span class="prepage"><a onclick="goPage(<%=currentPage-1%>)">上页</a></span>
    <%}
    if (currentPage == totalPage){
    %>
    <span class="nextpage">下页</span>
    <span class="firstpage">尾页</span>
    <%}else { %>
    <span class="nextpage"><a onclick="gopage(<%=currentPage-1%>)">下页</a></span>
    <span class="firstpage"><a onclick="gopage(<%=totalPage%>)">尾页</a></span>
    <%} %>
    <span class="messagepage">第${currentpage}/${totalPage}</span>
</div>