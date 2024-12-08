<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Styling for the content section */
        .content {
            margin-top: 50px;
            text-align: center;
            font-size: 24px;
            color: #007bff;
        }

        /* Footer styles */
        footer {
            background-color: #343a40;
            color: white;
            padding: 10px 0;
            text-align: center;
            margin-top: auto;
        }
    </style>
    <script>
        let logoutTimer;

        // Function to log out after inactivity
        function autoLogout() {
            alert("You have been logged out due to inactivity.");
            window.location.href = "logout"; // Redirect to the logout URL
        }

        // Function to reset the inactivity timer
        function resetTimer() {
            clearTimeout(logoutTimer); // Clear the previous timer
            logoutTimer = setTimeout(autoLogout, 10000); // Set a new timer for 10 seconds
        }

        // Event listeners to detect user activity
        window.onload = function () {
            resetTimer(); // Start the timer on page load
            document.onmousemove = resetTimer; // Detect mouse movement
            document.onkeypress = resetTimer; // Detect keypress
            document.onclick = resetTimer; // Detect mouse clicks
            document.onscroll = resetTimer; // Detect scrolling
        };
    </script>
</head>
<body>

<%@ include file="adminnavbar.jsp" %> <!-- Navbar -->

<!-- Content section -->
<div class="content">
    <h1>Welcome to Admin Home</h1>
    <p>Manage your system here.</p>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 Your Company. All rights reserved.</p>
</footer>

</body>
</html>
