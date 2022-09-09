<%@ page import="model.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit Author</title>
</head>
<body>

Please update Author`s data:
<br>
<%
    Author author = (Author) request.getAttribute("author");
%>

<form method="post" action="/authors/edit" enctype="multipart/form-data">
    <input type="file" name="profilePic">
    <input type="hidden" name="authorId" value="<%=author.getId()%>"><br>
    <input type="text" name="name" value="<%=author.getName()%>"><br>
    <input type="text" name="surname" value="<%=author.getSurname()%>"><br>
    <input type="email" name="email" value="<%=author.getEmail()%>"><br>
    <input type="number" name="age" value="<%=author.getAge()%>"><br>
    <br>
    <input type="submit" value="update">
</form>

</body>
</html>
