<%@ page import="java.sql.*, java.util.*" %>
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
            width: 60%;
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

        .timer {
            font-size: 18px;
            font-weight: bold;
            color: #ff0000;
            text-align: right;
        }

        .question {
            margin-bottom: 20px;
        }

        .question p {
            font-size: 18px;
            font-weight: bold;
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        // Countdown Timer: 30 Minutes
        var timeLeft = 30 * 60;

        function startTimer() {
            var timerDisplay = document.getElementById("timer");

            var countdown = setInterval(function () {
                var minutes = Math.floor(timeLeft / 60);
                var seconds = timeLeft % 60;

                timerDisplay.innerHTML = minutes + "m " + (seconds < 10 ? "0" : "") + seconds + "s";

                if (timeLeft <= 0) {
                    clearInterval(countdown);
                    alert("Time is up! Submitting the exam.");
                    document.getElementById("examForm").submit();
                }
                timeLeft--;
            }, 1000);
        }

        window.onload = startTimer;
    </script>
    <title>Start Exam</title>
</head>

<body>

	<% 
		HttpSession session1 = request.getSession();
	 	if(session1 != null && session1.getAttribute("username") != null){
		 String username = (String) session1.getAttribute("username");
		 session1.setAttribute("studentName", username);
	 	}
	%>

    <div class="container">
        <h2>Online Exam</h2>
        <div id="timer" class="timer">30m 00s</div>

        <form action="SubmitExamServlet" method="post" id="examForm">
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamsystem", "root", "root");

                    String query = "SELECT * FROM questiontable ORDER BY RAND() LIMIT 20";
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();

                    int questionNumber = 1;
                    while (rs.next()) {
                        String question = rs.getString("question");
                        String optionA = rs.getString("option1");
                        String optionB = rs.getString("option2");
                        String optionC = rs.getString("option3");
                        String optionD = rs.getString("option4");
            %>
            <div class="question">
                <p><%= questionNumber %>. <%= question %></p>
                <input type="radio" name="<%= question %>" value="<%= optionA %>" required> A. <%= optionA %><br>
                <input type="radio" name="<%= question %>" value="<%= optionB %>"> B. <%= optionB %><br>
                <input type="radio" name="<%= question %>" value="<%= optionC %>"> C. <%= optionC %><br>
                <input type="radio" name="<%= question %>" value="<%= optionD %>"> D. <%= optionD %><br>
            </div>
            <%
                    questionNumber++;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } 
            %>

            <button type="submit" class="btn">Submit Exam</button>
        </form>
    </div>
</body>

</html>
