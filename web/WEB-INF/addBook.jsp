<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
</head>
<body>

<%
    List<Author> authorList = (List<Author>) request.getAttribute("authors");
%>

<form method="post" action="/books/add" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="title"><br>
    <input type="text" name="description" placeholder="description"><br>
    <input type="number" name="price" placeholder="price">

    <select name="authorId">
        <%for (Author author : authorList) {%>
        <option value="<%=author.getId()%>"><%=author.getName() + " " + author.getSurname() + " " + author.getEmail()%>
        </option>
        <%}%>
    </select>
    <br>
    Profile Picture:<br>
    <input type="file" name="profilePic">

    <input type="submit" value="add">
</form>

</body>
</html>
