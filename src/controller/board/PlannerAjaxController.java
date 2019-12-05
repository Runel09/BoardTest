package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.board.PlanBoard;
import service.board.face.BoardService;
import service.board.impl.BoardServiceImpl;
import util.Paging;

@WebServlet("/planner/ajax")
public class PlannerAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	BoardService boardService = new BoardServiceImpl();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PlanBoard planBoard = new PlanBoard();
		
		planBoard.setTravel_place(req.getParameter("travel_place"));
		planBoard.setTravel_date(req.getParameter("travel_date"));
		planBoard.setTravel_season(req.getParameter("travel_season"));
		planBoard.setTravel_thema(req.getParameter("travel_thema"));
		
		Paging paging = boardService.getPaging(req);
		boardService.getPlannerList(paging);
		
	}

}
