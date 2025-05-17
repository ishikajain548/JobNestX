<%-- 
    Document   : dashboard
    Created on : 14 May, 2025, 10:21:10 AM
    Author     : 91810
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Recruiter Dashboard - JobNestX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
       <link rel="icon" type="image/x-icon" href="../logo.ico">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">JobNestX Recruiter</a>
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
    String recruiterName = (String) session.getAttribute("userName");
    if(recruiterName == null){
        response.sendRedirect("Login.jsp"); // redirect if session expired
    }
    
%>

<h3>Welcome, <%= recruiterName %>!</h3>



        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card border-primary">
                    <div class="card-body">
                        <h5 class="card-title">Post a Job</h5>
                        <p class="card-text">Create and publish a new job opening.</p>
                        <a href="post_job.jsp" class="btn btn-primary">Post Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-success">
                    <div class="card-body">
                        <h5 class="card-title">View Applications</h5>
                        <p class="card-text">Review job seeker applications.</p>
                        <a href="view_applications.jsp" class="btn btn-success">View Now</a>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>
