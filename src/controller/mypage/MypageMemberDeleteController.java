package controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.login.Member;
import service.mypage.face.MypageService;
import service.mypage.impl.MypageServiceImpl;

/**
 * Servlet implementation class MypageMemberDeleteController
 */
@WebServlet("/mypage/delete")
public class MypageMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	private MypageService mypageService = new MypageServiceImpl();
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		mypageService.deleteMember(req);
		
		
		
		}
	
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
				
		
//		resp.sendRedirect("/main");
//		mypageService.deleteMember(req);
//		
//			resp.setContentType("text/html; charset=UTF-8");
//			 
//			PrintWriter out = resp.getWriter();
//			 
//			out.println("<script>alert('회원탈퇴가 정상적으로 되었습니다!'); location.href='/main\';</script>");
//			 
//			out.flush();
			
	}

}
