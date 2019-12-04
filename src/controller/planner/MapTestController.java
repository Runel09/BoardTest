package controller.planner;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		int cnt = 0;
		ArrayList<Integer> listIndx = new ArrayList<Integer>();
		for(int i = 1 ; i<=5;i++) {
			if(req.getParameter("indx"+i)!=null) {
				listIndx.add(Integer.parseInt(req.getParameter("indx"+i)));
				System.out.println(Integer.parseInt(req.getParameter("indx"+i)));
				cnt+=1;
			}
		}
		req.setAttribute("listIndx", listIndx);
		req.setAttribute("cnt", cnt);
		req.getRequestDispatcher("/WEB-INF/views/planner/placeTest.jsp").forward(req, resp);
	}
}
