<%-- 
    Document   : dashboard
    Created on : 14 May, 2025, 10:22:12 AM
    Author     : 91810
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - JobNestX</title>
     <link rel="icon" type="image/x-icon" href="../logo.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">JobNestX Admin</a>
        </div>
        <div class="d-flex justify-content-end p-3">
    <form action="../logout.jsp" method="post">
        <button type="submit" class="btn btn-danger">
            <i class="bi bi-box-arrow-right"></i> Logout
        </button>
    </form>
    </div>
        <div >
        <a href="../index.jsp" class="btn btn-light mt-3">
         ⬅ Back to Home
        </a>
        </div>
    </nav>

    <div class="container mt-4">
        
        <%@ page session="true" %>
<%
    String adminName = (String) session.getAttribute("userName");
    if(adminName == null){
        response.sendRedirect("Login.jsp"); // redirect if session expired
    }
%>

<h3>Welcome, <%= adminName %>!</h3>
        
        
        
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Recruiter Approvals</h5>
                        <p class="card-text">Approve new recruiter accounts.</p>
                        <a href="manage_recruiters.jsp" class="btn btn-light">View Requests</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Job Post Approvals</h5>
                        <p class="card-text">Review job postings.</p>
                        <a href="manage_jobs.jsp" class="btn btn-light">Manage Jobs</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
    <div class="card text-white bg-dark mb-3">
        <div class="card-body">
            <h5 class="card-title">Contact Messages</h5>
            <p class="card-text">View messages from users.</p>
            <a href="view_contacts.jsp" class="btn btn-light">View Messages</a>
        </div>
    </div>
</div>

            
                    </div>
    </div>
</body>
</html>

