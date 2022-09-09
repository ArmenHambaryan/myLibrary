<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>myLibrary</title>
</head>

<%
    User user = (User) session.getAttribute("user");
%>

<body>
<div style="width: 1000px;margin: 0 auto">
    <div>
        <img src="/image/final_booklist_black-writers.png.webp" width="1000" height="400"/>
    </div>
    <div>
        Welcome to our library
        <br>


        <%
            if (user != null) {%>
        <a href="/authors/add">Add Authors</a>
        <a href="/books/add">Add Books</a>
        <a href="/author">Show All Authors</a>
        <a href="/books">Show All Books</a>
        <a href="/logout">Logout</a>

        <%} else {%>
        <a href="/author">Show All Authors</a>
        <a href="/books">Show All Books</a>
        <a href="/login">login</a>
        <a href="/user">Register</a>
        <%}%>


    </div>

</div>
</body>
</html>
