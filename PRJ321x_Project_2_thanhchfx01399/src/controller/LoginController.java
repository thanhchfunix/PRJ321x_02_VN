package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	    processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		try {
			request.getSession(true).invalidate();
			// make sure that email is valid
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";
			// collect data from a login form
			String user = request.getParameter("username");
			String password = request.getParameter("password");
			Account acc = new Account();
			acc.setName(user);
			acc.setPwd(password);
			HttpSession session = request.getSession(true);
			if (!password.matches(regex) || !user.matches(regexMail)) {
				session.setAttribute("error", "invalid syntax");
				response.sendRedirect("login.jsp");
			}
			// read information of account in web.xml
			String uid = getServletContext().getInitParameter("username");
			String pwd = getServletContext().getInitParameter("password");
			// check account - use validate code in assignment 1 to valid user
			if (user != null && acc.getPwd().equals(pwd) && acc.getName().equalsIgnoreCase(uid)) {
				
				//save form data to cookie when check remember me
				if (request.getParameter("remember") != null) {
					String remember = request.getParameter("remember");
					Cookie cUserName = new Cookie("cookuser", user.trim());
					Cookie cPassword = new Cookie("cookpass", password.trim());
					Cookie cRemember = new Cookie("cookrem", remember.trim());
					cUserName.setMaxAge(60 * 60 * 24 * 15);// 15 days
					cPassword.setMaxAge(60 * 60 * 24 * 15);
					cRemember.setMaxAge(60 * 60 * 24 * 15);
					response.addCookie(cUserName);
					response.addCookie(cPassword);
					response.addCookie(cRemember);
				}
				
				// set session
				session.setAttribute("user", user);
				// login is valid, now redirect to index page of admin
				response.sendRedirect("admin/index.jsp");
			} else {
				session.setAttribute("error", "wrong username or password");
				response.sendRedirect("login.jsp");
			}
		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} catch (Exception ex) {
			response.getWriter().println(ex);
		}

	}
}
