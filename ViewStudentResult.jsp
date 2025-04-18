<%@ page import="java.util.List" %>
<%@ page import="com.dto.Result" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Results</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f9f9f9;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 70%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>Your Exam Results</h2>
    <table>
        <tr>
            <th>Student Name</th>
            <th>Marks</th>
            <th>Date & Time</th>
        </tr>
        <%
            List<Result> results = (List<Result>) request.getAttribute("results");
            if (results != null && !results.isEmpty()) {
                for (Result r : results) {
        %>
        <tr>
            <td><%= r.getStudentName() %></td>
            <td><%= r.getMarks() %></td>
            <td><%= r.getExamDate() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No results found</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
