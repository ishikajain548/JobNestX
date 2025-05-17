/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 *
 * @author 91810
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException
    {
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        String role=req.getParameter("role");
        String company = req.getParameter("company");

        
        if (name.isEmpty() || email.isEmpty() || password.isEmpty() || role.isEmpty()) {
            res.sendRedirect("register.jsp?error=empty");
            return;
        }
        
          if ("recruiter".equals(role) && (company == null || company.trim().isEmpty())) {
            res.sendRedirect("register.jsp?error=nocompany");
            return;
        }
        try{
             Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal","root","root");
             PreparedStatement ps;
             if ("recruiter".equals(role)) {
    ps = con.prepareStatement("INSERT INTO users (name, email, password, role, company, status) VALUES (?, ?, ?, ?, ?, 'pending')");
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, password);  // You can hash this later
    ps.setString(4, role);
    ps.setString(5, company);
} else {
    ps = con.prepareStatement("INSERT INTO users (name, email, password, role, status) VALUES (?, ?, ?, ?, 'approved')");
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, password);
    ps.setString(4, role);
}

             ps.executeUpdate();
             
 
             
             res.sendRedirect("register.jsp?success=true");
        }catch (SQLIntegrityConstraintViolationException e) {
            res.sendRedirect("register.jsp?error=exists");
        } 
        catch(Exception e)
        {
          e.printStackTrace();
           res.sendRedirect("register.jsp?error=server");
        }
    }
}
