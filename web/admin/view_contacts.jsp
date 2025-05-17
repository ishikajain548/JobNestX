<%-- 
    Document   : view_contacts
    Created on : 16 May, 2025, 12:49:09 PM
    Author     : 91810
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String adminName = (String) session.getAttribute("userName");
    if(adminName == null){
        response.sendRedirect("../login.jsp");
    }

    // Handle actions
    String action = request.getParameter("action");
    String id = request.getParameter("id");

    if(action != null && id != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");

            if("read".equals(action)) {
                PreparedStatement ps = conn.prepareStatement("UPDATE contact_messages SET is_read = 1 WHERE id = ?");
                ps.setInt(1, Integer.parseInt(id));
                ps.executeUpdate();
                ps.close();
            } else if("delete".equals(action)) {
                PreparedStatement ps = conn.prepareStatement("DELETE FROM contact_messages WHERE id = ?");
                ps.setInt(1, Integer.parseInt(id));
                ps.executeUpdate();
                ps.close();
            }

            conn.close();
            response.sendRedirect("view_contacts.jsp"); // refresh to update table
        } catch(Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Messages - Admin | JobNestX</title>
    <link rel="icon" type="image/x-icon" href="../logo.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>📬 Contact Form Messages</h3>
        <a href="dashboard.jsp" class="btn btn-outline-secondary btn-sm">← Back to Dashboard</a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Sender Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>Date/Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/job_portal", "root", "root");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM contact_messages ORDER BY submitted_at DESC");

                        while (rs.next()) {
                            int messageId = rs.getInt("id");
                            boolean isRead = rs.getBoolean("is_read");
                %>
                <tr>
                    <td><%= messageId %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("subject") %></td>
                    <td><%= rs.getString("message") %></td>
                    <td><%= rs.getTimestamp("submitted_at") %></td>
                    <td>
                        <% if(isRead) { %>
                            ✅ Read
                        <% } else { %>
                            🟡 Unread
                        <% } %>
                    </td>
                    <td>
                        <a href="view_contacts.jsp?action=read&id=<%= messageId %>" class="btn btn-sm btn-success mb-1">Mark as Read</a>
                        <a href="view_contacts.jsp?action=delete&id=<%= messageId %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this message?')">Delete</a>
                    </td>
                </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>


