package controller.planner;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.place.Place;
import service.place.PlaceService;
import service.place.PlaceServiceImpl;
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
		Place place=new Place();
		List<Place> placeList = new ArrayList<Place>();
		if(req.getParameter("placeno")!=null && !"".equals(req.getParameter("placeno")) ) {
			placeno =Integer.parseInt(req.getParameter("placeno"));
		}
		if(placeno==0) {
			placeList=placeService.getAlleGeoInfo();
			req.setAttribute("placeno", placeno);
			req.setAttribute("markers", placeList);
		}else if(placeno!=0) {
			place=placeService.getInfoByplaceno(placeno);
			req.setAttribute("placeno", placeno);
			req.setAttribute("markers", place);
		}
		

		req.getRequestDispatcher("/WEB-INF/views/planner/center.jsp").forward(req, resp);
	}
}
