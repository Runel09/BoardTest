package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = null;
		//세션 객체 얻기
		session= req.getSession();
		
		//세션 정보 추가하기(세션 컨텍스트 영역에 추가됨)
		req.getRequestDispatcher("WEB-INF/views/main.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = null;
		session= req.getSession();
		req.getRequestDispatcher("WEB-INF/views/main.jsp").forward(req, resp);
	}
}
