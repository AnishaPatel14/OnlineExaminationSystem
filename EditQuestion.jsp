<%@ page import="java.sql.*, com.dto.Question, com.dbs.DbService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
	//System.out.println("id = " +id);
    DbService db = new DbService();
    Question q = db.getQuestionById(id);
%>

<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        select {
            padding: 10px;
            margin-top: 5px;
            width: 100%;
        }

        .btn {
            padding: 10px 20px;
            margin-top: 15px;
            font-size: 16px;
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
    <title>Edit Question</title>
</head>

<body>
    <div class="container">
        <h2>Edit Question</h2>
        
     <p style="color: red;">   
     <%
    	String msg = (request.getParameter("update"));
     	if(msg != null){
     		out.print(msg);
     	}
	 %>
     </p>
        
        <form action="UpdateQuestionServlet" method="post">
            <input type="hidden" name="id" value="<%= q.getId() %>" />

            <label>Question:</label>
            <input type="text" name="question" value="<%= q.getQuestion() %>" required />

            <label>Option A:</label>
            <input type="text" name="option1" value="<%= q.getOption1() %>" required />

            <label>Option B:</label>
            <input type="text" name="option2" value="<%= q.getOption2() %>" required />

            <label>Option C:</label>
            <input type="text" name="option3" value="<%= q.getOption3() %>" required />

            <label>Option D:</label>
            <input type="text" name="option4" value="<%= q.getOption4() %>" required />

            <label>Correct Option:</label>
            <input type="text" name="correct_option" value="<%= q.getCorrectOption() %>" required />

            <button type="submit" class="btn">Update Question</button>
        </form>
        
    </div>
</body>

</html>
