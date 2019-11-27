package controller.supervisor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.supervisor.Supervisor;
import service.supervisor.face.SupervisorService;
import service.supervisor.impl.SupervisorServiceImpl;

/**
 * Servlet implementation class AdminLoginController
 */
@WebServlet("/supervisor/login")
public class SupervisorLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//SupervisorService 객체
	private SupervisorService supervisorservice = new SupervisorServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/supervisor/supervisor_login.jsp").forward(req, resp);		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//로그인 정보 얻어오기
		Supervisor supervisor = supervisorservice.getLoginMember(req);
		
		//로그인 인증	
		boolean login = supervisorservice.login(supervisor);
		
		if(login) {

			//로그인 사용자 정보 얻어오기
			supervisor = supervisorservice.getMemberByUserid(supervisor);
			
			//세션정보 저장
			req.getSession().setAttribute("login", login);
			req.getSession().setAttribute("super_id", supervisor.getSuper_id());
			req.getSession().setAttribute("super_pw", supervisor.getSuper_pw());
			
		}
		

				
	}

}
