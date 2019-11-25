package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.Impl.MemberServiceImpl;
import web.service.face.MemberService;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/admin/memberdelete")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService memberservice = new MemberServiceImpl();
	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			memberservice.DeleteUser(req);
			
			resp.sendRedirect("/admin/memberlist");
		}

}
