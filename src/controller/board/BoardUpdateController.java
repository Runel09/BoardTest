package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.board.Board;
import dto.board.BoardFile;
import service.board.face.BoardService;
import service.board.impl.BoardServiceImpl;

@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Board board = boardService.getBoardno(req);
		BoardFile boardFile = boardService.getBoardFileByBoardno(board.getBoardno());
		
		req.setAttribute("board", board);
		req.setAttribute("boardFile", boardFile);
		
		req.getRequestDispatcher("/WEB-INF/views/board/update.jsp")
		.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		boardService.update(req);
		
		resp.sendRedirect("/board/free");
	}

}
