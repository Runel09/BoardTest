package controller.planner;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.place.PlaceDto;
import service.place.face.PlaceService;
import service.place.impl.PlaceServiceImpl;
import service.planner.face.PlannerService;
import service.planner.impl.PlannerServiceImpl;

/**
 * Servlet implementation class PlannerViewController
 */
@WebServlet("/planner/view")
public class PlannerViewController extends HttpServlet {
	private PlannerService plannerService = new PlannerServiceImpl();
	private PlaceService placeService = new PlaceServiceImpl();
	
	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PlaceDto placeparam=placeService.getPlace_number(req);
		PlaceDto place= new PlaceDto();
		if (placeparam==null) {
			place.setCoordinate_lat(35.305034);
			place.setCoordinate_lng(123.726168);
			req.setAttribute("centerPlace", place);
			List<PlaceDto> placeList=placeService.getAlleGeoInfo();
			req.setAttribute("markers", placeList);
		}else {
			place=placeService.view(placeparam);
			req.setAttribute("placeno",(place.getPlace_number()));
		}
		
		req.getRequestDispatcher("/WEB-INF/views/planner/view.jsp").forward(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {};
}
