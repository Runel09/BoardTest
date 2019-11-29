package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.board.Board;
import service.board.face.BoardService;
import service.board.impl.BoardServiceImpl;

@WebServlet("/board/report")
public class BoardReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BoardService boardService = new BoardServiceImpl();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		Board board = new Board();
		
		int boardno = Integer.parseInt(req.getParameter("boardno"));
		board.setBoardno(boardno);
		
//		System.out.println(boardno);
		
		boardService.updateReport(board);
		
		resp.sendRedirect("/board/free");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
