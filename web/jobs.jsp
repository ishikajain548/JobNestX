<%-- 
    Document   : jobs
    Created on : 15 May, 2025, 7:36:57 PM
    Author     : 91810
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Jobs - JobNestX</title>
        <link rel="icon" type="image/x-icon" href="logo.ico">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-5">
    <h3 class="mb-4 text-center">Search Results</h3>
    <div class="row">
        <%
            String title = request.getParameter("title");
            String location = request.getParameter("location");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");

                // Use 1=1 to avoid syntax errors when appending conditions
                StringBuilder query = new StringBuilder("SELECT * FROM jobs WHERE 1=1 AND status='approved' ");

                if (title != null && !title.trim().isEmpty()) {
                    query.append("AND LOWER(title) LIKE ? ");
                }
                if (location != null && !location.trim().isEmpty()) {
                    query.append("AND LOWER(location) LIKE ? ");
                }

                PreparedStatement ps = conn.prepareStatement(query.toString());

                int index = 1;
                if (title != null && !title.trim().isEmpty()) {
                    ps.setString(index++, "%" + title.toLowerCase() + "%");
                }
                if (location != null && !location.trim().isEmpty()) {
                    ps.setString(index++, "%" + location.toLowerCase() + "%");
                }

                ResultSet rs = ps.executeQuery();

                boolean hasResults = false;
                while(rs.next()) {
                    hasResults = true;
        %>
        <div class="col-md-4 mb-3">
            <div class="card p-3">
                <h5><%= rs.getString("title") %></h5>
                <p class="text-muted"><%= rs.getString("location") %></p>
                 <p class="text-muted"><%= rs.getString("description") %></p>

                <a href="login.jsp" class="btn btn-primary btn-sm">Apply Now</a>
            </div>
        </div>
        <%
                }
                if (!hasResults) {
        %>
        <div class="col-12 text-center">
            <p class="text-muted">No jobs found matching your search.</p>
        </div>
        <%
                }
                conn.close();
            } catch(Exception e) {
        %>
        <p class="text-danger text-center">Error: <%= e.getMessage() %></p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
