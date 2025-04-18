<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Your Account</title>
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
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 15px;
        }
        
        nav ul li {
            display: inline;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        
        .container {
            width: 80%;
            max-width: 600px;
           /*background: rgba(255, 255, 255, 0.2); */
           background: rgb(101 94 94 / 32%);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
            display:flex;
            flex-direction: column;
            justify-content: center;
            gap:25px;
        }
        
        h2 {
            text-align: center;
            
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        label {
            font-weight: bold;
            color: #f2f2f2;
        }
        
        input, select, textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background: rgba(255, 255, 255, 0.8);
            color: black;
        }
        
        .gender-group {
            display: flex;
        }
        
       #terms-and-conditions{
         	display: flex;
         	justify-content: flex-start;
         	align-items: center;
        }
       #terms{
       	width:auto;
       }
        
        .register-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .register-btn:hover {
    		background: linear-gradient(135deg, #ff4b2b, #ff416c);
    		transform: scale(1.05);
    		box-shadow: 0px 4px 10px rgba(255, 65, 108, 0.3);
    		transition: all 0.3s ease-in-out;
        }
        
        .container a {
            display: block;
            
            color: yellow;
            text-decoration: none;
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
  

    <div class="container">
        <h2>Register Your Account</h2>
        
        <p>
        <%
            String msg = (String)request.getAttribute("msg");
            if(msg!=null)
            {
            	out.print(msg);
            }
         %>
         </p>
        
        <form action="RegisterServlet" method="post">
        
        	<div class="form-group">
                <label for="name">Roll Number</label>
                <input type="text" id="name" placeholder="Enter your roll no" name="rollno" required>
            </div>
        
            <div class="form-group">
                <label for="name">Student Name</label>
                <input type="text" id="name" placeholder="Enter your full name" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" placeholder="Enter your email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="role">Role</label>
                <select name="role" id="role">
                <option value="Student">Student(Undergraduate)</option>
                <option value="Student">Student(Postgraduate)</option>
                <option value="Professionals">Professionals</option>
            </select>
            </div>
            
            
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" placeholder="Enter your DOB" name="dob" required>
            </div>
            
            <div class="form-group">
                <label for="qualification">Qualification</label>
                <input type="text" id="qualification" placeholder="Enter your Qualification" name="qualification" required>
            </div>
            
            <div class="form-group gender-group">
                <label>Gender:</label>
                <input type="radio" id="male" name="gender" value="Male">
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="Female">
                <label for="female">Female</label>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" placeholder="Enter your password" name="password" required>
            </div>
            
            <div class="form-group  id="terms-and-conditions">
                <input type="checkbox" id="terms" required>
                <label for="terms">I agree to the Terms & Conditions</label>
            </div>
            
            <button type="submit" class="register-btn">Register</button>
        </form>
        
        <a href="login.jsp">If Already registered? Login here</a>
    </div>
    
    <footer>
        &copy; 2025 Online Exam System | All Rights Reserved by Anisha & Deepika
    </footer>

    <script src="script.js"></script>
    <script src="popup.js"></script>

</body>
</html>