package controller.place;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.place.Comment;
import dto.place.PlaceDto;
import dto.place.PlaceFile;
import service.place.face.PlaceService;
import service.place.impl.PlaceServiceImpl;

/**
 * Servlet implementation class PlaceViewController
 */
@WebServlet("/place/view")
public class PlaceViewController extends HttpServlet {
	
	private PlaceService placeService = new PlaceServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PlaceDto placeDto= placeService.getPlace_number(req);
		
		PlaceDto viewplace = placeService.view(placeDto);
		
		PlaceFile placefile = placeService.getfilePlace_number(req);
		
		PlaceFile viewfile=placeService.fileview(placefile);
		
		req.setAttribute("viewplace",viewplace);
		req.setAttribute("viewfile",viewfile);
		
		
		//댓글 리스트 전달
		Comment comment = new Comment();
		List<Comment> commentList = placeService.getCommentList(viewplace);
		req.setAttribute("commentList", commentList);
		
		
		
		req.getRequestDispatcher("/WEB-INF/views/board/view.jsp").forward(req, resp);
		
		
	}
}
