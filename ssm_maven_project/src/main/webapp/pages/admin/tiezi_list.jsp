<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>帖子展示页面</title>
    <!-- 引入bootstrap分页 -->
    <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css" />
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
    <script>
        $(function() {
            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion: 3,
                currentPage: ${requestScope.pageInfo.pageNum },
                totalPages: ${requestScope.pageInfo.pages },
                pageUrl: function(type, page, current) {
                    return 'admin/getInvitationsList?pageNum=' + page;
                },
                itemTexts: function(type, page, current) {
                    switch(type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                }
            });
        });
    </script>
    <style type="text/css">
          tbody>tr:nth-child(odd) {
              background: #CCF6CE;
          }
    </style>
</head>
<body>
<center>
    <form action="/admin/getInvitationsLikeList" method="post">
        <table style="width: 600px" border="1" cellpadding="15px" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="5" align="center">帖子列表</th>
                </tr>
                <tr>
                    <th colspan="5" align="center">
                        帖子标题
                        <input type="text" name="title">
                        <input type="submit" value="搜索">
                    </th>
                </tr>
                <tr>
                <th>标题</th>
                <th>内容摘要</th>
                <th>作者</th>
                <th>发布时间</th>
                <th>操作</th>
               </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="invitation">
                <tr>
                    <td>${invitation.title}</td>
                    <td>${invitation.summary}</td>
                    <td>${invitation.author}</td>
                    <td>${invitation.creatdate}</td>
                    <td>
                        <a href="<%=basePath %>/admin/getReplyList?id=${invitation.id}">查看回复</a>&nbsp;&nbsp;||
                        <a href="<%=basePath %>/admin/removeReply?id=${invitation.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- 把分页搞出来 -->
        <ul id="pagination"></ul>
    </form>
</center>
</body>
</html>