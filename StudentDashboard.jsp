<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    
    <style>
    		/* styles.css */

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
            top: 10px;
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
            padding: 5px;
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
    width: 800px;
    margin: 200px auto;
    background: rgb(101 94 94 / 61%);
    padding: 20px;
    box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
    border-radius: 8px;
    display:flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 20px;
    color: white;
}

h2 {
    text-align: center;
    margin-bottom: 20px;
    font-size: xx-large;
}

.card {
    margin-top: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s;
    box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
    padding: 10px;
}

.card:hover {
    transform: scale(1.05);
}

.card-body {
    text-align: center;
}

.card-title{
	font-size: large;
}

.btn {
    width: 100%;
}

a{
	text-decoration none; 
}

.logout-btn .btn{
	color: white;
	padding: 7px;
	font-size: 1em;
 	width: 100px;
 	height: 30px;
 	background: linear-gradient(to right, #ff416c, #ff4b2b); 
 	
}



/* Additional styles for student dashboard */
.dashboard-container {
    display: flex;
    justify-content: center;
    gap: 20px;
    flex-wrap: wrap;
}

.dashboard-card {
    width: 300px;
    padding: 15px;
    background-color: #f1f1f1;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.dashboard-card h3 {
    margin-bottom: 15px;
}

a{
	text-decoration: none;
}

.card-body button,  .card-body a{
	width: 50%;
    padding: 10px;
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    padding-bottom: 5px;
}

.card-body button:hover {
            background-color: #e60000;
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
    
    <%
    		HttpSession session1 = request.getSession();
			 if(session1 != null && session1.getAttribute("username") != null){
				 String username = (String) session1.getAttribute("username");
				 
			session1.setAttribute("username", username);
    %>

    <div class="container">
        <h2>Welcome Student, <%= username %>!</h2>
        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Take Exam</h5>
                        <p class="card-text">Start your scheduled exam and submit your answers.</p>
                        <button onclick="location.href='StartExam.jsp'">Start Exam</button>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">View Results</h5>
                        <p class="card-text">Check your previous exam results and performance.</p>
                        <button onclick="location.href='ViewStudentResult'">View My Results</button>

                    </div>
                </div>
            </div>
            	
        </div>
        
        <div class="logout-btn">
               		<a class="btn" href="Logout.jsp">Logout</a>
         </div>
         
         <%
			 }else{
				 response.sendRedirect("login.jsp");
			 }
         %>
    </div>

    <footer>
        &copy; 2025 Online Exam System | All Rights Reserved by Anisha & Deepika
    </footer>
</body>
</html>
