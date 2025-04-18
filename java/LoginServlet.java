package com.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DbService;
import com.dto.UserDetails;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		HttpSession session = request.getSession();
		session.setAttribute("username", username);
		
		UserDetails u = new UserDetails();
		u.setUsername(username);
		u.setPassword(password);
		u.setRole(role);
		
		
		String target = "";
		
		DbService db = new DbService();
		
		if(role.equals("Admin")){  //when admin login
			boolean isValid1 = db.checkAdmin(u);
			if(isValid1==true)
			{
				target="/AdminDashboard.jsp";
			}
			else
			{
				target = "/login.jsp";
				request.setAttribute("msg", "<font color=red>Invalid Admin</font>");
			}
		} else{
			boolean isValid = db.checkUser(u);
			if(isValid) {
				target = "/StudentDashboard.jsp";
			}
			else {
				target = "/login.jsp";
				request.setAttribute("msg", "<font color=red>Invalid Username/Password</font>");
			}
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
