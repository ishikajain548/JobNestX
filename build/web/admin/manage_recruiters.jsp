<%-- 
    Document   : manage_recruiters.jsp
    Created on : 16 May, 2025, 10:25:34 AM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String adminName = (String) session.getAttribute("userName");
    if(adminName == null){
        response.sendRedirect("Login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Recruiters - JobNestX</title>
      <link rel="icon" type="image/x-icon" href="../logo.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
      <div class="d-flex justify-content-between align-items-center mb-3">
          <h3>Pending Recruiter Accounts</h3>

        <a href="dashboard.jsp" class="btn btn-outline-secondary btn-sm">← Back to Dashboard</a>
    </div>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Recruiter ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Company</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE role='recruiter' AND status='pending'");
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("company") %></td>
                <td>
                    <form action="approve_recruiter.jsp" method="post">
                        <input type="hidden" name="recruiterId" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-success btn-sm">Approve</button>
                    </form>
                </td>
            </tr>
        <%
                }
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>

