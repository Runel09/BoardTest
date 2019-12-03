package controller.place;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.place.Comment;
import service.place.face.PlaceService;
import service.place.impl.PlaceServiceImpl;

/**
 * Servlet implementation class PlaceCommentDelete
 */
@WebServlet("/place/commentdelete")
public class PlaceCommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PlaceService placeService= new PlaceServiceImpl();
			
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Comment comment = new Comment();
		
		String review_number =(String)req.getParameter("review_number");
		comment.setReview_number(Integer.parseInt(review_number));
		boolean success= placeService.deleteComment(comment);
		
		resp.getWriter().append("{\"success\":"+success+"}");
		
		
		
	}
	
	
}
