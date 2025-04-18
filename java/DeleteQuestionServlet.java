package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbs.DbService;

/**
 * Servlet implementation class DeleteQuestionServlet
 */
@WebServlet("/DeleteQuestionServlet")
public class DeleteQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DbService db = new DbService();
		String s = request.getParameter("id");
		int id = -1;
		 if (s!= null) id = Integer.parseInt(s);
//		System.out.println("id = "+ s);
        boolean result = db.deleteQuestion(id);
        if (result) {
            response.sendRedirect("ViewQuestionList.jsp?success=true");
        } else {
            response.sendRedirect("ViewQuestionList.jsp?error=true");
        }
	}


}
