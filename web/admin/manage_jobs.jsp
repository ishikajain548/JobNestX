<%-- 
    Document   : manage_jobs
    Created on : 14 May, 2025, 8:59:56 PM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    // Make sure admin is logged in
    String role = (String)session.getAttribute("userRole");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Approve/Reject Jobs</title>
      <link rel="icon" type="image/x-icon" href="../logo.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    
    <%
  String success = request.getParameter("success");
  String error   = request.getParameter("error");
  if ("job_approved".equals(success)) {
%>
  <div class="alert alert-success">Job approved successfully.</div>
<%
  } else if ("job_rejected".equals(success)) {
%>
  <div class="alert alert-warning">Job rejected.</div>
<%
  } else if (error != null) {
%>
  <div class="alert alert-danger">Error: <%= error %></div>
<%
  }
%>

    
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2> Jobs</h2>
        <a href="dashboard.jsp" class="btn btn-outline-secondary btn-sm">← Back to Dashboard</a>
    </div>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Job Title</th>
                <th>Company</th>
                <th>Location</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3308/job_portal", "root", "root");
                    String query = "SELECT id, title, company, location FROM jobs WHERE status = 'pending'";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                    boolean hasAny = false;
                    while (rs.next()) {
                        hasAny = true;
            %>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("company") %></td>
                <td><%= rs.getString("location") %></td>
                <td>
                    <form action="../UpdateJobStatusServlet" method="post" class="d-inline">
                        <input type="hidden" name="jobId" value="<%= rs.getInt("id") %>">
                        <button type="submit" name="action" value="approved" class="btn btn-success btn-sm">Approve</button>
                    </form>
                    <form action="../UpdateJobStatusServlet" method="post" class="d-inline ms-2">
                        <input type="hidden" name="jobId" value="<%= rs.getInt("id") %>">
                        <button type="submit" name="action" value="rejected" class="btn btn-danger btn-sm">Reject</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                    if (!hasAny) {
            %>
            <tr>
                <td colspan="4" class="text-center text-muted">No pending jobs to review.</td>
            </tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
            %>
            <tr><td colspan="4" class="text-danger">Error loading jobs.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>

