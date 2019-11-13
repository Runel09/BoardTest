package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import board.service.face.BoardService;
import board.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class BoardViewController
 */
@WebServlet("/board/view")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
		private BoardService boardService = new BoardServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Board board = boardService.getBoardno(req);
		board.toString();
		board=boardService.view(board);
		// VIEW에 모델(MODEL)값 전달하기
		req.setAttribute("Board", board);
		// VIEW JSP 지정하고 forwarding
		req.getRequestDispatcher("/WEB-INF/views/board/view.jsp").forward(req, resp);
	}

}
