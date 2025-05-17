/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
/**
 *
 * @author 91810
 */
@WebServlet("/postjob")
public class PostJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String company = request.getParameter("company");
        String location = request.getParameter("location");
       HttpSession session = request.getSession(false); // don’t create a new session
if (session == null || session.getAttribute("userId") == null) {
    response.sendRedirect("login.jsp");
    return;
}
int recruiterId = (int) session.getAttribute("userId");


        try {
           Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");
     
          
            PreparedStatement ps = conn.prepareStatement("INSERT INTO jobs (title, description, company, location, recruiter_id) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, company);
            ps.setString(4, location);
            ps.setInt(5, recruiterId);
            ps.executeUpdate();
            response.sendRedirect("recruiter/dashboard.jsp");
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
