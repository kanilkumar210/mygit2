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
//import javax.servlet.http.HttpSession;

import com.pack.dao.AccountDao;
import com.pack.dao.LoginDao;
import com.pack.model.Account;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	LoginDao dao = new LoginDao();
	AccountDao accDao = new AccountDao();
	ServletContext ctx;
	RequestDispatcher rd;

	public AccountServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
		switch (action) {
		case "add":
			insert(request, response);
			break;
		/*
		 * case "update": update(request,response); break;
		 */
		case "delete":
			delete(request, response);
			break;
		case "deleteAccount":
			deleteAccount(request, response);
			break;
		}

	}

	private void deleteAccount(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		String corname = request.getParameter("corname");
		int i = accDao.delete(id);
		System.out.println(corname + " corname in delete Account");
		if (i > 0) {
			PrintWriter out = response.getWriter();
			ctx = getServletContext();
			response.setContentType("text/html");
			out.println("<font color=red><h3> ***Account Deleted Successfully...!</h3></font>");
			rd = ctx.getRequestDispatcher("/getAccounts.jsp?id=" + corname);
			rd.include(request, response);
		} else {
			response.sendRedirect("addacc-error.jsp");
		}
	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Account account = new Account();
		account.setCorporateId(Long.parseLong(request.getParameter("corporate_id")));
		System.out.println(account.getCorporateId());
		account.setAccountNumber(Long.parseLong(request.getParameter("account_number")));
		account.setAccountName(request.getParameter("account_name"));
		account.setBranch(request.getParameter("branch"));
		account.setCurrency(request.getParameter("currency"));
		account.setAvailBal(Long.parseLong(request.getParameter("available_balance")));
		// account.setStatus("P");
		int i = accDao.save(account);
		String corname = dao.getCorName(account.getCorporateId());
		System.out.println(corname + " corname");
		if (i > 0) {
			response.sendRedirect("getAccounts.jsp?id=" + corname);
		} else {
//			response.sendRedirect(request);

		}
	}

	/*
	 * protected void update(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * 
	 * 
	 * 
	 * 
	 * Corporate corporate=new Corporate();
	 * System.out.println("in update of servlet");
	 * corporate.setCorporate_id(Integer.parseInt(request.getParameter(
	 * "corporate_id")));
	 * corporate.setCorporateName(request.getParameter("corporate_name"));
	 * corporate.setAddress(request.getParameter("address"));
	 * corporate.setPhoneNumber(request.getParameter("phonenumber"));
	 * 
	 * 
	 * System.out.println("in servlet "+corporate.getCorporate_id()+" "+corporate.
	 * getCorporateName()+" "+corporate.getAddress()+" "+corporate.getPhoneNumber())
	 * ; int i=corDao.update(corporate); if(i>0){ response.sendRedirect("view.jsp");
	 * }else { response.sendRedirect("addcorp-error.jsp"); }
	 * 
	 * 
	 * }
	 */

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		int i = accDao.delete(id);
		if (i > 0) {
			response.sendRedirect("view1.jsp");
		} else {
			response.sendRedirect("addacc-error.jsp");
		}

	}
}
