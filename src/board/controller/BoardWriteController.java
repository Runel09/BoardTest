package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.face.BoardService;
import board.service.impl.BoardServiceImpl;
import file.service.face.FileService;
import file.service.impl.FileServiceImpl;

@WebServlet("/board/write")
public class BoardWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// BoardService 객체
	private BoardService boardService = new BoardServiceImpl();
	private FileService fileService = new FileServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 로그인 되어있지 않으면 리다이렉트
		if (req.getSession().getAttribute("loginfo") == null) {
			resp.sendRedirect("/main");
			return;
		}
		resp.setContentType("text/html;charset=utf-8");
		// VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/board/write.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 작성글 삽입
		req.setCharacterEncoding("utf-8");
		fileService.fileupload(req, resp);
		System.out.println("성공");
		// 목록으로 리다이렉션
		resp.sendRedirect("/board/list");
	}

}
