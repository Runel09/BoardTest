package web.dto;

public class PlanBoard {
	private int trip_nation; // 여행 국가
	private int trip_date; // 여행 기간
	private int trip_season; // 여행 시즌
	private int trip_theme; // 여행 테마
	
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
}
