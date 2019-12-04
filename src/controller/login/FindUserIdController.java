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
 * Servlet implementation class FindUserIdController
 */
@WebServlet("/find/id")
public class FindUserIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	MemberService memberservice = new MemberServiceImpl();
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//
//		req.getRequestDispatcher("/WEB-INF/views/userinfo/finduseridResult.jsp").forward(req, resp);
//		
//	}
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			
			
//			req.setCharacterEncoding("utf-8");
			 resp.setContentType("text/html;charset=UTF-8");
			// TODO Auto-generated method stub
			Member member = memberservice.getfindUserParam(req);
//			System.out.println("객체 : " + member);
		
			Member memberResult = memberservice.getUserId(member);
//			PrintWriter out = resp.getWriter();
			
//			System.out.println("컨트롤러 검사 : " + memberResult);

			String id = memberResult.getUser_id();
			
//			System.out.println(id);
			//아이디 찾기 성공
			if(memberResult.getUser_id() != null) {
				req.setAttribute("id", id);
				req.getRequestDispatcher("/WEB-INF/views/userinfo/finduseridResult.jsp").forward(req, resp);
//				out.write("({'result':'입력하신 정보와  일치하는 아이디는 " + id + "입니다.'})" );
			}
			
			else
				req.getRequestDispatcher("/WEB-INF/views/userinfo/finduseridFailResult.jsp").forward(req,resp);
			
			

		}
		
		
}
