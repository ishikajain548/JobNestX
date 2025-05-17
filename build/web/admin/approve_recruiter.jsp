<%-- 
    Document   : approve_recruiter
    Created on : 16 May, 2025, 10:28:20 AM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    int recruiterId = Integer.parseInt(request.getParameter("recruiterId"));
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");
        PreparedStatement ps = conn.prepareStatement("UPDATE users SET status='approved' WHERE id=?");
        ps.setInt(1, recruiterId);
        int updated = ps.executeUpdate();
        if (updated > 0) {
            response.sendRedirect("manage_recruiters.jsp?msg=approved");
        } else {
            response.sendRedirect("manage_recruiters.jsp?msg=error");
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<html>
    <head>
          <link rel="icon" type="image/x-icon" href="logo.ico">
        <title></title>
    </head>
</html>

