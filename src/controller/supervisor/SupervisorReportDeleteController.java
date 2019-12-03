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

@WebServlet("/supervisor/reportdelete")
public class SupervisorReportDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	SupervisorService supervisorservice = new SupervisorServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Report report = new Report();
		
		req.setAttribute("report", report);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		supervisorservice.DeleteReport(req);

		resp.sendRedirect("/supervisor/reportlist");
	}
	
	}
	

