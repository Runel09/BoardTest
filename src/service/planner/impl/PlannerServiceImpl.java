package service.planner.impl;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import dao.planner.face.PlannerDao;
import dao.planner.impl.PlannerDaoImpl;
import dto.place.PlaceDto;
import dto.planner.Index;
import dto.planner.Marker;
import dto.planner.Planner;
import service.planner.face.PlannerService;

public class PlannerServiceImpl implements PlannerService {
	PlannerDao plannerDao= new PlannerDaoImpl();
	

	@Override
	public List<Planner> presetList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Planner> getPlanner(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaceDto> getPlace(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaceDto> getLine(List<Planner> placeIndex) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Planner> insertByMarker(Marker marker) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaceDto> allPlace() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaceDto> catPlLits(PlaceDto catInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Planner viewInfo(Planner viewPlanner) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaceDto> placeFilter(int[] placeArray) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Planner getparameter(HttpServletRequest req) {
		Enumeration<String> names = req.getParameterNames();
		Map<String, String[]> map = req.getParameterMap();
		Planner planner = new Planner();
		while( names.hasMoreElements() ) {
			String name = names.nextElement();
			if("title".equals(name)) {
				planner.setPLANNER_NAME(map.get(name)[0]);
			}else if("travel_Place".equals(name)) {
				planner.setTrip_nation(map.get(name)[0]);
			}else if("travel_date".equals(name)) {
				planner.setTrip_date(map.get(name)[0]);
			}else if("travel_season".equals(name)) {
				planner.setTrip_season(map.get(name)[0]);
			}else if("traval_thema".equals(name)) {
				planner.setTrip_theme(map.get(name)[0]);
			}else {
				continue;
			}
		}
//		System.out.println(planner.toString());
		return planner;
	}

	@Override
	public List<Index> getIndex(HttpServletRequest req) {
		System.out.println("--- getprameter ---");
		String[][] index = new String[7][];
		Enumeration<String> names = req.getParameterNames();
		Map<String, String[]> map = req.getParameterMap();
		List<Index> indexList = new ArrayList<>();
		
		int i = 0;
		while( names.hasMoreElements() ) {
//			System.out.println(i+"회");
			String name = names.nextElement();
//			System.out.println(name);
			if("title".equals(name)||"travel_Place".equals(name)||"travel_date".equals(name)||"travel_season".equals(name)||"traval_thema".equals(name)) {
				continue;
			}
//			System.out.println(map.get(name));
			
			index[i] = map.get(name);
			for(int j=0 ; j<index[i].length;j++) {
				Index indexCol = new Index();
				indexCol.setPlace_num(Integer.parseInt(index[i][j]));
				indexCol.setPlanner_date(i+1);
				indexList.add(indexCol);
//				System.out.println(index[i][j]);
			}
			i++;
			
		}
		return indexList;
	}

	@Override
	public void write(Planner planner) {
		plannerDao.insert_planner(planner);
	}

	@Override
	public int getPlannerNum() {
		return plannerDao.getPlannerNum();
	}

	@Override
	public void insertIndex(List<Index> indexList) {
		plannerDao.insert_index(indexList);
		
	}

	@Override
	public Planner selectPlanner(HttpServletRequest req) {
		Planner planner = new Planner();
		planner.setPLANNER_NUM(Integer.parseInt(req.getParameter("plannerno")));
		planner=plannerDao.getPlanner(planner);
		return planner;
	}

	@Override
	public List<Index> selectIndex(HttpServletRequest req) {
		
		return plannerDao.getIndex(Integer.parseInt(req.getParameter("plannerno")));
	}

	@Override
	public int[] getIndexSize(HttpServletRequest req) {
		int day_cnt[] = new int[2];
		day_cnt[0]=Integer.parseInt(req.getParameter("plannerno"));
		day_cnt[1]=plannerDao.getDayCnt(day_cnt[0]);
		System.out.println(day_cnt);
		
		return plannerDao.getSize(day_cnt);
	}

	
	
	
	
	
	
			
}
