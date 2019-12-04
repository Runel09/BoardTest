package controller.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.login.face.MemberService;
import service.login.impl.MemberServiceImpl;

/**
 * Servlet implementation class LoginChkFormController
 */
@WebServlet("/Login/chk")
public class LoginChkFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberService memberservice = new MemberServiceImpl();
	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/WEB-INF/views/userinfo/idCheckform.jsp").forward(req, resp);
		
	}
	
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
		String id = req.getParameter("id");
		System.out.println("contorller " +id);
		boolean check = memberservice.idcheck(id);
		
		req.setAttribute("check", check);
		
		req.getRequestDispatcher("/WEB-INF/views/userinfo/idCheck.jsp").forward(req, resp);

	}
}
