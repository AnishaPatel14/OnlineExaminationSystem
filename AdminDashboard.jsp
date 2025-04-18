<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="../css/admin-style.css">
    <title>Admin Dashboard</title>
    <style>
    		/* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}



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
    width: 600px;
    margin: 80px auto;
   background: rgb(101 94 94 / 61%);
    padding: 20px;
    box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
    border-radius: 8px;
    text-align: center;
    color: white;
}

/* Header Styles */
h1 {
    margin-bottom: 30px;
    color: #333;
    font-size: 28px;
    color: white;
}

/* Button Container */
.btn-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
    margin-top: 20px;
}

/* Button Styles */
.btn {
    display: inline-block;
    padding: 12px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    color: white;
    border-radius: 8px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 3px 8px rgba(0, 123, 255, 0.3);
    margin-top: 30px;
}

.btn:hover {
    background-color: #0056b3;
    transform: translateY(-3px);
}

/* Logout Button Special Style */
.btn:last-child {
    background-color: #dc3545;
}

.btn:last-child:hover {
    background-color: #c82333;
}

/* Responsive Design */
@media (max-width: 768px) {
    .btn-container {
        grid-template-columns: 1fr;
    }

    .container {
        width: 90%;
        padding: 15px;
    }

    h1 {
        font-size: 24px;
    }

    .btn {
        font-size: 14px;
        padding: 10px 15px;
    }
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

    <div class="container">
        <h1>Admin Dashboard</h1>
        <div class="btn-container">
    		<button class="btn" onclick="location.href='AddQuestion.jsp'">Add Question</button>
    		<button class="btn" onclick="location.href='ViewQuestionList.jsp'">View Question list</button>
    		<button class="btn" onclick="location.href='ViewStudentList.jsp'">Registered Students</button>
    		<button class="btn" onclick="location.href='ViewResult.jsp'">View Results</button>
		</div>
		
		<a class="btn" href="Logout.jsp">Logout</a>

    </div>
    
    <footer>
        &copy; 2025 Online Exam System | All Rights Reserved by Anisha & Deepika
    </footer>
    
</body>

</html>
