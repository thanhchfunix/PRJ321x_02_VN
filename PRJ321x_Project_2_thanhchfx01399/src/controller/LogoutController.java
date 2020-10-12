package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();  
        
		Cookie cUserName = new Cookie("cookuser", null);
		Cookie cPassword = new Cookie("cookpass", null);
		Cookie cRemember = new Cookie("cookrem", null);
		cUserName.setMaxAge(0);
		cPassword.setMaxAge(0);
		cRemember.setMaxAge(0);
		response.addCookie(cUserName);
		response.addCookie(cPassword);
		response.addCookie(cRemember);
		
		System.out.println("Logout successfully!");
    	request.getRequestDispatcher("/login").include(request, response);  
 
        HttpSession session=request.getSession();  
        session.invalidate();    
          
        out.close();  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
