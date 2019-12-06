package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.board.Comment;
import service.board.face.BoardService;
import service.board.impl.BoardServiceImpl;

@WebServlet("/comment/insert")
public class CommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardServiceImpl(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Comment comment = new Comment();
		
		int boardno = Integer.parseInt(req.getParameter("boardno"));
		String content = req.getParameter("content");
		
		
		comment.setUser_id((String) session.getAttribute("user_id"));
		comment.setBoardno(boardno);
		comment.setContent(content);
		
		boardService.commentInsert(comment);
		
		resp.sendRedirect("/board/view?boardno="+boardno);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

	}
	
}
