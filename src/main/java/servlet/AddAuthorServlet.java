package servlet;

import manager.AuthorManager;
import model.Author;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet(urlPatterns = "/authors/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100

)
public class AddAuthorServlet extends HttpServlet {

    private AuthorManager authorManager = new AuthorManager();

    private static final String IMAGE_PATH = "C:\\Users\\lenovo\\IdeaProjects\\myLibrary\\projectImages\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/addAuthor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        int age = Integer.parseInt(req.getParameter("age"));
        Part profilePic = req.getPart("profilePic");
        String filename = null;
        if (profilePic.getSize() != 0) {
            long nanoTime = System.nanoTime();
            filename = nanoTime + "_" + profilePic.getSubmittedFileName();
            profilePic.write(IMAGE_PATH + filename);
        }


        Author author = Author.builder()
                .name(name)
                .surname(surname)
                .email(email)
                .age(age)
                .profilePic(filename)
                .build();

        authorManager.add(author);

        resp.sendRedirect("/author");
    }
}
