<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 09.09.2022
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");

%>
<%
    if (msg != null) {%>

<p style="color: red"><%=msg%></p>
<%}%>

<form action="/user" method="post" enctype="multipart/form-data"><br>
    <input type="text" name="name" placeholder="please input name"><br>
    <input type="text" name="surname" placeholder="please input surname"><br>
    <input type="email" name="email" placeholder="please input email"><br>
    <input type="password" name="password" placeholder="please input password"><br>
    <br>
    <input type="submit" name="Register">
</form>


</body>
</html>
