<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="../css/admin-style.css">
    <title>Add Question</title>
    
    
    <style>
    		body {
	width: 99vw;
    height: 98vh;
    background: url('images/img2.jpg') no-repeat center center/cover;
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
    display:flex;
    justify-content: center;
    align-items: center;
}
 body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }
header {
            position: absolute;
            top: 7px;
            left: 50%;
            transform: translateX(-50%);
           background: rgba(255, 255, 255, 0.1);
            padding: 0px 10px;
            border-radius: 10px;
            color: white;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 15px;
            color: white;
            padding: 3px;
        }
        
        nav ul li {
            display: inline;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        
        .form-container{
        	max-height: 80%;
        	width: 60%;
        	background: rgb(101 94 94 / 61%);
    		padding: 20px;
    		box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
    		border-radius: 8px;
        	color: white;
        }
        
        form{
        	display: flex;
        	flex-direction: column;
        	gap: 1em;
        }
        
        footer{
        	text-align: center;
       		background: #222;
    		color: white;
     		height:50px;
     		font-size:0.9rem;
     		position: fixed;
    		bottom: 0;
    		width: 100%;
    		padding:8px;
     	}
    		
    	.form-container input{
            width: 95%;
            padding: 5px;
            margin: 5px 0;
            border: none;
            border-radius: 5px;
        }
    		
      #add-btn{
      	width: 20%;
    padding: 10px;
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
      }
      
      .btn-cont{
      	display:flex;
    	justify-content: center;
   		align-items: center;
      }
      
      .btn{
        	text-decoration : none;
        	width: 10%;
        	text-align: center;
    padding: 10px;
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-left: 20px;
        }
    </style>
    
</head>


<body>

	<header>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="signup.html">Register</a></li>
                <li><a href="#">About</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
    </header>

    <div class="form-container">
        <h2>Add New Question</h2>
        
        <p>
        <%
            String msg = (String)request.getAttribute("msg");
            if(msg!=null)
            {
            	out.print(msg);
            }
         %>
         </p>
        
        <form action="AddQuestionServlet" method="post">
            <label for="question">Question:</label>
            <textarea id="question" name="question" rows="4" required></textarea>

            <label for="option1">Option 1:</label>
            <input type="text" id="option1" name="option1" required>

            <label for="option2">Option 2:</label>
            <input type="text" id="option2" name="option2" required>

            <label for="option3">Option 3:</label>
            <input type="text" id="option3" name="option3" required>

            <label for="option4">Option 4:</label>
            <input type="text" id="option4" name="option4" required>

            <label for="correct_option">Correct Answer:</label>
            <input type="text" id="correct_option" name="correct_option" required>

            <div class="btn-cont">
            	<button type="submit"  id="add-btn">Add Question</button>
            	<a href="AdminDashboard.jsp" class="btn">Go Back</a>
            </div>
        </form>
    </div>
    
    <footer>
        &copy; 2025 Online Exam System | All Rights Reserved by Anisha & Deepika
    </footer>
</body>

</html>