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
 * Servlet implementation class AddUserDetails
 */
@WebServlet("/AddUserDetails")
public class AddUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	LoginDao dao = new LoginDao();
	ServletContext ctx;
	RequestDispatcher rd;
	User user = null;
	String p1 = null;
	String p2 = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddUserDetails() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		ctx = getServletContext();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		p1 = request.getParameter("pass");
		p2 = request.getParameter("confirmPass");
		if (!p1.equals(p2)) {
			out.println("<body bgcolor=pink><font color=red> ***Enter Correct Password....</font></body>");
			rd = ctx.getRequestDispatcher("/registerUser.jsp");
			rd.include(request, response);
		} else {
			user = new User();
			user.setPassword(p1);
			user.setCorporate_id(Integer.parseInt(request.getParameter("corporateId")));
			user.setLogin_id(Integer.parseInt(request.getParameter("loginId")));
			user.setAddress(request.getParameter("address"));
			user.setDepartment(request.getParameter("department"));
			user.setMobileNumber(Long.parseLong(request.getParameter("mobNumber")));
			user.setUsername(request.getParameter("user"));
			int i = dao.addUser(user);
			String corname = dao.getCorName(user.getCorporate_id());
			if (i >= 1) {
				out.println("registerd Successfully....");
				response.sendRedirect("userList.jsp?id=" + corname);
				System.out.println("userList.jsp?id=" + corname);
			} else {
				rd = ctx.getRequestDispatcher("/registerUser.jsp");
				rd.include(request, response);
			}
		}

	}
}
