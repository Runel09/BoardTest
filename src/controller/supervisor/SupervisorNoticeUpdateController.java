package controller.supervisor;

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
import service.supervisor.face.SupervisorService;
import service.supervisor.impl.SupervisorServiceImpl;

/**
 * Servlet implementation class SupervisorPlaceUpdateController
 */
@WebServlet("/supervisor/noticeupdate")
public class SupervisorNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	SupervisorService supervisorservice = new SupervisorServiceImpl();
	BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Board board=boardService.getBoardno(req);
//		PlaceDto placeview=placeservice.view(place);

		BoardFile boardfile =boardService.getBoardFileByBoardno(board.getBoardno());
		req.setAttribute("board", board);
		req.setAttribute("boardfile", boardfile);

		req.getRequestDispatcher("/WEB-INF/views/supervisor/supervisor_noticeupdate.jsp").forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		supervisorservice.UpdateNotice(req);

		resp.sendRedirect("/supervisor/noticelist");

	}

}