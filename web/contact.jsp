<%-- 
    Document   : contact
    Created on : 16 May, 2025, 12:34:08 PM
    Author     : 91810
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us - JobNestX</title>
      <link rel="icon" type="image/x-icon" href="logo.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">📬 Contact Us</h2>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <% String msg = request.getParameter("msg");
               if ("success".equals(msg)) { %>
               <div class="alert alert-success">Your message has been sent successfully!</div>
            <% } else if ("error".equals(msg)) { %>
               <div class="alert alert-danger">Something went wrong. Please try again later.</div>
            <% } %>

            <a href="index.jsp" class="btn btn-outline-primary position-fixed" style="top: 20px; right: 20px; z-index: 999;">
    <i class="bi bi-house-door"></i>  🏠 Home
</a>

       
            
            <form action="contact-handler" method="post">
                <div class="mb-3">
                    <label>Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Subject</label>
                    <input type="text" name="subject" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Message</label>
                    <textarea name="message" class="form-control" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Message</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
