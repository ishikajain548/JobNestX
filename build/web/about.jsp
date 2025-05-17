<%-- 
    Document   : about
    Created on : 16 May, 2025, 3:52:26 PM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us | JobNestX</title>
    <link rel="icon" href="logo.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #0d6efd 0%, #6f42c1 100%);
            color: white;
            padding: 60px 0;
        }
        .feature-box {
            border-radius: 15px;
            padding: 25px;
            transition: all 0.3s ease-in-out;
        }
        .feature-box:hover {
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
            transform: translateY(-5px);
        }
    </style>
</head>
<body>

<!-- Top Navigation Button -->
<div class="text-end p-3">
    <a href="index.jsp" class="btn btn-outline-primary">
        <i class="bi bi-house-door"></i> Home
    </a>
</div>

<!-- Hero Section -->
<section class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold">About JobNestX</h1>
        <p class="lead">Empowering careers. Connecting talent with opportunity.</p>
    </div>
</section>

<!-- About Content -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-6">
                <h2>What is JobNestX?</h2>
                <p>JobNestX is an innovative online job portal designed for modern hiring needs. It bridges the gap between job seekers and recruiters by providing a platform for posting, searching, and applying for jobs with ease.</p>
                <p>Our platform simplifies the recruitment process with user-friendly dashboards for Admins, Recruiters, and Job Seekers.</p>
            </div>
            <div class="col-md-6">
                <img src="images/banner.png" class="img-fluid rounded shadow" alt="About JobNestX">
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5">
    <div class="container text-center">
        <h2 class="mb-4">Key Features</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="bg-white p-4 shadow feature-box">
                    <h5>🔒 Role-Based Dashboards</h5>
                    <p>Separate views for Admin, Recruiter, and Job Seeker to maintain secure access and functionality.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="bg-white p-4 shadow feature-box">
                    <h5>📄 Dynamic Job Management</h5>
                    <p>Recruiters can post, edit, or delete jobs. Admins approve listings before they go live.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="bg-white p-4 shadow feature-box">
                    <h5>💬 Contact Support</h5>
                    <p>Built-in contact form with admin-side viewer, marking as read, and message deletion.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p>© 2025 JobNestX. Built using JSP, Servlet, JDBC & MySQL.</p>
    <small>Developed by Ishika Jain</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
