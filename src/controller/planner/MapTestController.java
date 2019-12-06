package controller.planner;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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
		System.out.println(req.getParameter("endNo"));
		int cnt = 0;
		ArrayList<Integer> listIndx = new ArrayList<Integer>();
		ArrayList<Integer> Index = new ArrayList<Integer>();
		for(int i = 1 ; i<=5;i++) {
			String query = "index"+i;
			if(req.getParameter(query)!=null) {
				listIndx.add(Integer.parseInt(req.getParameter(query)));
				System.out.println(Integer.parseInt(req.getParameter(query)));
				cnt+=1;
			}
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(listIndx);
		System.out.println(json);
		Index=listIndx;
		
		req.setAttribute("Index", Index);
		req.setAttribute("listIndx", json);
		req.setAttribute("cnt", cnt);
		req.getRequestDispatcher("/WEB-INF/views/planner/placeTest.jsp").forward(req, resp);
	}
}
