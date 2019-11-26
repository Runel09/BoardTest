package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import board.dto.BoardFile;
import board.dto.Comment;
import board.service.face.BoardService;
import board.service.impl.BoardServiceImpl;

@WebServlet("/board/view")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService = new BoardServiceImpl();
//	MemberService memberService = new MemberServiceImpl();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		Board board = boardService.getBoardno(req);
		BoardFile boardFile = boardService.getBoardFileByBoardno(board.getBoardno());
		List<Comment> commentList = boardService.commentList(board);
		
		int count = boardService.getRecommendCount(board);
		
		if (req.getSession().getAttribute("userid") != null) {
			req.setAttribute("result", boardService.checkRecommend(board));
		}
		req.setAttribute("count", count);
		req.setAttribute("board", board);
		req.setAttribute("boardFile", boardFile);
		req.setAttribute("comment", commentList);
		req.setAttribute("nick", boardService.getNick(board));
		
		req.getRequestDispatcher("/WEB-INF/views/board/view.jsp")
		.forward(req, resp);
		
	}
}
