<%--
  Created by IntelliJ IDEA.
  User: Li Han
  Date: 2019/11/25
  Time: 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 500px;margin: 20px auto;text-align: center">
    <table align="center" border="1" cellspacing="0">
        <tr>
            <td>id</td>
            <td>name</td>
            <td>编辑</td>
            <td>删除</td>
        </tr>
        <c:forEach items="${page.content}" var="c" varStatus="st">
        <tr>
            <td>${c.id}</td>
            <td>${c.name}</td>
            <td><a href="editCategory?id=${c.id}">编辑</a></td>
            <td><a href="deleteCategory?id=${c.id}">删除</a></td>
        </tr>
        </c:forEach>
    </table>
    <br>
    <div>
        <a href="?pageNo=0">[首 页]</a>
        <a href="?pageNo=${page.number-1}">[上一页]</a>
        <a href="?pageNo=${page.number+1}">[下一页]</a>
        <a href="?pageNo=${page.totalPages-1}">[末 页]</a>
    </div>
    <br>
    <form action="addCategory" method="post">
        name: <input type="text" name="name"> <br>
        <button type="submit">提 交</button>
    </form>
</div>
</body>
</html>
