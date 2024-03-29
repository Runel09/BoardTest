package controller.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.login.Member;
import service.login.MemberService;
import service.login.MemberServiceImpl;

/**
 * Servlet implementation class MemberJoinController
 */
@WebServlet("/member/join")
public class MemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService memberservice = new MemberServiceImpl();


	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		req.getRequestDispatcher("/WEB-INF/views/userinfo/join.jsp").forward(req, resp);
		
		
		}

	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member;
		
		member = memberservice.getLoginMember(req);
	
		memberservice.join(member);

		resp.sendRedirect("/main");
		
		
		}

}
