<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LogIn</title>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: sans-serif;
	}
       body {
            background: url('images/img2.jpg') no-repeat center center/cover;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
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
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(255, 255, 255, 0.1);
            padding: 10px 20px;
            border-radius: 10px;
            color: white;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 15px;
            color: white;
        }
        
        nav ul li {
            display: inline;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        

/* Ensure the form moves down */
.signup-container {
    margin-top: 20px;  
    position: relative;
    text-align: center;
    z-index: 2;
}

        .signup-container {
            background: rgb(101 94 94 / 32%);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
            width: 30%;
            
            
        }
        .signup-container h2 {
            color: white;
            margin-bottom :15px;
        }
        .signup-container input, .signup-container select {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: none;
            border-radius: 5px;
        }
        .signup-container button {
            width: 90%;
            padding: 10px;
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .signup-container button:hover {
            background-color: #e60000;
        }
        .signup-container a {
            display: block;
            margin-top: 10px;
            color: yellow;
            text-decoration: none;
        }
        form{
        	display: flex;
        	flex-direction: column;
        	gap:10px;
        	justify-content: center;
        	align-items: flex-start;
        	font-weight: bold;
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
    
    <div class="signup-container">
        <h2>Login to your Account</h2>
        <p>
        <%
            String msg = (String)request.getAttribute("msg");
            if(msg!=null)
            {
            	out.print(msg);
            }
         %>
         </p>
        
        <form action="LoginServlet" method="post">
        	<label>UserName</label>
            <input type="text" name="username" placeholder="Enter username" required>
            <label>Password</label>
            <input type="password" id="password" name="password" placeholder="Enter password">
            <button type="button" id="toggleBtn" onclick="togglePassword()">&#128065;Show</button>
            
            <script>
                function togglePassword() {
                    var passwordField = document.getElementById("password");
                    var toggleBtn = document.getElementById("toggleBtn");
            
                    if (passwordField.type === "password") {
                        passwordField.type = "text";
                        toggleBtn.innerHTML = "&#128065; Hide";
                    } else {
                        passwordField.type = "password";
                        toggleBtn.innerHTML = "&#128065; Show";
                    }
                }
            </script>
            

            <select name="role">
                <option value="Admin">Admin</option>
                <option value="Student">Student(Undergraduate)</option>
                <option value="Student">Student(Postgraduate)</option>
                <option value="Professionals">Professionals</option>
            </select>
            <button type="submit">Login</button>
        </form>
        <a href="register.jsp">If not register? Register here</a>
    </div>
    
     <footer>
        &copy; 2025 Online Exam System | All Rights Reserved by Anisha & Deepika
    </footer>

</body>
</html>