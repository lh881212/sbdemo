<%--
  Created by IntelliJ IDEA.
  User: Li Han
  Date: 2019/11/25
  Time: 4:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>编辑分类</title>
</head>
<body>
    <div style="margin: 0 auto;width: 500px">
        <form action="updateCategory" method="post">
            name: <input type="text" name="name" value="${c.name}"/> <br>
            <input type="hidden" name="id" value="${c.id}">
            <button type="submit">提 交</button>
        </form>
    </div>
</body>
</html>
