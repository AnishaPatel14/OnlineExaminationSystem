package com.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbs.DbService;
import com.dto.UserDetails;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDetails u = new UserDetails();
		u.setRollno(Integer.parseInt(request.getParameter("rollno")));
		u.setUsername(request.getParameter("username"));
		u.setEmail(request.getParameter("email"));
		u.setRole(request.getParameter("role"));
		u.setDob(request.getParameter("dob"));
		u.setQualification(request.getParameter("qualification"));
		u.setGender(request.getParameter("gender"));
		u.setPassword(request.getParameter("password"));
		
		
		DbService db = new DbService();
		int x = 0;
		x = db.registerUser(u);
		if(x>0) {
			request.setAttribute("msg", "<font color=blue>Register Successfull</font>");
		} else {
			request.setAttribute("msg", "<font color=red>Error Register Unsuccessfull</font>");
		}
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
		rd.include(request, response);
	}

}
