<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<head>
    <title>回复信息列表</title>
</head>
<body>
<table border="1" align="center" cellspacing="0" cellpadding="10">
    <tr>
    <td colspan="3" align="center"><h1>回复信息列表</h1></td>
   </tr>
    <tr>
        <td colspan="3" align="right">
            <a href="/pages/admin/add.jsp?id=${param.id}" style="color: red">添加回复</a><a href="/admin/getInvitationsList" style="color: red">返回帖子列表</a>
        </td>
    </tr>
    <tr>
        <td>回复内容</td>
        <td>回复昵称</td>
        <td>发布时间</td>
    </tr>
        <c:forEach var="reply" items="${replyList}">
            <tr>
                <td>${reply.content}</td>
                <td>${reply.author}</td>
                <td>${reply.creatdate}</td>
            </tr>
        </c:forEach>
</table>
<%--<table border="1" align="center" cellspacing="0" cellpadding="20" background="/img/bg.jpg">
    <tr>
        <td>第${sessionScope.pageBean.currPage}/${sessionScope.pageBean.totalPage}页</td>
        <td><a href="javascript:toPage(1)">首页</a></td>
        <c:if test="${sessionScope.pageBean.currPage>1}">
            <td><a href="javascript:toPage(${sessionScope.pageBean.currPage-1})">上一页</a></td>
        </c:if>
        <c:forEach begin="1" var="i" end="${sessionScope.pageBean.totalPage}">
            <td><a href="javascript:toPage(${i})">${i}</a></td>
        </c:forEach>
        <c:if test="${sessionScope.pageBean.currPage<sessionScope.pageBean.totalPage}">
            <td><a href="javascript:toPage(${sessionScope.pageBean.currPage+1})">下一页</a></td>
        </c:if>
        <td><a href="javascript:toPage(${sessionScope.pageBean.totalPage})">尾页</a></td>
        <td>跳转到第 <input type="text" value="${sessionScope.pageBean.currPage}">页 <input type="button" value="GO" onclick="toPage(this.previousElementSibling.value)"></td>
    </tr>
</table>--%>
</body>
</html>
