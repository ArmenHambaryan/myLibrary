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

<form method="post" action="${pageContext.request.contextPath}/authors/edit">
    <input type="hidden" name="authorId" value="<%=author.getId()%>">
    <input type="text" name="name" value="<%=author.getName()%>">
    <input type="text" name="surname" value="<%=author.getSurname()%>">
    <input type="email" name="email" value="<%=author.getEmail()%>">
    <input type="number" name="age" value="<%=author.getAge()%>">
    <input type="submit" value="update">
</form>

</body>
</html>