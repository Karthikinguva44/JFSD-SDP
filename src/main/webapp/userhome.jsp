<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.klef.jfsd.SDP.model.User" %>
<%
User u = (User)session.getAttribute("user");
if (u == null) {
    // Redirect to login page if session is expired or user is not logged in
    response.sendRedirect("userlogin");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home - Student Performance Analytics</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }

        h2 {
            text-align: center;
            margin: 20px 0;
            color: #007bff;
            font-weight: bold;
        }

        .navbar {
            background-color: #343a40;
            padding: 10px;
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border-radius: 5px;
        }

        .navbar a:hover {
            background-color: #495057;
        }

        .welcome-box {
            text-align: center;
            margin: 50px auto;
            padding: 20px;
            max-width: 600px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .welcome-box h3 {
            color: #007bff;
            margin-bottom: 15px;
        }

        /* Footer styles */
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: auto;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        footer p {
            margin: 0;
            font-size: 0.9rem;
        }
    </style>
<script>
const sessionTimeoutMinutes = 1; // Match your server-side timeout in minutes

const sessionTimeoutSeconds = sessionTimeoutMinutes * 60; // Convert session timeout to seconds

// Log out after the session expires
setTimeout(() => {
    alert('Your session has expired. You will be logged out now.');
    window.location.href = '/userlogout'; // Redirect to the logout endpoint
}, sessionTimeoutSeconds * 1000); // Set timeout for logout in milliseconds


</script>

</head>
<body>

    <!-- Page Title -->
    <h2>Student Performance Analytics</h2>

    <!-- Navbar -->
    <div class="navbar">
        <a href="userhome">Home</a>
        <a href="userprofile">User Profile</a>
        <a href="userlogout">Logout</a>
    </div>

    <!-- Welcome Content -->
    <div class="welcome-box">
        <h3>Welcome to Your Dashboard</h3>
        <p>Hello, <strong><%= u.getName() %></strong>. We're glad to have you here!</p>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Student Performance Analytics. All Rights Reserved.</p>
    </footer>
</body>
</html>