package dao.planner.face;

import java.util.List;

import dto.planner.Index;
import dto.planner.Planner;

public interface PlannerDao {

	
	/**
	 * planner_num을 통해 해당하는 플래너 조회
	 * @param SelectedPlanner - planner_num이 들어있는 Planner 
	 * @return
	 */
	public Planner getParam(Planner SelectedPlanner);

	
	public void insert_planner(Planner planner);


	public int getPlannerNum();


	public void insert_index(List<Index> indexList);


	public Planner getPlanner(Planner planner);


	public List<Index> getIndex(int parseInt);


	public int[] getSize(int[] day_cnt);


	public int getDayCnt(int i);



	
	
}
