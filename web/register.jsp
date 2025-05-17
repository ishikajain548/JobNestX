<%-- 
    Document   : register
    Created on : 13 May, 2025, 1:28:29 PM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="icon" type="image/x-icon" href="logo.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   
        <title>Register - JobNestX</title>
    </head>
    <body class="bg-light">
        <div class="container mt-5" style="max-width: 500px;">
            <h2 class="text-center mb-4">Register</h2>

        <% String error = request.getParameter("error"); %>
<% if ("nocompany".equals(error)) { %>
    <div class="alert alert-danger">Company name is required for recruiters.</div>
<% } else if ("exists".equals(error)) { %>
    <div class="alert alert-warning">Email already exists. Try logging in.</div>
<% } else if ("server".equals(error)) { %>
    <div class="alert alert-danger">Server error. Please try again later.</div>
<% } else if ("empty".equals(error)) { %>
    <div class="alert alert-danger">All fields are required.</div>
<% } else if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success">Registered successfully! You can now log in.</div>
<% } %>


<a href="index.jsp" class="btn btn-outline-primary position-fixed" style="top: 20px; right: 20px; z-index: 999;">
    <i class="bi bi-house-door"></i>  🏠 Home
</a>

       
        <form action="register" method="post">
            <div class="mb-3">
                <label>Name:</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" required>
            </div>
             <div class="mb-3">
                <label>Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Role:</label>
                <select name="role" class="form-control" required>
                    <option value="jobseeker">Job Seeker </option>
                    <option value="recruiter">Recruiter</option>
                </select>
            </div>
            <div class="mb-3" id="companyField" style="display: none;">
    <label for="company" class="form-label">Company Name</label>
    <input type="text" class="form-control" id="company" name="company">
</div>

            <button type="submit" class="btn btn-primary">Register</button>
        </form>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const roleSelect = document.querySelector("select[name='role']");
        const companyField = document.getElementById("companyField");

        roleSelect.addEventListener("change", function() {
            if (this.value === "recruiter") {
                companyField.style.display = "block";
            } else {
                companyField.style.display = "none";
            }
        });
    });
</script>
    </body>
</html>
