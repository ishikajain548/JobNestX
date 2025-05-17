<%-- 
    Document   : index
    Created on : 13 May, 2025, 2:45:46 PM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String name = (String) session.getAttribute("userName");
    String role = (String) session.getAttribute("userRole");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JobNestX</title>
    <link rel="icon" type="image/x-icon" href="logo.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<!-- 🌐 Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="images/logo.png" alt="JobNestX" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#jobnestxNavbar" aria-controls="jobnestxNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="jobnestxNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                <li class="nav-item">
                  <%
    String postJobLink = "login.jsp";
    if (name != null && "recruiter".equals(role)) {
        postJobLink = "recruiter/dashboard.jsp"; // or a specific post job page like post_job.jsp
    }
       %>
<a class="nav-link btn btn-primary btn-lg text-white px-3" href="<%= postJobLink %>">📝 Post a Job</a>
                </li>
            </ul>

            <!-- Search form outside of <ul> -->
            <form class="d-flex mx-3" action="jobs.jsp" method="get" role="search">
                <input class="form-control me-2" type="search" placeholder="Job Title" aria-label="Job Title" name="title">
                <input class="form-control me-2" type="search" placeholder="Location" aria-label="Location" name="location">
                <button class="btn btn-light" type="submit">🔍 Search</button>
            </form>

            <ul class="navbar-nav ms-auto">
                <%
                    if (name == null) {
                %>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                <%
                    } else {
                        String dashboard = "#";
                        if ("admin".equals(role)) dashboard = "admin/dashboard.jsp";
                        else if ("recruiter".equals(role)) dashboard = "recruiter/dashboard.jsp";
                        else if ("jobseeker".equals(role)) dashboard = "jobseeker/dashboard.jsp";
                %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-circle"></i> <%= name %>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="<%= dashboard %>">Dashboard</a></li>
                        <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                    </ul>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>


<!-- 📢 Banner Section -->
<section class="py-5 bg-light text-center">
    <img src="images/banner.png" height="500px" 
         class="img-fluid w-100" alt="Banner Image">
</section>

<!-- 👥 Who Are You Section -->
<section class="py-5 bg-light text-center">
    <div class="container">
        <h3 class="mb-4">Who Are You?</h3>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card p-4">
                    <h4>🧑‍💼 I’m a Job Seeker</h4>
                    <p>Find and apply to jobs that fit your skills and goals.</p>
                    <a href="register.jsp" class="btn btn-outline-primary">Register as Job Seeker</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4">
                    <h4>🏢 I’m a Recruiter</h4>
                    <p>Post job openings and hire the right candidates.</p>
                    <a href="register.jsp" class="btn btn-outline-warning">Register as Recruiter</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 🆕 Recently Posted Jobs -->
<section class="py-5 text-center">
    <div class="container">
        <h3 class="mb-4">Recently Posted Jobs</h3>
        <div class="row">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM jobs WHERE status='approved' ORDER BY id DESC LIMIT 3");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <div class="col-md-4 mb-3">
                <div class="card p-3">
                    <h5><%=rs.getString("title")%></h5>
                    <p class="text-muted"><%=rs.getString("location")%></p>
                   <%
    String applyLink = "login.jsp";
    if (name != null && "jobseeker".equals(role)) {
        applyLink = "jobseeker/apply.jsp?jobId=" + rs.getInt("id");
    }
%>
<a href="<%= applyLink %>" class="btn btn-primary btn-sm">Apply Now</a>

                </div>
            </div>
            <%
                    }
                    rs.close();
                    ps.close();
                    conn.close();
                } catch(Exception e) {
                    out.println("<p>Error loading jobs: " + e.getMessage() + "</p>");
                }
            %>
        </div>
    </div>
</section>

<!-- 📞 Footer -->
<footer class="bg-dark text-white py-4">
    <div class="container text-center">
        <p>© 2025 JobNestX. All rights reserved.</p>
        <p>
            <a href="about.jsp" class="text-white me-3">About</a>
            <a href="contact.jsp" class="text-white">Contact</a>
        </p>
        <div>
            <a href="#" class="text-white me-2">Facebook</a>
            <a href="#" class="text-white me-2">LinkedIn</a>
            <a href="#" class="text-white">Twitter</a>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
document.querySelector('form[role="search"]').addEventListener('submit', function(e) {
    const title = this.querySelector('input[name="title"]').value.trim();
    const location = this.querySelector('input[name="location"]').value.trim();

    if (title === '' && location === '') {
        e.preventDefault();
        alert("Please enter at least a Job Title or Location to search.");
    }
});
</script>


</body>
</html>


