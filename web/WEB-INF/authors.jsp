<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors page</title>
</head>
<body>


<%
    List<Author> authors = (List<Author>) request.getAttribute("authors");

%>

<table border="1">
    <tr>
        <th>image</th>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>age</th>
        <th>action</th>
    </tr>
    <%
        for (Author author : authors) { %>

    <tr>
        <td>
            <% if (author.getProfilePic() == null || author.getProfilePic().length() == 0) {%>
            <img src="/image/def.jpg" width="100">
            <%} else { %>
            <img src="/getImage?profilePic=<%=author.getProfilePic()%>" width="100" />
            <% }%>

        </td>
        <td><%=author.getId()%>
        </td>
        <td><%=author.getName()%>
        </td>
        <td><%=author.getSurname() %>
        </td>
        <td><%=author.getEmail()%>
        </td>
        <td><%=author.getAge()%>
        </td>
        <td>
            <a href="/authors/remove?authorId=<%=author.getId()%>">Remove</a> |
            <a href="/authors/edit?authorId=<%=author.getId()%>">Edit</a>
        </td>
    </tr>

    <% }%>


</table>

</body>
</html>
