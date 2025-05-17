<%-- 
    Document   : post_job
    Created on : 14 May, 2025, 10:21:36 AM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Post a Job</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="../logo.ico">
</head>
<body>
<div class="container mt-5" style="max-width: 500px;">
    
    <div class="d-flex justify-content-between align-items-center mb-3">
       <h3>Post a New Job</h3>
        <a href="dashboard.jsp" class="btn btn-outline-secondary btn-sm">← Back to Dashboard</a>
    </div>
   
    <form action="../postjob" method="post">
        <div class="mb-3">
            <input type="text" name="title" class="form-control" placeholder="Job Title" required>
        </div>
        <div class="mb-3">
            <textarea name="description" class="form-control" placeholder="Job Description" required></textarea>
        </div>
        <div class="mb-3">
            <input type="text" name="company" class="form-control" placeholder="Company Name" required>
        </div>
        <div class="mb-3">
            <input type="text" name="location" class="form-control" placeholder="Location" required>
        </div>
        <button type="submit" class="btn btn-success">Post Job</button>
    </form>
</div>
</body>
</html>

