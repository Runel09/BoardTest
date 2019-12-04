package controller.supervisor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.supervisor.face.SupervisorService;
import service.supervisor.impl.SupervisorServiceImpl;

/**
 * Servlet implementation class SupervisorMemberDeleteController
 */
@WebServlet("/supervisor/memberdelete")
public class SupervisorMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SupervisorService supervisorservice = new SupervisorServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String[] check = req.getParameterValues("check");

		if( check != null )	supervisorservice.deleteCheckuserno(check);

		resp.sendRedirect("/supervisor/memberlist");
	}

}
