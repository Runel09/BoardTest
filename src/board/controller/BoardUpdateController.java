package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import board.dto.UploadFile;
import board.service.face.BoardService;
import board.service.impl.BoardServiceImpl;
import file.service.face.FileService;
import file.service.impl.FileServiceImpl;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImpl();
	private FileService fileService = new FileServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Board board = boardService.getBoardno(req);
		board.toString();
		board = boardService.view(board);
		System.out.println(board.toString());
		UploadFile file = null;
		file = fileService.viewFile(board);
		// VIEW에 모델(MODEL)값 전달하기
		req.setAttribute("board", board);
		req.setAttribute("fileInfo", file);

		// VIEW JSP 지정하고 forwarding
		req.getRequestDispatcher("/WEB-INF/views/board/update.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		fileService.fileupdate(req, resp);
		resp.sendRedirect("/board/list");
	}

}
