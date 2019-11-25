package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.service.Impl.MemberServiceImpl;
import web.service.face.MemberService;

/**
 * Servlet implementation class MemberList
 */
@WebServlet("/admin/memberlist")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService memberservice= new MemberServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//요청파라미터에서 curPage를 구하고 Paging 객체 반환
		Paging paging = memberservice.getPaging(req);
		System.out.println(paging);
		paging.setSearch(req.getParameter("search"));
		
//		System.out.println(paging);
		//Paging 객체를 MODEL값으로 지정
		req.setAttribute("paging", paging);

		req.setAttribute("list", memberservice.getuserList(paging));
		
		req.setAttribute("search", paging.getSearch());

		System.out.println(memberservice.getuserList(paging));
		req.getRequestDispatcher("/WEB-INF/views/membermanage/memberlist.jsp").forward(req, resp);
	}

}
