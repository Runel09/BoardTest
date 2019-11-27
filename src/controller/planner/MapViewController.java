package controller.planner;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.place.Place;
import service.place.PlaceService;
import service.place.PlaceServiceImpl;

/**
 * Servlet implementation class MapViewController
 */
@WebServlet("/map/view")
public class MapViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PlaceService placeService = new PlaceServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String placeparam=req.getParameter("placeno");
		Place place= new Place();
		int placeno= 0;
		if (placeparam==null) {
			place.setCoordinate_lat(35.305034);
			place.setCoordinate_lng(123.726168);
			req.setAttribute("centerPlace", place);
		}else {
			placeno=Integer.parseInt((placeparam));
			place=placeService.getInfoByplaceno(placeno);
			req.setAttribute("centerPlace", place);
		}
		List<Place> placeList=placeService.getAlleGeoInfo();
		
		req.setAttribute("markers", placeList);
		System.out.println();
	
		req.getRequestDispatcher("/WEB-INF/views/planner/test.jsp").forward(req, resp);
	}
}
