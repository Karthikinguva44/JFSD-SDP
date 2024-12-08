<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Students Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
        }
        .styled-table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 1em;
            background-color: #ffffff;
            text-align: left;
        }
        .styled-table th, .styled-table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
        }
        .styled-table th {
            background-color: #007bff;
            color: #ffffff;
            text-transform: uppercase;
        }
        .styled-table tr:nth-child(even) {
            background-color: #f3f3f3;
        }
        .styled-table tr:hover {
            background-color: #f1f1f1;
        }
        .back-link {
            display: block;
            text-align: center;
            margin: 20px 0;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Students Report</h1>
        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Registration ID</th>
                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>Attendance</th>
                    <th>Passed</th>
                    <th>Failed</th>
                    <th>Total Marks</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="mark" items="${marksList}">
                    <tr>
                        <td>${mark.id}</td>
                        <td>${mark.studentName}</td>
                        <td>${mark.regId}</td>
                        <td>${mark.courseCode}</td>
                        <td>${mark.courseName}</td>
                        <td>${mark.attendance}</td>
                        <td>${mark.passed}</td>
                        <td>${mark.failed}</td>
                        <td>${mark.totalMarks}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a class="back-link" href="<c:url value='/admin/home'/>">Back to Admin Home</a>
    </div>
</body>
</html>
