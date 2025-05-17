<%-- 
    Document   : dashboard.jsp
    Created on : 14 May, 2025, 10:20:16 AM
    Author     : 91810
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Job Seeker Dashboard - JobNestX</title>
      
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="../logo.ico">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">JobNestX Seeker</a>
        </div>
             <a href="../index.jsp" class="btn btn-light mt-3">
    ⬅ Back to Home
</a>
         <div class="d-flex justify-content-end p-3">
    <form action="../logout.jsp" method="post">
        <button type="submit" class="btn btn-danger">
            <i class="bi bi-box-arrow-right"></i> Logout
        </button>
    </form>
</div>
   

    </nav>

    <div class="container mt-4">
        <%@ page session="true" %>
<%
    String jobSeekerName = (String) session.getAttribute("userName");
    if(jobSeekerName == null){
        response.sendRedirect("login.jsp"); // redirect if session expired
    }
%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp"); // adjust path if needed
    }
%>


<h3>Welcome, <%= jobSeekerName %>!</h3>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card border-success">
                    <div class="card-body">
                        <h5 class="card-title">View Jobs</h5>
                        <p class="card-text">Explore available job opportunities.</p>
                        <a href="view_jobs.jsp" class="btn btn-success">View Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-warning">
                    <div class="card-body">
                        <h5 class="card-title">My Applications</h5>
                        <p class="card-text">Track your job applications.</p>
                        <a href="my_applications.jsp" class="btn btn-warning">View Status</a>
                    </div>
                </div>
            </div>
                 
            </div>
            
        </div>
    </div>
</body>
</html>

