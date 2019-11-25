package planner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import place.dto.PlaceDto;
import place.service.face.PlaceService;
import place.service.impl.PlaceServiceImpl;
import planner.service.face.PlannerService;
import planner.service.impl.PlannerServiceImpl;

/**
 * Servlet implementation class PlannerInputController
 */
@WebServlet("/planner/input")
public class PlannerInputController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PlaceService placeService = new PlaceServiceImpl();

	private PlannerService plannerService = new PlannerServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String placeparam=req.getParameter("placeno");
		PlaceDto place= new PlaceDto();
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
		List<PlaceDto> placeList=placeService.getAlleGeoInfo();
		
		req.setAttribute("markers", placeList);
		System.out.println();
		
		req.getRequestDispatcher("/WEB-INF/views/planner/plannerBody.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
