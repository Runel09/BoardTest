package dto.planner;

public class Planner {
	private int PLANNER_NUM;
	private String PLANNER_NAME;
	private int plannerIdxNum;
	private int IdxNum;
	private int plannerIdx;
	private int PLACE_NUMBER;
	private int trip_nation;
	private int trip_date;
	private int trip_season;
	private int trip_theme;
	private int planner_writer;
	public int getPLANNER_NUM() {
		return PLANNER_NUM;
	}
	public void setPLANNER_NUM(int pLANNER_NUM) {
		PLANNER_NUM = pLANNER_NUM;
	}
	public String getPLANNER_NAME() {
		return PLANNER_NAME;
	}
	public void setPLANNER_NAME(String pLANNER_NAME) {
		PLANNER_NAME = pLANNER_NAME;
	}
	public int getPlannerIdxNum() {
		return plannerIdxNum;
	}
	public void setPlannerIdxNum(int plannerIdxNum) {
		this.plannerIdxNum = plannerIdxNum;
	}
	public int getIdxNum() {
		return IdxNum;
	}
	public void setIdxNum(int idxNum) {
		IdxNum = idxNum;
	}
	public int getPlannerIdx() {
		return plannerIdx;
	}
	public void setPlannerIdx(int plannerIdx) {
		this.plannerIdx = plannerIdx;
	}
	public int getPLACE_NUMBER() {
		return PLACE_NUMBER;
	}
	public void setPLACE_NUMBER(int pLACE_NUMBER) {
		PLACE_NUMBER = pLACE_NUMBER;
	}
	public int getTrip_nation() {
		return trip_nation;
	}
	public void setTrip_nation(int trip_nation) {
		this.trip_nation = trip_nation;
	}
	public int getTrip_date() {
		return trip_date;
	}
	public void setTrip_date(int trip_date) {
		this.trip_date = trip_date;
	}
	public int getTrip_season() {
		return trip_season;
	}
	public void setTrip_season(int trip_season) {
		this.trip_season = trip_season;
	}
	public int getTrip_theme() {
		return trip_theme;
	}
	public void setTrip_theme(int trip_theme) {
		this.trip_theme = trip_theme;
	}
	public int getPlanner_writer() {
		return planner_writer;
	}
	public void setPlanner_writer(int planner_writer) {
		this.planner_writer = planner_writer;
	}
	@Override
	public String toString() {
		return "Planner [PLANNER_NUM=" + PLANNER_NUM + ", PLANNER_NAME=" + PLANNER_NAME + ", plannerIdxNum="
				+ plannerIdxNum + ", IdxNum=" + IdxNum + ", plannerIdx=" + plannerIdx + ", PLACE_NUMBER=" + PLACE_NUMBER
				+ ", trip_nation=" + trip_nation + ", trip_date=" + trip_date + ", trip_season=" + trip_season
				+ ", trip_theme=" + trip_theme + ", planner_writer=" + planner_writer + "]";
	}
	

}
