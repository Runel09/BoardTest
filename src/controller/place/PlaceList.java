package controller.place;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.place.Comment;
import dto.place.Paging;
import dto.place.PlaceDto;
import service.place.face.PlaceService;
import service.place.impl.PlaceServiceImpl;


/**
 * Servlet implementation class PlaceList
 */
@WebServlet("/place/list")
public class PlaceList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PlaceService placeService = new PlaceServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		Paging paging =placeService.getPaging(req);
		req.setAttribute("paging", paging);
		
		
		
		List<PlaceDto> placeList=placeService.getList(paging);
		String search =paging.getSearch();
		
		
		
		req.setAttribute("list",placeList);
		req.setAttribute("Search", search);
		req.getRequestDispatcher("/WEB-INF/views/place/list.jsp").forward(req, resp);
		
	}
	
	
}
