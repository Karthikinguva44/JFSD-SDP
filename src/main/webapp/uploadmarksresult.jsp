<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Marks Result</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .content {
            margin-top: 50px;
            text-align: center;
        }
    </style>
</head>
<body>

<%@ include file="adminnavbar.jsp" %> <!-- Include Navbar -->

<!-- Result Section -->
<div class="content">
    <div class="alert alert-info" style="max-width: 600px; margin: 0 auto; background-color: #dff0d8; border-radius: 8px;">
        <h4>${message}</h4>
    </div>
</div>

</body>
</html>
