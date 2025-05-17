<%-- 
    Document   : my_applications
    Created on : 14 May, 2025, 5:55:46 PM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="true" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");

    PreparedStatement ps = conn.prepareStatement(
        "SELECT a.*, j.title, j.company FROM applications a JOIN jobs j ON a.job_id = j.id WHERE a.user_id = ?");
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Applications</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="../logo.ico">
</head>
<body class="bg-light">

<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">My Job Applications</h2>
        <a href="dashboard.jsp" class="btn btn-outline-secondary">← Back to Dashboard</a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>Job Title</th>
                            <th>Company</th>
                            <th>Applied On</th>
                            <th>Status</th>
                            <th>Resume</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        boolean hasData = false;
                        while (rs.next()) {
                            hasData = true;
                    %>
                        <tr>
                            <td><%= rs.getString("title") %></td>
                            <td><%= rs.getString("company") %></td>
                            <td><%= rs.getTimestamp("applied_at") %></td>
                            <td>
                                <span class="badge bg-<%= rs.getString("status").equalsIgnoreCase("accepted") ? "success" : rs.getString("status").equalsIgnoreCase("Rejected") ? "danger" : "secondary" %>">
                                    <%= rs.getString("status") %>
                                </span>
                            </td>
                            <td>
                                <a href="../uploads/<%= rs.getString("resume_link") %>" target="_blank" class="btn btn-sm btn-outline-primary">View Resume</a>
                            </td>
                        </tr>
                    <%
                        }
                        if (!hasData) {
                    %>
                        <tr>
                            <td colspan="5" class="text-center text-muted">You have not applied to any jobs yet.</td>
                        </tr>
                    <%
                        }
                        rs.close();
                        ps.close();
                        conn.close();
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
