package dto.planner;

public class Index {
	private int index_num;
	private int planner_num;
	private int place_num;
	private int planner_date;
	@Override
	public String toString() {
		return "Index [index_num=" + index_num + ", planner_num=" + planner_num + ", place_num=" + place_num
				+ ", planner_date=" + planner_date + "]";
	}
	public int getIndex_num() {
		return index_num;
	}
	public void setIndex_num(int index_num) {
		this.index_num = index_num;
	}
	public int getPlanner_num() {
		return planner_num;
	}
	public void setPlanner_num(int planner_num) {
		this.planner_num = planner_num;
	}
	public int getPlace_num() {
		return place_num;
	}
	public void setPlace_num(int place_num) {
		this.place_num = place_num;
	}
	public int getPlanner_date() {
		return planner_date;
	}
	public void setPlanner_date(int planner_date) {
		this.planner_date = planner_date;
	}
	

}
