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
			
			Member member2 = memberservice.getfinduserparam2(req);
			
//			System.out.println("객체 : " + member);
//			System.out.println("객체 : " + member2);
			
			
			Member memberResult = memberservice.getUserId(member);
			Member memberResult2 = memberservice.getUserPw(member2);
			
//			System.out.println("컨트롤러 검사 : " + memberResult);
//			System.out.println("컨트롤러 검사 : " + memberResult2);
			
			//비번 찾기 성공
			if(memberResult2.getUser_pw() != null) {
				
				System.out.println(memberResult2);

				//이메일정보를 넣기위한 작업
				member2 = memberservice.getMemberByUserid(memberResult2);
				System.out.println("정보를 가져와 보자 : " + member2);
				//메일 보내기
				memberservice.sendEmailPw(member2);
			}
			
			else {
				System.out.println("찾기 실패 ㅁㄴㅇㄹ");
				resp.sendRedirect("/find/userinfo");
			}
		}
		
		
}
