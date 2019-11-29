package controller.supervisor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SupervisorLogoutController
 */
@WebServlet("/supervisor/logout")
public class SupervisorLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//세션 객체 얻기
	      HttpSession session = null;
	      session = req.getSession();
	      
	      session.removeAttribute("login");
	      session.removeAttribute("super_id");
	      session.removeAttribute("super_pw");
	      
	      resp.sendRedirect("/supervisor/login");
		}

}
