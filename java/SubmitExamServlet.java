package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DbService;

/**
 * Servlet implementation class SubmitExamServlet
 */
@WebServlet("/SubmitExamServlet")
public class SubmitExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitExamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
//        int score = 0;

        try {
            // Get connection from DBConnection class
        	Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamsystem", "root", "root");


            String query = "SELECT question, correct_option FROM questiontable";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            Map<String, String> correctAnswers = new HashMap<>();
            while (rs.next()) {
                correctAnswers.put(rs.getString("question"), rs.getString("correct_option"));
            }

            // Check student's answers
            int score = 0;
            for (Map.Entry<String, String> entry : correctAnswers.entrySet()) {
                String questionText = entry.getKey();
                String correctAnswer = entry.getValue();
                String userAnswer = request.getParameter(questionText);

//                System.out.println("Question: " + questionText);
//                System.out.println("Correct Answer: " + correctAnswer);
//                System.out.println("User Answer: " + userAnswer);

                if (correctAnswer != null && correctAnswer.equalsIgnoreCase(userAnswer)) {
                    score++;
                }
            }
            
            
         //  Get student name (either from session or request)
            HttpSession session = request.getSession();
            String studentName = (String) session.getAttribute("studentName");

            if (studentName == null || studentName.isEmpty()) {
                studentName = request.getParameter("studentName");  // fallback
            }

            //Save result to DB
            DbService db = new DbService();
            db.saveResult(studentName, score);
            

            // Send result back to student
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><head><style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f5f5f5; margin: 0; padding: 0; }");
            out.println(".container { width: 50%; margin: 100px auto; background-color: #fff; padding: 20px; ");
            out.println("box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); text-align: center; border-radius: 10px; }");
            out.println(".btn { padding: 10px 20px; font-size: 16px; background-color: #4CAF50; color: white; ");
            out.println("border: none; border-radius: 5px; cursor: pointer; text-decoration: none; }");
            out.println(".btn:hover { background-color: #45a049; }");
            out.println("</style></head><body>");
            out.println("<div class='container'>");
            out.println("<h2>Exam Submitted Successfully!</h2>");
            out.println("<p>Your Score: <strong>" + score + "/" + correctAnswers.size() + "</strong></p>");
            out.println("<br><a href='StudentDashboard.jsp' class='btn'>Back to Dashboard</a>");
            out.println("</div></body></html>");
            

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
	}

}
