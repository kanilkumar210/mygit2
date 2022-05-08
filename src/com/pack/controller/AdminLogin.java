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
import com.pack.model.Admin;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginDao dao = new LoginDao();
	ServletContext ctx;
	RequestDispatcher rd;
	Admin admin = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLogin() {
		super();
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
		String user = request.getParameter("username");
		System.out.println(user);
		String pass = request.getParameter("password");
		System.out.println(user + " " + pass);
		admin = dao.getAdminByCredentials(user, pass);
		System.out.println(admin + " Servlet");
		if (admin != null) {
			rd = ctx.getRequestDispatcher("/adminHome.jsp");
			request.setAttribute("details", admin);
			rd.include(request, response);
		} else {
			out.println("<font color=red><h3> ***username or password invalid....</h3></font>");
			rd = ctx.getRequestDispatcher("/adminlogin.jsp");
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
		doGet(request, response);
	}

}
