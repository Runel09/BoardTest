package controller.board;

import java.io.IOException;
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

@WebServlet("/board/view")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService = new BoardServiceImpl();
//	MemberService memberService = new MemberServiceImpl();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		Board board = boardService.getBoardno(req);
		BoardFile boardFile = boardService.getBoardFileByBoardno(board.getBoardno());
		List<Comment> commentList = boardService.commentList(board);
		
		System.out.println(board);
		
		req.setAttribute("board", board);
		req.setAttribute("file", boardFile);
		req.setAttribute("comment", commentList);
		req.setAttribute("nick", boardService.getNick(board));
		
		//추천 상태 전달
		Recommend recommend = new Recommend();
		recommend.setBoardno(board.getBoardno()); //게시글 번호
		recommend.setUserid((String)req.getSession().getAttribute("userid")); //로그인한 아이디
				
		boolean isRecommend = boardService.isRecommend(recommend);
		req.setAttribute("isRecommend", isRecommend);
		
		req.getRequestDispatcher("/WEB-INF/views/board/view.jsp")
		.forward(req, resp);
		
	}
}
