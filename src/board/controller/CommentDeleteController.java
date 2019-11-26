package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Comment;
import board.service.face.BoardService;
import board.service.impl.BoardServiceImpl;

@WebServlet("/comment/delete")
public class CommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService = new BoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Comment comment = new Comment();
		
		comment.setCommentno(Integer.parseInt(req.getParameter("commentno")));
		
		int boardno = Integer.parseInt(req.getParameter("boardno"));
		
		boardService.commentDelete(comment);
		
		resp.sendRedirect("/board/view?boardno="+boardno);
		
	}
}
