package controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

}
