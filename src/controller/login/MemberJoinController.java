package controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.login.Member;
import service.login.face.MemberService;
import service.login.impl.MemberServiceImpl;

/**
 * Servlet implementation class MemberJoinController
 */
@WebServlet("/member/join")
public class MemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService memberservice = new MemberServiceImpl();


	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			

		req.getRequestDispatcher("/WEB-INF/views/userinfo/TestFile.jsp").forward(req, resp);
		
		
		}

	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 resp.setContentType("text/html;charset=UTF-8");
	      req.setCharacterEncoding("UTF-8");

		Member member;
		
		member = memberservice.getmemberParam(req);
//		System.out.println("22131"+member);
		memberservice.join(member);

//		resp.sendRedirect("/member/join");
		
		
		resp.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = resp.getWriter();
		 
		out.println("<script>alert('회원가입 되었습니다!'); location.href='/member/login\';</script>");
		 
		out.flush();
		
		}

}
