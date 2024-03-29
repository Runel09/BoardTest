package controller.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.login.Member;
import service.login.MemberService;
import service.login.MemberServiceImpl;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/member/login")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/userinfo/login.jsp").forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberService memberservice = new MemberServiceImpl();

		Member member = memberservice.getLoginMember(req);
		//System.out.println("member"+member);
		Member member2 = memberservice.getMemberByUserid(member);
		//System.out.println("member2"+member2);

		boolean isSuccess = memberservice.login(member);
		
		
		if(isSuccess) {
			//세션 객체 얻기
			HttpSession session = req.getSession();
			
			session.setAttribute("login" , true );
			
			session.setAttribute("userid", member2.getDB_Id() );
			session.setAttribute("usernick", member2.getDB_Nick() );
			
			
			
			resp.sendRedirect("/main");
		} else {
			System.out.println("로그인실패");
			resp.sendRedirect("/main");
		}

	}
}
