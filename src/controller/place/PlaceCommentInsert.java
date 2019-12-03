package controller.place;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.place.Comment;
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
		
		System.out.println(session.getAttribute("user_userNum"));
		Comment comment = placeService.getComment(req);
		comment.setUser_number((Integer) session.getAttribute("user_userNum"));
		System.out.println(comment);
		placeService.insertComment(comment);
		
		resp.sendRedirect("/place/view?place_number="+comment.getPlace_number());
	}
}
