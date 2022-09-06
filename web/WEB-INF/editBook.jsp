<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%@ page import="model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit Book</title>
</head>
<body>

<%
    Book book = (Book) request.getAttribute("book");

    List<Author> authorList = (List<Author>) request.getAttribute("author");
%>

Please Update Book`s Data:
<form method="post" action="/books/edit">
    <input type="hidden" name="bookId" value="<%=book.getId()%>">
    <input type="text" name="title" value="<%=book.getTitle()%>"/><br>
    <input type="text" name="description" value="<%=book.getDescription()%>"><br>
    <input type="number" name="price" value="<%=book.getPrice()%>"/>

    <select name="authorId">
        <%
            for (Author author : authorList) {
                if (author.equals(book.getAuthor())) {
        %>
        <option selected
                value="<%=author.getId()%>"><%=author.getName() + " " + author.getSurname() + " " + author.getEmail()%>
        </option>
        <%} else {%>
        <option value="<%=author.getId()%>"><%=author.getName() + " " + author.getSurname() + " " + author.getEmail()%>

                <%} }%>
    </select>

    <input type="submit" value="Update">
</form>

</body>
</html>
