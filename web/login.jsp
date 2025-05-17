<%-- 
    Document   : login
    Created on : 13 May, 2025, 7:42:24 PM
    Author     : 91810
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - JobNestX</title>
     <link rel="icon" type="image/x-icon" href="logo.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 500px;">
        <h2 class="text-center mb-4">Login</h2>

        
        <% String error = request.getParameter("error"); 
           if ("invalid".equals(error)) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ❌ Invalid email or password.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } else if ("empty".equals(error)) { %>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                ⚠️ Please enter both email and password.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% }  else if ("pending".equals(error)) { %>
    <div class="alert alert-info alert-dismissible fade show" role="alert">
        ⏳ Your account is <strong>pending admin approval</strong>. Please wait.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>

<a href="index.jsp" class="btn btn-outline-primary position-fixed" style="top: 20px; right: 20px; z-index: 999;">
    <i class="bi bi-house-door"></i>  🏠 Home
</a>


        <form action="login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" name="email" class="form-control" id="email" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
