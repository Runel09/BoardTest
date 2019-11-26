package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dto.Board;
import board.service.face.BoardService;
import board.service.impl.BoardServiceImpl;

@WebServlet("/board/recommend")
public class BoardRecommendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Board recommendBoard = new Board();
		
		recommendBoard.setBoardno(Integer.parseInt(req.getParameter("boardno")));
		recommendBoard.setId((String)session.getAttribute("userid"));
		
		boardService.recommend(recommendBoard);
		
		int cnt = boardService.getRecommendCount(recommendBoard);
		boolean result = boardService.checkRecommend(recommendBoard);
		
		resp.getWriter().println("{ \"cnt\" : " + cnt + ","
				+ "\"result\" : " + result +" }");
		
		
		
//		resp.sendRedirect("./view?boardno="+recommendBoard.getBoardno());
	}

}
