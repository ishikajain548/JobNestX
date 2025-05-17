<%-- 
    Document   : view_jobs
    Created on : 14 May, 2025, 4:03:28 PM
    Author     : 91810
--%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    Integer seekerId = (Integer) session.getAttribute("userId");
    if (seekerId == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Available Jobs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="../logo.ico">
</head>
<body>
<div class="container mt-5">
    
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Browse Jobs</h3>
        <a href="dashboard.jsp" class="btn btn-outline-secondary"> Back to Dashboard</a>
    </div>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Company</th>
                <th>Status</th>
                <th>Location</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM jobs where status='approved'");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("title") %></td>
                 <td><%= rs.getString("description") %></td>
                <td><%= rs.getString("company") %></td>
                 <td><%= rs.getString("status") %></td>
                
                <td><%= rs.getString("location") %></td>
                
                <td>
                    <form action="apply.jsp" method="post">
                        <input type="hidden" name="jobId" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-primary btn-sm">Apply</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } catch(Exception e) {
                    out.println("<tr><td colspan='4'>Error loading jobs</td></tr>");
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>

