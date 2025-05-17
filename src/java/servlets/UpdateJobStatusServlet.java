/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets; // adjust to your package

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateJobStatusServlet")
public class UpdateJobStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String jobIdStr = req.getParameter("jobId");
        String action  = req.getParameter("action");  // expected "approved" or "rejected"

        if (jobIdStr == null || action == null ||
            !(action.equals("approved") || action.equals("rejected"))) {
            resp.sendRedirect("admin/manage_jobs.jsp?error=invalid_input");
            return;
        }

        int jobId = Integer.parseInt(jobIdStr);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3308/job_portal", "root", "root");

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE jobs SET status = ? WHERE id = ?");
            ps.setString(1, action);
            ps.setInt(2, jobId);
            int updated = ps.executeUpdate();

            conn.close();
            if (updated > 0) {
                resp.sendRedirect("admin/manage_jobs.jsp?success=job_" + action);
            } else {
                resp.sendRedirect("admin/manage_jobs.jsp?error=not_found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin/manage_jobs.jsp?error=exception");
        }
    }
}

