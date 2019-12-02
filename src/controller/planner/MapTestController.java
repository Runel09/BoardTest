package controller.planner;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MapTestController
 */
@WebServlet("/map/test")
public class MapTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("startNo", (req.getParameter("startNo")));
		req.setAttribute("endNo", (req.getParameter("endNo")));
		req.getRequestDispatcher("/WEB-INF/views/planner/placeTest.jsp").forward(req, resp);
	}
}
