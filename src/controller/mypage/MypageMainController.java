package controller.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.board.Board;
import dto.board.Comment;
import dto.login.Member;
import service.board.face.BoardService;
import service.board.impl.BoardServiceImpl;
import service.mypage.face.MypageService;
import service.mypage.impl.MypageServiceImpl;
import util.Paging;

/**
 * Servlet implementation class MypageMainController
 */
@WebServlet("/mypage/main")
public class MypageMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		private MypageService mypageService = new MypageServiceImpl();
		private BoardService boardService = new BoardServiceImpl();
		
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			//로그인 됐을 경우
			if (req.getSession().getAttribute("login") != null) {
				
			HttpSession session = null;
			session=req.getSession();
			List<Board> list =new ArrayList<Board>();

			

			//요청파라미터에서 curPage를 구하고 Paging 객체 반환
			Paging paging = mypageService.mypageReviewListgetPaging(req);

			//Paging 객체를 MODEL값으로 지정
			req.setAttribute("paging", paging);
			
			Member member = new Member();
			member.setUser_id((String)session.getAttribute("userid"));
			
			
			member = mypageService.selectUserInfo(member);
//			System.out.println(member);
			
			list=mypageService.selectBoardByUserId(paging,req);

//			System.out.println(list);
			req.setAttribute("member", member);
			req.setAttribute("list", list);
			req.getRequestDispatcher("/WEB-INF/views/mypage/mypagemain.jsp").forward(req, resp);
			}else {
				resp.sendRedirect("/member/login");
			}
		}
}
