<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="../css/admin-style.css">
    <title>Question List</title>
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
    </style>
</head>

<body>
    <div class="container">
        <h2>All Question List</h2>

        <table id="questionsTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Correct Option</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Questions will be dynamically loaded here using JSP -->
                <%@ page import="java.util.List" %>
                <%@ page import="com.dto.Question" %>
                <%@ page import="com.dbs.DbService" %>

                <%
                    DbService db = new DbService();
                    List<Question> questionsList = db.getAllQuestions();

                    for (Question q : questionsList) {
                %>
                <tr>
                    <td><%= q.getId() %></td>
                    <td><%= q.getQuestion() %></td>
                    <td><%= q.getOption1() %></td>
                    <td><%= q.getOption2() %></td>
                    <td><%= q.getOption3() %></td>
                    <td><%= q.getOption4() %></td>
                    <td><%= q.getCorrectOption() %></td>
                    <td>
                        <a href="EditQuestion.jsp?id=<%= q.getId() %>" class="btn-action">Edit</a>
                        <a href="DeleteQuestionServlet?id=<%= q.getId() %>" class="btn-action delete">Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <br>
        <a href="AddQuestion.jsp" class="btn">Add New Question</a>
        <a href="AdminDashboard.jsp" class="btn">Go Back</a>
    </div>
</body>

</html>
