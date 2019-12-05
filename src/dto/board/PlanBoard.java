package dto.board;

public class PlanBoard {
	private String travel_place; // 여행 국가
	private String travel_date; // 여행 기간
	private String travel_season; // 여행 시즌
	private String travel_thema; // 여행 테마
	
	public String getTravel_place() {
		return travel_place;
	}
	public void setTravel_place(String travel_place) {
		this.travel_place = travel_place;
	}
	public String getTravel_date() {
		return travel_date;
	}
	public void setTravel_date(String travel_date) {
		this.travel_date = travel_date;
	}
	public String getTravel_season() {
		return travel_season;
	}
	public void setTravel_season(String travel_season) {
		this.travel_season = travel_season;
	}
	public String getTravel_thema() {
		return travel_thema;
	}
	public void setTravel_thema(String travel_thema) {
		this.travel_thema = travel_thema;
	}
	@Override
	public String toString() {
		return "PlanBoard [travel_place=" + travel_place + ", travel_date=" + travel_date + ", travel_season="
				+ travel_season + ", travel_thema=" + travel_thema + "]";
	}
	
}