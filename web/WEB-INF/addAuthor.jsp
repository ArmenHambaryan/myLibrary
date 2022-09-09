<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 05.09.2022
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add Author</title>
</head>
<body>
Please input Author`s data:
<br>
<form action="/authors/add" method="post" enctype="multipart/form-data">
    <input type="text" name="name" placeholder="input only name"><br>
    <input type="text" name="surname" placeholder="input only surname"><br>
    <input type="email" name="email" placeholder="input only email"><br>
    <input type="number" name="age" placeholder="input your age">
    <input type="submit" value="ADD">
<br>
    Profile Picture:<br>
    <input type="file" name="profilePic">

</form>
</body>
</html>
