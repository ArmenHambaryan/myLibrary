package servlet;

import manager.AuthorManager;
import manager.BookManager;
import model.Author;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/books/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100

)
public class AddBookServlet extends HttpServlet {
    private final AuthorManager authorManager = new AuthorManager();

    private final BookManager bookManager = new BookManager();

    private static final String IMAGE_PATH = "C:\\Users\\lenovo\\IdeaProjects\\myLibrary\\projectImages\\";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Author> all = authorManager.getAll();
        request.setAttribute("authors", all);
        request.getRequestDispatcher("/WEB-INF/addBook.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int authorId = Integer.parseInt(request.getParameter("authorId"));

        Part profilePic = request.getPart("profilePic");
        String filename = null;
        if (profilePic.getSize() != 0) {
            long nanoTime = System.nanoTime();
            filename = nanoTime + "_" + profilePic.getSubmittedFileName();
            profilePic.write(IMAGE_PATH + filename);
        }
        Book book = Book.builder()
                .title(title)
                .description(description)
                .price(price)
                .author(authorManager.getById(authorId))
                .profilePic(filename)
                .build();
        bookManager.add(book);

        response.sendRedirect("/books");
    }
}
