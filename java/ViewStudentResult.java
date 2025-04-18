package com.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DbService;
import com.dto.Result;

/**
 * Servlet implementation class VeiwStudentResult
 */
@WebServlet("/ViewStudentResult")
public class ViewStudentResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewStudentResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String studentName = (String) session.getAttribute("username");

        DbService db = new DbService();
        List<Result> resultList = db.getStudentResults(studentName);
        System.out.println("Student: "+ studentName);

        request.setAttribute("results", resultList);
        RequestDispatcher rd = request.getRequestDispatcher("ViewStudentResult.jsp");
        rd.forward(request, response);
	}

}
