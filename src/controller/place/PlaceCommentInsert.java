package controller.place;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.place.Comment;
import dto.place.PlaceDto;
import service.place.face.PlaceService;
import service.place.impl.PlaceServiceImpl;

/**
 * Servlet implementation class PlaceCommentInsert
 */
@WebServlet("/place/comment")
public class PlaceCommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PlaceService placeService=new PlaceServiceImpl();
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = null;
		session=req.getSession();
		
		
		PlaceDto placeDto = new PlaceDto();
		Comment comment = placeService.getComment(req);
		
		
		
		
		comment.setUser_number((Integer) session.getAttribute("user_userNum"));
		
		placeService.insertComment(comment);
		
//		System.out.println("commentPlaceNumber:"+comment.getPlace_number());
		
		placeDto = placeService.insertScore(comment);
		
		placeService.updateScore(placeDto);
		
		
		System.out.println("number 확인"+placeDto.getPlace_number());
		System.out.println("점수 확인:"+placeDto.getReview_score());
		
		req.setAttribute("placeDto", placeDto);
		req.setAttribute("review", comment);
		resp.sendRedirect("/place/view?place_number="+comment.getPlace_number());
		
		
		
	}
}
