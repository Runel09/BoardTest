package dto.planner;

public class Planner_Review {
	private int review_num;
	private int user_num;
	private int planner_num;
	private double review_score;
	private int review_char;
	@Override
	public String toString() {
		return "Planner_Review [review_num=" + review_num + ", user_num=" + user_num + ", planner_num=" + planner_num
				+ ", review_score=" + review_score + ", review_char=" + review_char + "]";
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getPlanner_num() {
		return planner_num;
	}
	public void setPlanner_num(int planner_num) {
		this.planner_num = planner_num;
	}
	public double getReview_score() {
		return review_score;
	}
	public void setReview_score(double review_score) {
		this.review_score = review_score;
	}
	public int getReview_char() {
		return review_char;
	}
	public void setReview_char(int review_char) {
		this.review_char = review_char;
	}
	

}
