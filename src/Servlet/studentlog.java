
package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcon.dbconn;

@WebServlet("/studentlog")
public class studentlog extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public studentlog() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
            request.getContextPath() + "/voterlogin.jsp"
        );
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String loginPage =
            request.getContextPath() + "/voterlogin.jsp";

        // Validate input
        if (email == null || email.trim().isEmpty()
                || password == null || password.isEmpty()) {

            response.sendRedirect(loginPage + "?error=empty_fields");
            return;
        }

        String sql = "SELECT name, email, mobile, course "
                   + "FROM studentreg "
                   + "WHERE email = ? AND password = ?";

        try (Connection con = dbconn.create();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email.trim());
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    // Create student session
                    HttpSession session = request.getSession(true);

                    session.setAttribute(
                        "studentName", rs.getString("name")
                    );

                    session.setAttribute(
                        "studentEmail", rs.getString("email")
                    );

                    session.setAttribute(
                        "mobile", rs.getString("mobile")
                    );

                    session.setAttribute(
                        "studentcourse", rs.getString("course")
                    );

                    response.sendRedirect(
                        request.getContextPath() + "/votermain.jsp"
                    );

                } else {

                    response.sendRedirect(
                        loginPage + "?error=invalid_credentials"
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                loginPage + "?error=server_error"
            );
        }
    }
}
