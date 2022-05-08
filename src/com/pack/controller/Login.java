package com.pack.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack.dao.LoginDao;
import com.pack.model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginDao dao = new LoginDao();
	ServletContext ctx;
	RequestDispatcher rd;
	User obj = new User();

	public void getUserDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ctx = getServletContext();
		request.setAttribute("user", this.obj);
		rd = ctx.getRequestDispatcher("userDetails.jsp");
		rd.include(request, response);
	}

	/**
	 * Default constructor.
	 */
	public Login() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		ctx = getServletContext();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		obj = dao.getObjectByCredentials(user, pass);
		if (obj != null && obj.getStatus().equalsIgnoreCase("F") && obj.getActivestatus().equalsIgnoreCase("active")) {
			rd = ctx.getRequestDispatcher("/resetpassword.jsp");
			request.setAttribute("details", obj);
			rd.include(request, response);
		} else if (obj != null && obj.getActivestatus().equalsIgnoreCase("active")) {
			rd = ctx.getRequestDispatcher("/accountSummary.jsp?id=" + obj.getCorporate_id());
			request.setAttribute("details", obj);
			rd.include(request, response);
		} else {
			out.println("<font color=red><h3> ***username or password invalid....</h3></font>");
			rd = ctx.getRequestDispatcher("/login.html");
			rd.include(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String pass = request.getParameter("pass");
		String confirmPass = request.getParameter("confirmPass");
		if (pass.equals(confirmPass)) {
			this.obj.setPassword(pass);
			this.obj.setStatus("NO");
			System.out.println(obj);
			int i = dao.resetPassword(obj);
			out.println("<font color=red><h3> ***Reset Password is Completed...!</h3></font>");
			rd = ctx.getRequestDispatcher("/login.html");
			rd.include(request, response);
		} else {
			out.println("<font color=red><h3> ***Enter Confirm Password Correctly...!</h3></font>");
			rd = ctx.getRequestDispatcher("/login.html");
			rd.include(request, response);
		}
	}

}
