package controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.board.PlanBoard;
import service.board.face.BoardService;
import service.board.impl.BoardServiceImpl;
import util.Paging;

@WebServlet("/planner/hot")
public class PlannerAjaxController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
	BoardService boardService = new BoardServiceImpl();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		Paging paging = boardService.getPaging(req);
		Paging paging = boardService.getPlannerPaging(req);
		
		
		List<PlanBoard> list = boardService.getPlannerHotList(paging);
		
//		System.out.println(list);
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/views/board/planner_sub.jsp").forward(req, resp);
	}

}
