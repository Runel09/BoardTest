package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.board.Board;
import dto.board.Report;
import service.board.face.BoardService;
import service.board.impl.BoardServiceImpl;

@WebServlet("/board/report")
public class BoardReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BoardService boardService = new BoardServiceImpl();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/board/report.jsp").forward(req, resp);
	

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Report report = new Report();
		Board board = new Board();
		
		int boardno = Integer.parseInt(req.getParameter("boardno"));
		System.out.println(boardno);
		String content = req.getParameter("content");
		System.out.println(content);
		String db_id = (String) req.getAttribute("db_id");
		System.out.println(db_id);
		String reason = req.getParameter("reason");
		System.out.println(reason);
		report.setBoardno(boardno);
		report.setContent(content);
		report.setDb_id(db_id);
		report.setReason(reason);
		boardService.insertReport(report);
		
		board.setBoardno(boardno);
		boardService.updateReport(board);
		// insert 해야함. report에서 받아온 정보들
		resp.sendRedirect("/board/view?boardno="+boardno);
	}

}
