package planner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import planner.service.face.PlannerService;
import planner.service.impl.PlannerServiceImpl;

/**
 * Servlet implementation class PlannerDeleteController
 */
@WebServlet("/planner/delete")
public class PlannerDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PlannerService plannerService = new PlannerServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
