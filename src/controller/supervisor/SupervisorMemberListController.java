package controller.supervisor;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.login.Member;
import oracle.net.aso.p;
import service.supervisor.face.SupervisorService;
import service.supervisor.impl.SupervisorServiceImpl;
import util.Paging;

/**
 * Servlet implementation class MemberList
 */
@WebServlet("/supervisor/memberlist")
public class SupervisorMemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SupervisorService supervisorservice=new SupervisorServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 관리자 로그인 됐을 경우
		if (req.getSession().getAttribute("login") != null) {


			//요청파라미터에서 curPage를 구하고 Paging 객체 반환
			Paging paging = supervisorservice.memberListgetPaging(req);

			paging.setSearch(req.getParameter("search"));
			//		System.out.println(paging);
			//Paging 객체를 MODEL값으로 지정
			System.out.println("search : " + req.getParameter("search"));
			req.setAttribute("paging", paging);

			List<Member> list = supervisorservice.getuserList(paging);
			//		System.out.println("list:" + list);
			//		for( Member m : list) System.out.println(m);

			req.setAttribute("list", list);

			req.getRequestDispatcher("/WEB-INF/views/supervisor/supervisor_memberlist.jsp").forward(req, resp);
		}else {
			// 관리자 로그인 안됐을 경우

			resp.sendRedirect("/supervisor/login");

		}

	}
}
