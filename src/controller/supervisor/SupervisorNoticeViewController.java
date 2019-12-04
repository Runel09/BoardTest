package controller.supervisor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.board.Board;
import dto.board.BoardFile;
import dto.board.Comment;
import dto.board.Recommend;
import service.board.face.BoardService;
import service.board.impl.BoardServiceImpl;

/**
 * Servlet implementation class SupervisorNoticeViewController
 */
@WebServlet("/supervisor/noticeview")
public class SupervisorNoticeViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	BoardService boardService = new BoardServiceImpl();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// board = boardno만 담겨있는 BoardDTO
				Board board=boardService.getBoardno(req);
				
				System.out.println(board);
				
				Board boardview=boardService.view(board);
				
				req.setAttribute("board", boardview);
				
				BoardFile boardfile= new BoardFile();
				
				boardfile=boardService.getBoardFileByBoardno(board.getBoardno());
				req.setAttribute("file", boardfile);
				
//				Board commentview=boardservice.view(board);
//				List<Comment> list= new ArrayList<>();
//				list= boardService.commentList(board);
				
//				System.out.println(list);
				
//				req.setAttribute("commentlist", list);
				
				req.getRequestDispatcher("/WEB-INF/views/supervisor/supervisor_noticeview.jsp").forward(req, resp);
				
			}
	}


