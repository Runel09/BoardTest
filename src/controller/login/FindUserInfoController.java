package controller.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.login.Member;
import service.login.face.MemberService;
import service.login.impl.MemberServiceImpl;

/**
 * Servlet implementation class FindUserInfoController
 */
@WebServlet("/find/userinfo")
public class FindUserInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService memberservice = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		req.getRequestDispatcher("/WEB-INF/views/userinfo/finduserinfo.jsp").forward(req, resp);
		
	}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			// TODO Auto-generated method stub
			Member member = memberservice.getfindUserParam(req);
//			request.setCharacterEncoding("euc-kr");
			
			System.out.println("객체 : " + member);
			
			Member memberResult = memberservice.getUserId(member);
			
			System.out.println("컨트롤러 검사 : " + memberResult);
			
			
		}
}
