<%-- 
    Document   : apply
    Created on : 14 May, 2025, 10:20:33 AM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    Integer seekerId = (Integer) session.getAttribute("userId");
    if (seekerId == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    String jobId = request.getParameter("jobId");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Apply for Job</title>
      <link rel="icon" type="../image/x-icon" href="../logo.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5" style="max-width:500px;">
        <%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("../login.jsp"); // adjust path if needed
    }
%>

    <h3>Apply for Job</h3>
    <form action="../applyjob" method="post" enctype="multipart/form-data">
        <input type="hidden" name="jobId" value="<%= jobId %>">
        <div class="mb-3">
           
            <% String n=(String) session.getAttribute("userName"); 
              
            %>
            Hi <%=n %> please upload your resume.. (pdf)<br>
            <input type="file" name="resume" accept="application/pdf" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Submit Application</button>
    </form>
</div>
</body>
</html>
