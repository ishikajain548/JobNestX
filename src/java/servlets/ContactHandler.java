/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/contact-handler")
public class ContactHandler extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");

            String query = "INSERT INTO contact_messages(name, email, subject, message) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, message);

            int i = ps.executeUpdate();
            conn.close();

            if (i > 0) {
                res.sendRedirect("contact.jsp?msg=success");
            } else {
                res.sendRedirect("contact.jsp?msg=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("contact.jsp?msg=error");
        }
    }
}

