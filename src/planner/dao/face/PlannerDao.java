package planner.dao.face;

import planner.dto.Planner;

public interface PlannerDao {
//	/**
//	 * empno 와 ename 컬럼만 전체 행 조회
//	 * 
//	 * @return List<Emp> - empno 와 ename만 조회된 결과 리스트
//	 */
//	public List<Emp> selectEmpnoEname();
//
//	/**
//	 * empno를 이용해 사원 정보 조회
//	 * @param emp-사원 번호
//	 * @return Emp-사원 상세정보
//	 */
//	public Emp selectByEmpno(Emp e);
//	
//	/**
//	 * emp 
//	 * @param emp
//	 */
//	public void insert(Emp emp);
	
	
	/**
	 * planner_num을 통해 해당하는 플래너 조회
	 * @param SelectedPlanner - planner_num이 들어있는 Planner 
	 * @return
	 */
	public Planner getParam(Planner SelectedPlanner);
	
	
}
