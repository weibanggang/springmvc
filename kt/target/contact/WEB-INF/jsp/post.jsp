<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>通讯录</title>
    <style>
        table, tr, td ,th{
            border: 1px solid red;
            collapse: collapse;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>编号</th>
        <th>标题</th>
        <th>内容</th>
        <th>时间</th>
        <th>作者</th>
        <th>性别</th>
        <th>地址</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${post}" var="p">
        <tr>
            <td>${p.pId}</td>
            <td>${p.pTitle}</td>
            <td>${p.pContext}</td>
            <td>${p.pDate}</td>
            <td>${p.authod.aName}</td>
            <td>${p.authod.aSex}</td>
            <td>${p.authod.aArrd}</td>
            <td><a href="/post/del/${p.pId}">删除</a></td>
        </tr>
    </c:forEach>
</table>
<form method="post" action="/post">
    <table>
        <tr>
            <td>标题：</td>
            <td><input type="text" placeholder="标题" name="pTitle"/></td>
        </tr>
        <tr>
            <td>内容：</td>
            <td><input type="text" placeholder="内容" name="pContext"/></td>
        </tr>
        <tr>
            <td>时间：</td>
            <td><input type="date" placeholder="时间" name="pDate"/></td>
        </tr>
        <tr>
            <td>作者：</td>
            <td>
                <select name="pAuthod">
                   <c:forEach items="${authod}" var="authod">
                       <option value="${authod.aId}">${authod.aName}</option>
                   </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <input type="submit" value="添加"/>
        </tr>
    </table>
</form>
</body>
</html>
