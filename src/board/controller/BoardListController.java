package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dto.Board;
import board.service.face.BoardService;
import board.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/board/list")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImpl();
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 	Board 테이블의 목록을 조회
				List<Board> boardList = boardService.listview();
				//세션 객체 얻기
				System.out.println(boardList.get(0));
				//세션 정보 추가하기(세션 컨텍스트 영역에 추가됨)
//				session.setAttribute("page",1);
//				session.setAttribute("total", boardList.get(0).getBoardno());
//				
				// VIEW에 모델(MODEL)값 전달하기
				req.setAttribute("list", boardList);
				// VIEW JSP 지정하고 forwarding
				req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
	}
}
