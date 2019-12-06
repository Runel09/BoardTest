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
		
		int boardno = Integer.parseInt(req.getParameter("boardno"));
		req.setAttribute("boardno", boardno);
		
		req.getRequestDispatcher("/WEB-INF/views/board/report.jsp").forward(req, resp);
	

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		Report report = new Report();
		Board board = new Board();
		
		int boardno = Integer.parseInt(req.getParameter("boardno"));
		report.setReportno(Integer.parseInt(req.getParameter("reportno")));
		report.setBoardno(boardno);
		board.setBoardno(boardno);
		report.setContent(req.getParameter("content"));
		report.setUser_id(req.getParameter("user_id"));
		report.setReason(req.getParameter("reason"));

		boardService.insertReport(report);
		boardService.updateReport(board);

		resp.sendRedirect("/board/view?boardno="+boardno);
	}

}
