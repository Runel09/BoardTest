package controller.supervisor;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.board.Report;
import service.supervisor.face.SupervisorService;
import service.supervisor.impl.SupervisorServiceImpl;
import util.Paging;

@WebServlet("/supervisor/reportlist")
public class SupervisorReportListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private SupervisorService supervisorService = new SupervisorServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		 // 관리자 로그인 됐을 경우
	      if (req.getSession().getAttribute("login") != null) {

	
		//요청파라미터에서 curPage를 구하고 Paging 객체 반환
		Paging paging = supervisorService.reportListgetPaging(req);
		
		paging.setSearch(req.getParameter("search"));
//		System.out.println(paging);
		//Paging 객체를 MODEL값으로 지정
		System.out.println("search : " + req.getParameter("search"));
		req.setAttribute("paging", paging);

		List<Report> list = supervisorService.getreportList(paging);
//		System.out.println("list:" + list);
//		for( Member m : list) System.out.println(m);
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/views/supervisor/supervisor_reportlist.jsp").forward(req, resp);
	}else {
		// 관리자 로그인 안됐을 경우
      
	    	  resp.sendRedirect("/supervisor/login");

	}

	}
	
	}
	

