package controller.supervisor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.place.PlaceDto;
import dto.place.PlaceFile;
import service.place.face.PlaceService;
import service.place.impl.PlaceServiceImpl;
import service.supervisor.face.SupervisorService;
import service.supervisor.impl.SupervisorServiceImpl;

/**
 * Servlet implementation class SupervisorPlaceUpdateController
 */
@WebServlet("/supervisor/placeupdate")
public class SupervisorPlaceUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	SupervisorService supervisorservice = new SupervisorServiceImpl();
	PlaceService placeservice = new PlaceServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PlaceDto place=placeservice.getPlace_number(req);

		PlaceDto placeview=placeservice.view(place);

		PlaceFile placefile =placeservice.getfile(place);
		req.setAttribute("place", placeview);
		req.setAttribute("placefile", placefile);

		req.getRequestDispatcher("/WEB-INF/views/place/update.jsp").forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		supervisorservice.UpdatePlace(req);

		resp.sendRedirect("/place/view?place_number=30");

	}

}
