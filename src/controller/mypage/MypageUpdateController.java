package controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.login.Member;
import service.mypage.face.MypageService;
import service.mypage.impl.MypageServiceImpl;

/**
 * Servlet implementation class MypageUpdateController
 */
@WebServlet("/mypage/update")
public class MypageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MypageService mypageService = new MypageServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		Member member = mypageService.getupdateUserId(req);
		
		Member memberview =mypageService.view(member);
		
		req.setAttribute("member", memberview);
		
		req.getRequestDispatcher("/WEB-INF/views/mypage/mypageupdate.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		mypageService.userUpdate(req);
		
		
		resp.sendRedirect("/mypage/main");
	}
	
	
}
