package planner.dto;

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
	int getPLANNER_NUM() {
		return PLANNER_NUM;
	}
	void setPLANNER_NUM(int pLANNER_NUM) {
		PLANNER_NUM = pLANNER_NUM;
	}
	String getPLANNER_NAME() {
		return PLANNER_NAME;
	}
	void setPLANNER_NAME(String pLANNER_NAME) {
		PLANNER_NAME = pLANNER_NAME;
	}
	int getPlannerIdxNum() {
		return plannerIdxNum;
	}
	void setPlannerIdxNum(int plannerIdxNum) {
		this.plannerIdxNum = plannerIdxNum;
	}
	int getIdxNum() {
		return IdxNum;
	}
	void setIdxNum(int idxNum) {
		IdxNum = idxNum;
	}
	int getPlannerIdx() {
		return plannerIdx;
	}
	void setPlannerIdx(int plannerIdx) {
		this.plannerIdx = plannerIdx;
	}
	int getPLACE_NUMBER() {
		return PLACE_NUMBER;
	}
	void setPLACE_NUMBER(int pLACE_NUMBER) {
		PLACE_NUMBER = pLACE_NUMBER;
	}
	
}
