<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>通讯录</title>
    <style>
        table, tr, td {
            border: 1px solid red;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>编号：</th>
        <th>姓名：</th>
        <th>性别：</th>
        <th>地址：</th>
        <th>操作：</th>
    </tr>
    <c:forEach items="${authod}" var="authod">
        <tr>
            <td>${authod.aId}</td>
            <td>${authod.aName}</td>
            <td>${authod.aSex}</td>
            <td>${authod.aArrd}</td>
            <td><a href="/authod/del/${authod.aId}">删除</a></td>
        </tr>
    </c:forEach>
</table>
<form method="post" action="/authod">
    <table>
        <tr>
            <td>姓名：</td>
            <td><input type="text" placeholder="输入姓名" name="aName"/></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><input type="text" placeholder="输入性别" name="aSex"/></td>
        </tr>
        <tr>
            <td>地址：</td>
            <td><input type="text" placeholder="输入地址" name="aArrd"/></td>
        </tr>
        <tr>
            <input type="submit" value="添加"/>
        </tr>
    </table>
</form>
</body>
</html>
