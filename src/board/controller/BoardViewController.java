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
 * Servlet implementation class BoardViewController
 */
@WebServlet("/board/view")
public class BoardViewController extends HttpServlet {
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
		System.out.println(file.toString());
		// VIEW에 모델(MODEL)값 전달하기
		req.setAttribute("Board", board);
		req.setAttribute("fileInfo", file);

		// VIEW JSP 지정하고 forwarding
		req.getRequestDispatcher("/WEB-INF/views/board/view.jsp").forward(req, resp);
	}

}
