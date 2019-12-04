package controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.board.Board;
import service.board.face.BoardService;
import service.board.impl.BoardServiceImpl;
import util.Paging;

@WebServlet("/board/planner")
public class BoardPlannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//요청파라미터에서 curPage를 구하고 Paging 객체 반환
		req.setAttribute("checkboard", "플래너");
		Paging paging = boardService.getPaging(req);
		//Paging 객체를 MODEL값으로 지정
		req.setAttribute("paging", paging);	
		List<Board> list = boardService.getPlannerList(paging);	
		req.setAttribute("list", list);
		req.getRequestDispatcher("/WEB-INF/views/board/planner.jsp")
		.forward(req, resp);
		
		
//		//결과 JSON응답
//		resp.getWriter().println("{\"result\": "+result+", \"cnt\": "+cnt+"}");
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
	
	}

}
