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
 * Servlet implementation class SupervisorPlaceDelete
 */
@WebServlet("/supervisor/placedelete")
public class SupervisorPlaceDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SupervisorService supervisorservice= new SupervisorServiceImpl();
		
		supervisorservice.placeDelete(req);
		
		resp.sendRedirect("/place/view?place_number=29");
	}
}
