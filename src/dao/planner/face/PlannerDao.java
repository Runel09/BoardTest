package dao.planner.face;

import dto.planner.Planner;

public interface PlannerDao {

	
	/**
	 * planner_num을 통해 해당하는 플래너 조회
	 * @param SelectedPlanner - planner_num이 들어있는 Planner 
	 * @return
	 */
	public Planner getParam(Planner SelectedPlanner);

	
	public void insert(String[][] list);


	public int getPlannerNum();
	
	
}
