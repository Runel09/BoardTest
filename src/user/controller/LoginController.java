package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dto.User;
import user.service.face.UserService;
import user.service.impl.UserServiceImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/user/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = null;

		// 세션 객체 얻기
		session = req.getSession();
		User user = new User();
		user = userService.getLoginMember(req);
		System.out.println(user.toString());
		boolean check = userService.login(user);
		if (check) {
			session.setAttribute("loginfo", check);
			System.out.println("성공여부 성공:" + check);
			user = userService.getMemberByUserid(user);
			session.setAttribute("userid", user.getUSERID());
			session.setAttribute("usernick", user.getNick());
			resp.sendRedirect("/main");
		} else {
			session.setAttribute("loginfo", check);
			session.setAttribute("inputUser", user.getUSERID());
			System.out.println("성공여부:" + check);
			resp.sendRedirect("user/login");
		}
	}
}
