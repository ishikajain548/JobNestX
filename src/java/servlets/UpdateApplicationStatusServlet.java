/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

/**
 *
 * @author 91810
 */


import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/UpdateApplicationStatusServlet")
public class UpdateApplicationStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String applicationIdStr = request.getParameter("applicationId");
        String action = request.getParameter("action");

        if (applicationIdStr == null || action == null) {
            response.sendRedirect("recruiter/view_applications.jsp?error=missing_data");
            return;
        }

        int applicationId = Integer.parseInt(applicationIdStr);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3308/job_portal", "root", "root");

            // Validate action
            if (!action.equals("accepted") && !action.equals("rejected")) {
                response.sendRedirect("recruiter/view_applications.jsp?error=invalid_status");
                return;
            }

            String query = "UPDATE applications SET status = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, action);
            ps.setInt(2, applicationId);
            ps.executeUpdate();

            conn.close();
            response.sendRedirect("recruiter/view_applications.jsp?success=updated");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("recruiter/view_applications.jsp?error=exception");
        }
    }
}

