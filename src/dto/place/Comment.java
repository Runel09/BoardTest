package dto.place;

import java.util.Date;

public class Comment {
	private int review_number;
	private int user_number;
	private int place_number;
	private int review_score;
	private String review_char;
	@Override
	public String toString() {
		return "Comment [review_number=" + review_number + ", user_number=" + user_number + ", place_number="
				+ place_number + ", review_score=" + review_score + ", review_char=" + review_char + "]";
	}
	public int getReview_number() {
		return review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}
	public int getUser_number() {
		return user_number;
	}
	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}
	public int getPlace_number() {
		return place_number;
	}
	public void setPlace_number(int place_number) {
		this.place_number = place_number;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public String getReview_char() {
		return review_char;
	}
	public void setReview_char(String review_char) {
		this.review_char = review_char;
	}
	
	
	
	
	
}
