package com.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbs.DbService;
import com.dto.Question;

/**
 * Servlet implementation class AddQuestionServlet
 */
@WebServlet("/AddQuestionServlet")
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String questionText = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String correctOption = request.getParameter("correct_option");

        Question question = new Question();
        question.setQuestion(questionText);
        question.setOption1(option1);
        question.setOption2(option2);
        question.setOption3(option3);
        question.setOption4(option4);
        question.setCorrectOption(correctOption);
        
        DbService db = new DbService();
		int x = 0;
		x = db.addQuestion(question);
		if(x>0) {
			request.setAttribute("msg", "<font color=blue>Question Added successfully</font>");
		} else {
			request.setAttribute("msg", "<font color=red>Error could not be added</font>");
		}
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/AddQuestion.jsp");
		rd.include(request, response);
	}

}
