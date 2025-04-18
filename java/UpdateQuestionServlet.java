package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbs.DbService;
import com.dto.Question;

/**
 * Servlet implementation class UpdateQuestionServlet
 */
@WebServlet("/UpdateQuestionServlet")
public class UpdateQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
        String question = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String correctOption = request.getParameter("correct_option");

        // Create Question object
        Question q = new Question();
        q.setId(id);
        q.setQuestion(question);
        q.setOption1(option1);
        q.setOption2(option2);
        q.setOption3(option3);
        q.setOption4(option4);
        q.setCorrectOption(correctOption);

        // Call DB service to update question
        DbService db = new DbService();
        boolean result = db.updateQuestion(q);

        if (result) {
            response.sendRedirect("ViewQuestionList.jsp?update=success");
        } else {
            response.sendRedirect("EditQuestion.jsp?id=" + id + "&update=error");
        }
		
	}

}
