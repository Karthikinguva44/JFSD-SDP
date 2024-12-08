<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Admin Dashboard</title>
    <style>
        .navbar-custom {
            background-color: #343a40;
            padding: 10px;
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .navbar-custom .navbar-brand,
        .navbar-custom .navbar-nav > li > a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border-radius: 5px;
        }

        .navbar-custom .navbar-nav > li > a:hover {
            background-color: #495057;
        }

        .header-title {
            text-align: center;
            margin: 20px 0;
            color: #007bff;
            font-weight: bold;
        }

    </style>
</head>
<body>
    <!-- Admin Header -->
    <h2 class="header-title">Student SDP Project</h2>

    <!-- Admin Navbar -->
    <nav class="navbar navbar-custom">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="adminhome">Home</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="viewallusers">View All Users</a></li>
            <li><a href="deleteuser">Delete User</a></li>
            <li><a href="viewuserbyid">View User By Id</a></li>
            <li><a href="uploadmarks">Upload Marks</a></li> <!-- New Upload Marks Link -->
            <li><a href="students-report">Students Report</a></li> <!-- New Upload Marks Link -->
            <li><a href="adminlogin">Logout</a></li>
        </ul>
    </div>
</nav>

</body>
</html>
