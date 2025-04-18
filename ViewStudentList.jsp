<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="../css/admin-style.css">
    <title>Registered Students</title>
    <style>
    	body{
    		font-family: Arial, sans-serif;
    		background-color: rgb(101 94 94 / 61%);
    	}
    
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn-action {
            padding: 8px 12px;
            font-size: 14px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 2px;
            text-decoration: none;
        }

        .btn-action.delete {
            background-color: #dc3545;
        }

        .btn-action:hover {
            opacity: 0.9;
        }
        
        .btn{
        	text-decoration : none;
        	width: 30%;
    padding: 10px;
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Registered Students</h2>

        <table id="studentsTable">
            <thead>
                <tr>
                    <th>RollNo</th>
                    <th>Student Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Date of Birth</th>
                    <th>Qualification</th>
                    <th>Gender</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <!-- Student data will be dynamically loaded here using JSP -->
                <%@ page import="java.util.List" %>
                <%@ page import="com.dto.UserDetails" %>
                <%@ page import="com.dbs.DbService" %>

                <%
                DbService db = new DbService();
                    List<UserDetails> studentList = db.getAllStudents();

                    for (UserDetails s : studentList) {
                %>
                <tr>
                    <td><%= s.getRollno() %></td>
                    <td><%= s.getUsername()%></td>
                    <td><%= s.getEmail() %></td>
                    <td><%= s.getRole() %></td>
                    <td><%= s.getDob() %></td>
                    <td><%= s.getQualification() %></td>
                    <td><%= s.getGender() %></td>
                    <td><%= s.getPassword() %></td>
                    
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <br>
        <a href="AdminDashboard.jsp" class="btn">Go Back</a>
    </div>
</body>

</html>
