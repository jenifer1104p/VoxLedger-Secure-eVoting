
package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcon.dbconn;

@WebServlet("/studentreg")
public class studentreg extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public studentreg() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("message", "");
        request.getRequestDispatcher("/voterreg.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String course = request.getParameter("course");
        String pass = request.getParameter("pass");

        if (isEmpty(name) || isEmpty(email) ||
            isEmpty(mobile) || isEmpty(course) ||
            isEmpty(pass)) {

            request.setAttribute("message",
                    "All fields are required!");

            request.getRequestDispatcher("/voterreg.jsp")
                   .forward(request, response);
            return;
        }

        String sql = "INSERT INTO studentreg "
                   + "(name, email, mobile, course, password) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = dbconn.create();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setString(1, name.trim());
            statement.setString(2, email.trim());
            statement.setString(3, mobile.trim());
            statement.setString(4, course.trim());
            statement.setString(5, pass);

            int rows = statement.executeUpdate();

            if (rows > 0) {
                response.sendRedirect(
                    request.getContextPath()
                    + "/voterlogin.jsp?msg=registered");
            } else {
                request.setAttribute("message",
                        "Registration failed. Please try again.");

                request.getRequestDispatcher("/voterreg.jsp")
                       .forward(request, response);
            }

        } catch (SQLException e) {

            e.printStackTrace();

            request.setAttribute("message",
                    "Database error: " + e.getMessage());

            request.getRequestDispatcher("/voterreg.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute("message",
                    "Unable to connect to the database.");

            request.getRequestDispatcher("/voterreg.jsp")
                   .forward(request, response);
        }
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}
