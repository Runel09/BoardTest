package controller.place;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.place.face.PlaceService;
import service.place.impl.PlaceServiceImpl;

/**
 * Servlet implementation class placeInsertController
 */
@WebServlet("/place/insert")
public class placeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PlaceService placeService = new PlaceServiceImpl();
	
	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.getRequestDispatcher("/WEB-INF/views/board/write.jsp").forward(req, resp);
			
		}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			placeService.write(req);
	
		}
	
	
}
