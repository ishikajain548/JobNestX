/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;



/**
 *
 * @author 91810
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            res.sendRedirect("login.jsp?error=empty");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ? ");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            
          
            if (rs.next()) {
                String role = rs.getString("role");
                 String status = rs.getString("status");
               
                
                if ("recruiter".equals(role) && !"approved".equals(status)) {
                    res.sendRedirect("login.jsp?error=pending");
                    return;
                }
                 // Create session
                HttpSession session = req.getSession();
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("userName", rs.getString("name"));
                session.setAttribute("userRole", role);

                
                

                res.sendRedirect("index.jsp");
            } else {
                res.sendRedirect("login.jsp?error=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("login.jsp?error=server");
        }
    }
}

