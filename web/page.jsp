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
    <span class="firstpage">��ҳ</span>
    <span class="prepage">��ҳ</span>
    <%}else {%>
    <span class="firstpage"><a onclick="goPage(1)">��ҳ</a></span>
    <span class="prepage"><a onclick="goPage(<%=currentPage-1%>)">��ҳ</a></span>
    <%}
    if (currentPage == totalPage){
    %>
    <span class="nextpage">��ҳ</span>
    <span class="firstpage">βҳ</span>
    <%}else { %>
    <span class="nextpage"><a onclick="gopage(<%=currentPage-1%>)">��ҳ</a></span>
    <span class="firstpage"><a onclick="gopage(<%=totalPage%>)">βҳ</a></span>
    <%} %>
    <span class="messagepage">��${currentpage}/${totalPage}</span>
</div>