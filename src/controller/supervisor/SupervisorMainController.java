package controller.supervisor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SupervisorMainController
 */
@WebServlet("/supervisor/main")
public class SupervisorMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 // 관리자 로그인 됐을 경우
	      if (req.getSession().getAttribute("login") != null) {
	         

		req.getRequestDispatcher("/WEB-INF/views/supervisor/supervisor_main.jsp").forward(req, resp);
	     }
	      else {
	    	  resp.sendRedirect("/supervisor/login");
	      }
	      
	}

	
	

}
