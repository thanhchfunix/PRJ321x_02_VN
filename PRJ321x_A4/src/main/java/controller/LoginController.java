/**
 * 
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.DatabaseShopping;
import model.User;

/**
 * @author CatHuyThanh
 *
 */
@Controller
public class LoginController {
	
	private ApplicationContext context = null;
    private DatabaseShopping db = null;

    public LoginController() {
        context = new ClassPathXmlApplicationContext("IoC.xml");
        db = (DatabaseShopping) context.getBean("userJDBCTemplate");
    }

	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User user = new User(username, password, 1);
		
		if (username != null && password != null) {
			if (db.checkLogin(user) == true) {
				return new ModelAndView("confirmation", "username", username);
			} else {
				return new ModelAndView("login", "error", "Username or password is invalid");
			}
		}
		return new ModelAndView("login", "error", "Please enter username and password");
	}	
}
