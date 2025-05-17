/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Paths;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author 91810
 */
@WebServlet("/applyjob")
@MultipartConfig(fileSizeThreshold = 1024*1024*2, // 2MB
                 maxFileSize = 1024*1024*10,      // 10MB
                 maxRequestSize = 1024*1024*50)   // 50MB
public class ApplyJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int seekerId = (int) session.getAttribute("userId");
        int jobId = Integer.parseInt(request.getParameter("jobId"));

        Part resumePart = request.getPart("resume");
        String fileName = Paths.get(resumePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        resumePart.write(uploadPath + File.separator + fileName);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");

            PreparedStatement ps = conn.prepareStatement("INSERT INTO applications (job_id, user_id, resume_link, applied_at) VALUES (?, ?, ?, NOW())");
            ps.setInt(1, jobId);
            ps.setInt(2, seekerId);
            ps.setString(3, fileName);
            ps.executeUpdate();

            response.sendRedirect("jobseeker/dashboard.jsp");
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("jobseeker/dashboard.jsp");
        }
    }
}

