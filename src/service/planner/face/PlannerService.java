package service.planner.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.place.Place;
import dto.planner.Marker;
import dto.planner.Planner;


public interface PlannerService {
//	/**
//	 * 
//	 * @param e-전달 받은 empno가 들어있는 Emp형 입력정보
//	 * @return Emp
//	 */
//	public Emp detail(Emp e);
//	
//	/**
//	 *  Emp형 정보를 전달받아 DB에 입력
//	 * @param emp-DB에 입력될 Emp형 정보
//	 */
//	public void join(Emp emp);
//	
//	/**
//	 * 
//	 * @param req- 전달받은 회원 정보
//	 * @return Emp - 입력받은 정보를  Emp형으로 저장
//	 */

//	public Emp getEmpParam(HttpServletRequest req);
	
	//PL-01
	//	 플래너에서 일정 추천수를 받은 플래너들을 사용
	//	 사용자들의 추천수를 참조하여 추천수 순으로 출력
	/**
	 * Planner 테이블의 목록을 조회 추천수 순으로 Sorting 해서 출력
	 * @return List<Planner>-전체조회+추천수 20이상 플래너 목록
	 */
	public List<Planner> presetList();
	
	//PL-02
	//	 플래너에서 일정 추천수를 받은 플래너들을 사용
	//	카테고리 별로 목록을 나눠주어 표기
	/**
	 * 카테고리 버튼을 누르거나 
	 * (장소 추가시)-차후 구현
	 * 해당 정보를 전달 받아 DAO로 송신후 해당하는 플래너들을 반환
	 *
	 * @param planCat 전달받은 카테고리가 들어있는 Planner 객체가 들어있는 Request
	 * @return List<Planner>-전달 받은 정보로 필터링+추천수 20이상  플래너 목록
	 */
	public List<Planner> getPlanner(HttpServletRequest req);

	//PL-03
	//	 DB에 입력되어 있는 장소들을 카테고리와 좌표에 맞춰 지도상에 표기
	//	 국가-도시-지역순으로 필터링 해서 지도에 표기되게함
	/**
	 *  req객체를 통해 현재 페이지에 표기되는 지도의 모서리 좌표 획득후 전달
	 * 
	 * @param req 페이지에 표시된 지도 좌표(4개 모서리)
	 * @return 해당 좌표들 안에 존재하는 장소들 목록
	 */
	public List<Place> getPlace(HttpServletRequest req);

	//PL-04
	//	 일정표에 추가된 장소들을 순서에 맞춰 직선으로 이어줌
	/**
	 *  리스트 형태로 장소번호와 인덱스를 전달
	 *  
	 * @param placeIndex 입력된 장소번호와 순서가 들어가 있는 리스트 
	 * @return 입력된 장소 번호와 순서에 맞춰서 순차적으로 입력된 장소 정보(좌표) 리스트
	 */
	public List<Place> getLine(List<Planner>  placeIndex);

	//PL-05
	//	 지도에서 아이콘 선택시일정표에 해당 장소 추가 
	/**
	 *  전달받은 마커의 장소 정보를 페이지가 가지고 있던  Planner 리스트에 입력
	 * @param marker 전달 받은 마커 객체(장소 정보)
	 * @return
	 */
	public List<Planner> insertByMarker(Marker marker);
	
	//PL-06
	//	-카테고리별 분류후 각 카테고리별 평점을 기준으로 정렬하여 우측바에 출력
	//  전체 출력
	public List<Place> allPlace();
	
	//  카테고리별 출력
	public List<Place> catPlLits(Place catInfo);
	
	// 장소 필터링
	/**
	 *  wkd
	 * @return
	 */
	public List<Place> placeFilter(int[] placeArray);
	
	
	//	-일정표상 두장소의 직선상 거리의 중심점을기준으로 반경 검색후 평점 순으로 추천
	
	
	
	//	-선택시 일정표에 해당 장소 추가
	//	입력된 장소들을 두개씩 연결하여 모든 장소들의 소요시간과 교통비를 구글Maps로 검색
	//	검색후 나오게 되는 결과값으로 최소시간,최소비용두가지로 최적화된 경로를 화면상 표기
	//	선택시 일정표에 입력한 메모들을 초기화후 일정표에 재입력해줌
	//	입력된 장소마다 메모를 입력할수 있게함(일정내용,예산)
	//	플래너 자체에 메모를 입력할수 있게함(일정내용,여행시 주의사항,예산)
	//	모든 일정의 시작 지점과 종료 지점을 기준으로 일정 반경안에 있는 숙소를 평점순으로 추천
	//	숙소 가격 범위 지정가능
	//	텍스트 형태로 장소 이름을 입력 받은후 해당 장소 목록을 평점순으로 출력
	//	아이콘 형태로 카테고리 지정
	//	카테고리 아이콘 하단에 체크박스 목록으로 태그 지정
	//	카테고리별 분류후 각 카테고리별 평점을 기준으로 정렬하여 우측바에 출력
	//	일정표상 두장소의 직선상 거리의 중심점을기준으로 반경 검색후 평점 순으로 추천
	//	선택시 일정표에 해당 장소 추가
	

	public Planner viewInfo(Planner viewPlanner);

}
