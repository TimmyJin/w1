<%--
  Created by IntelliJ IDEA.
  User: 13168
  Date: 2020/9/13
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
<div style="margin-top: 20px">
    <%
        if (currentPage == 1){
    %>
    <span class="firstpage">��ҳ</span>
    <span class="prepage">��ҳ</span>
    <%
    }else{
    %>
    <span class="firstpage"><a onclick="goPage(1)">��ҳ</a></span>
    <span class="prepage"><a onclick="goPage(<%=currentPage - 1%>)">��ҳ</a></span>
    <%
        }
        if (currentPage == totalPage){
    %>
    <span class="nextpage">��ҳ</span>
    <span class="firstpage">βҳ</span>
    <%
    }else{
    %>
    <span class="nextpage"><a onclick="goPage(<%=currentPage + 1%>)">��ҳ</a></span>
    <span class="firstpage"><a onclick="goPage(<%=totalPage%>)">βҳ</a></span>
    <%
        }
    %>
    <span class="messagepage">��${currentPage } / ${totalPage }ҳ</span>
</div>