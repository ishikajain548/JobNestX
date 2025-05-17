<%-- 
    Document   : view_applications
    Created on : 14 May, 2025, 6:18:56 PM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    Integer recruiterId = (Integer) session.getAttribute("userId");
    if (recruiterId == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="../logo.ico">

</head>
<body>
<div class="container mt-5">
      <div class="d-flex justify-content-between align-items-center mb-3">
       <h3>Job Applications</h3>
        <a href="dashboard.jsp" class="btn btn-outline-secondary btn-sm">← Back to Dashboard</a>
    </div>
   
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Job Title</th>
                <th>Applicant Name</th>
                <th>Resume</th>
                <th>Applied On</th>
                  <th>Status</th>
                <th>Action</th>
             </tr>
        </thead>
        <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");
                    String query = "SELECT j.title, u.name, a.resume_link, a.applied_at,a.status,a.id " +
                                   "FROM applications a " +
                                   "JOIN jobs j ON a.job_id = j.id " +
                                   "JOIN users u ON a.user_id = u.id " +
                                   "WHERE j.recruiter_id = ?";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setInt(1, recruiterId);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("name") %></td>
                <td><a href="uploads/<%= rs.getString("resume_link") %>" target="_blank">View Resume</a></td>
                <td><%= rs.getTimestamp("applied_at") %></td>
                <td>
    <% String status = rs.getString("status"); %>
    <span class="badge bg-<%= 
        "accepted".equalsIgnoreCase(status) ? "success" :
        "rejected".equalsIgnoreCase(status) ? "danger" :
        "reviewed".equalsIgnoreCase(status) ? "primary" : "secondary"
    %>"><%= status %></span>
      </td>
<td>
    <% if ("applied".equalsIgnoreCase(status)) { %>
        <form action="../UpdateApplicationStatusServlet" method="post" class="d-flex gap-2">
            <input type="hidden" name="applicationId" value="<%= rs.getInt("id") %>">
            <button type="submit" name="action" value="accepted" class="btn btn-success btn-sm">Accept</button>
            <button type="submit" name="action" value="rejected" class="btn btn-danger btn-sm">Reject</button>
        </form>
    <% } else { %>
        <em class="text-muted">No action</em>
    <% } %>
</td>

            
            </tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
            %>
            <tr><td colspan="4" class="text-danger">Error loading applications.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>

