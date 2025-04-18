<%@ page import="java.util.*, com.dto.Result, com.dbs.DbService" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exam Results</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f0f0f0;
        }

        .container {
            width: 90%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            text-decoration: none;
            padding: 10px 20px;
            background: #28a745;
            color: white;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Student Exam Results</h2>

    <table>
        <thead>
            <tr>
                <th>Student Name</th>
                <th>Marks</th>
                <th>Date & Time</th>
            </tr>
        </thead>
        <tbody>
        <%
            DbService db = new DbService();
            List<Result> results = db.getAllResults();
            for (Result r : results) {
        %>
            <tr>
                <td><%= r.getStudentName() %></td>
                <td><%= r.getMarks() %></td>
                <td><%= r.getExamDate() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <a href="AdminDashboard.jsp" class="btn">Back to Dashboard</a>
</div>
</body>
</html>
