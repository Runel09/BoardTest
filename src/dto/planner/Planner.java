package dto.planner;

public class Planner {
	private int PLANNER_NUM;
	private int USER_NUMBER; 
	private String PLANNER_NAME;
	private String trip_nation;
	private String trip_date;
	private String trip_season;
	private String trip_theme;
	
	@Override
	public String toString() {
		return "Planner [PLANNER_NUM=" + PLANNER_NUM + ", USER_NUMBER=" + USER_NUMBER + ", PLANNER_NAME=" + PLANNER_NAME
				+ ", trip_nation=" + trip_nation + ", trip_date=" + trip_date + ", trip_season=" + trip_season
				+ ", trip_theme=" + trip_theme + "]";
	}
	public int getPLANNER_NUM() {
		return PLANNER_NUM;
	}
	public void setPLANNER_NUM(int pLANNER_NUM) {
		PLANNER_NUM = pLANNER_NUM;
	}
	public int getUSER_NUMBER() {
		return USER_NUMBER;
	}
	public void setUSER_NUMBER(int uSER_NUMBER) {
		USER_NUMBER = uSER_NUMBER;
	}
	public String getPLANNER_NAME() {
		return PLANNER_NAME;
	}
	public void setPLANNER_NAME(String pLANNER_NAME) {
		PLANNER_NAME = pLANNER_NAME;
	}
	public String getTrip_nation() {
		return trip_nation;
	}
	public void setTrip_nation(String trip_nation) {
		this.trip_nation = trip_nation;
	}
	public String getTrip_date() {
		return trip_date;
	}
	public void setTrip_date(String trip_date) {
		this.trip_date = trip_date;
	}
	public String getTrip_season() {
		return trip_season;
	}
	public void setTrip_season(String trip_season) {
		this.trip_season = trip_season;
	}
	public String getTrip_theme() {
		return trip_theme;
	}
	public void setTrip_theme(String trip_theme) {
		this.trip_theme = trip_theme;
	}
	
	

}
