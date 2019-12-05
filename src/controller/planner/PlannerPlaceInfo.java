package controller.planner;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class PlannerPlaceInfo
 */
@WebServlet("/planner/placeInfo")
public class PlannerPlaceInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PlaceService placeService = new PlaceServiceImpl();
	private PlannerService plannerService = new PlannerServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int placeno=0;
		PlaceDto place=new PlaceDto();
		List<PlaceDto> placeList = new ArrayList<PlaceDto>();
//		System.out.println(req.getParameter("place_number"));
		if(req.getParameter("place_number")!=null && !"".equals(req.getParameter("place_number")) ) {
			place =placeService.getPlace_number(req);
			placeno=place.getPlace_number();
//			System.out.println(placeno);
		}
		if(placeno==0) {
			placeList=placeService.getAlleGeoInfo();
			req.setAttribute("placeno", placeno);
			req.setAttribute("markers", placeList);
		}else if(placeno>0) {
			place=placeService.view(place);
			req.setAttribute("placeno", placeno);
			System.out.println(place.toString());
			req.setAttribute("markers", place);
		}
		

		req.getRequestDispatcher("/WEB-INF/views/planner/center.jsp").forward(req, resp);
	}
}
