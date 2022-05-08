package com.pack.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack.dao.LoginDao;
import com.pack.model.User;

/**
 * Servlet implementation class UpdateUserDetails
 */
@WebServlet("/UpdateUserDetails")
public class UpdateUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	LoginDao dao = new LoginDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserDetails() {
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

		User user = dao.getUser(Integer.parseInt(request.getParameter("id")));

		request.setAttribute("details", user);
		RequestDispatcher rd = request.getRequestDispatcher("/updateUserDetails.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		User user = new User();
		int corId = Integer.parseInt(request.getParameter("corporateId"));
		user.setLogin_id(Long.parseLong(request.getParameter("loginId")));
		System.out.println(user.getLogin_id());
		user.setAddress(request.getParameter("address"));
		user.setDepartment(request.getParameter("department"));
		user.setMobileNumber(Long.parseLong(request.getParameter("mobNumber")));
		int i = dao.update(user);
		String corname = dao.getCorName(corId);
		System.out.println(user.getAddress() + " address");
		if (i > 0) {
			response.sendRedirect("userList.jsp?id=" + corname);
		}
	}

}
