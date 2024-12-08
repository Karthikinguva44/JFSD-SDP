<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%@ taglib uri="jakarta.tags.core" prefix="c" %> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="navbar-inner">
            <ul>
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
            </ul>
        </div>
    </div>

    <div class="container">
        <h2>Feedback Form</h2>

        <form action="${pageContext.request.contextPath}/submitfeedback" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required class="form-control">
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required class="form-control">
            </div>

            <div class="form-group">
                <label for="message">Feedback:</label>
                <textarea id="message" name="message" required class="form-control"></textarea>
            </div>

            <button type="submit" class="btn">Submit Feedback</button>
        </form>
        <c:if test="${not empty feedbackMessage}">
            <div class="alert alert-success">
                <strong>Success!</strong> ${feedbackMessage}
            </div>
        </c:if>
    </div>

    <footer>
        <p>&copy; 2024 Your Organization. All rights reserved.</p>
    </footer>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        
        .navbar-inner ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }
        
        .navbar-inner li {
            margin: 0 10px;
        }
        
        .navbar-inner a {
            color: white;
            text-decoration: none;
            padding: 14px 20px;
            display: block;
        }
        
        .navbar-inner a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-control:focus {
            border-color: #4CAF50;
            outline: none;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        .alert {
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            margin-top: 20px;
            border-radius: 5px;
        }

        footer {
            text-align: center;
            background-color: #333;
            color: white;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</body>
</html>
