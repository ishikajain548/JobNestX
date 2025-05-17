<%-- 
    Document   : logout
    Created on : 14 May, 2025, 12:39:11 PM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="icon" type="image/x-icon" href="logo.ico">

        <title>Logout</title>
        
    </head>
    <body>
       <%
    String role = (String) session.getAttribute("userRole");
    session.invalidate();

    if ("admin".equals(role)) {
        response.sendRedirect("index.jsp"); // or admin login
    } else if ("recruiter".equals(role)) {
        response.sendRedirect("index.jsp"); // or recruiter login
    } else if ("jobseeker".equals(role)) {
        response.sendRedirect("index.jsp"); // or jobseeker login
    } else {
        response.sendRedirect("index.jsp"); // fallback
    }
%>

    </body>
</html>
