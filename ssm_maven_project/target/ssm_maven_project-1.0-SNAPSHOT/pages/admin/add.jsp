<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <title>增加页面</title>
    <script src="<%=basePath %>/static/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<form action="<%=basePath %>/admin/saveReply?id=${param.id}" method="post">
    <input type="hidden" value="${param.id}" name="id">
    <table  border="1" align="center" cellspacing="0" cellpadding="20">
        <tr>
            <td colspan="2" align="center"><h3>添加回复</h3></td>
        </tr>
        <tr>
            <td>回复内容：</td>
            <td><textarea name="content" id="tex" cols="30" rows="10"></textarea><span></span></td>
        </tr>
        <tr>
            <td>回复昵称</td>
            <td><input type="text" name="author"></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交">&emsp;&emsp;&emsp;<input type="button" value="返回" onclick="fh()"></td>
        </tr>
    </table>
</form>
</body>
<script>
    $("#tex").blur(function () {
        if($(this).val().trim()==""){
            $("span").html("该内容不能为空!").css("color","red");
        }
    });
    $("form").submit(function () {
        var name =$("#tex").val().trim();
        if(name==""){
            return false;
        }
        return true;
    });
</script>
</html>
