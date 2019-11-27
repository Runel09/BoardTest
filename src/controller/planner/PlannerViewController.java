package controller.planner;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.planner.face.PlannerService;
import service.planner.impl.PlannerServiceImpl;

/**
 * Servlet implementation class PlannerViewController
 */
@WebServlet("/planner/view")
public class PlannerViewController extends HttpServlet {
	private PlannerService plannerService = new PlannerServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {};
}
