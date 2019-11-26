package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dto.Comment;
import board.service.face.BoardService;
import board.service.impl.BoardServiceImpl;

@WebServlet("/comment/insert")
public class CommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardServiceImpl(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Comment comment = new Comment();
		
		int bno = Integer.parseInt(req.getParameter("boardno"));
		String con = req.getParameter("content");
		
		
		comment.setUserid((String) session.getAttribute("userid"));
		comment.setBoardno(bno);
		comment.setContent(con);
		
		boardService.commentInsert(comment);
		
		resp.sendRedirect("/board/view?boardno="+bno);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		Comment comment = new Comment();
//		
//		
//		int cno =  Integer.parseInt(req.getParameter("commentno"));
//		int bno = Integer.parseInt(req.getParameter("boardno"));
//		String con = req.getParameter("content");
//		
//		comment.setCommentno(cno);
//		comment.setBoardno(bno);
//		comment.setContent(con);
//		
//		boardService.commentInsert(comment);
	}
	
}
