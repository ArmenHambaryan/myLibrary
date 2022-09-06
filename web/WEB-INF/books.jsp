<%@ page import="java.util.List" %>
<%@ page import="model.Book" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 05.09.2022
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books page</title>
</head>
<body>

<%
    List<Book> books = (List<Book>) request.getAttribute("books");

%>


<table border="1">
    <tr>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>price</th>
        <th>author name and surname and email</th>
        <th>action</th>
    </tr>
        <%for (Book book : books) { %>

    <tr>
        <td><%=book.getId()%>
        </td>
        <td><%=book.getTitle()%>
        </td>
        <td><%=book.getDescription() %>
        </td>
        <td><%=book.getPrice()%>
        </td>
        <td><%=book.getAuthor()%>
        </td>
        <td>
            <a href="/books/remove?bookId=<%=book.getId()%>"> Remove</a> |
            <a href="/books/edit?bookId=<%=book.getId()%>">Edit</a>
        </td>
    </tr>

        <% }%>

</body>
</html>
