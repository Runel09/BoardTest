package controller.planner;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.place.PlaceDto;
import dto.planner.Planner;
import service.place.face.PlaceService;
import service.place.impl.PlaceServiceImpl;
import service.planner.face.PlannerService;
import service.planner.impl.PlannerServiceImpl;

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
//		String placeparam=req.getParameter("placeno");
//		PlaceDto place= new PlaceDto();
//		int placeno= 0;
//		if (placeparam==null) {
//			place.setCoordinate_lat(35.305034);
//			place.setCoordinate_lng(123.726168);
//			req.setAttribute("centerPlace", place);
//		}else {
//			placeno=Integer.parseInt((placeparam));
//			place=placeService.getInfoByplaceno(placeno);
//			req.setAttribute("centerPlace", place);
//		}
//		List<PlaceDto> placeList=placeService.getAlleGeoInfo();
//		
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
		
		req.getRequestDispatcher("/WEB-INF/views/planner/plannerBody.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int plannerno=0;
		Planner planner = new Planner();
		String[] result=req.getParameterValues("place_no");
		for(int i =0;i<result.length;i++){
			System.out.println(result[i]);
		}
		
//		planner = plannerService.getparameter(req);
		resp.sendRedirect("/planner/view?plannerno="+plannerno);
		
		
		
		
		
		
		
		
	}
}
