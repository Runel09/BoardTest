package place.dto;

public class PlaceDto {
	private int place_number;
	private String place_name;
	private Double coordinate_lat;
	private Double coordinate_lng;
	private String address;
	private String place_cate;
	private String detail;
	private String db_web_site;
	private String business_hours;
	private String tel_number;
	private double score;
	private int views_number;
	private String place_information;
	private int favorite_count;
	private int review_number;
	private int review_score;
	private String review_char;
	@Override
	public String toString() {
		return "PlaceDto [place_number=" + place_number + ", place_name=" + place_name + ", coordinate_lat="
				+ coordinate_lat + ", coordinate_lng=" + coordinate_lng + ", address=" + address + ", place_cate="
				+ place_cate + ", detail=" + detail + ", db_web_site=" + db_web_site + ", business_hours="
				+ business_hours + ", tel_number=" + tel_number + ", score=" + score + ", views_number=" + views_number
				+ ", place_information=" + place_information + ", favorite_count=" + favorite_count + ", review_number="
				+ review_number + ", review_score=" + review_score + ", review_char=" + review_char + "]";
	}
	public int getPlace_number() {
		return place_number;
	}
	public void setPlace_number(int place_number) {
		this.place_number = place_number;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public Double getCoordinate_lat() {
		return coordinate_lat;
	}
	public void setCoordinate_lat(Double coordinate_lat) {
		this.coordinate_lat = coordinate_lat;
	}
	public Double getCoordinate_lng() {
		return coordinate_lng;
	}
	public void setCoordinate_lng(Double coordinate_lng) {
		this.coordinate_lng = coordinate_lng;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPlace_cate() {
		return place_cate;
	}
	public void setPlace_cate(String place_cate) {
		this.place_cate = place_cate;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDb_web_site() {
		return db_web_site;
	}
	public void setDb_web_site(String db_web_site) {
		this.db_web_site = db_web_site;
	}
	public String getBusiness_hours() {
		return business_hours;
	}
	public void setBusiness_hours(String business_hours) {
		this.business_hours = business_hours;
	}
	public String getTel_number() {
		return tel_number;
	}
	public void setTel_number(String tel_number) {
		this.tel_number = tel_number;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public int getViews_number() {
		return views_number;
	}
	public void setViews_number(int views_number) {
		this.views_number = views_number;
	}
	public String getPlace_information() {
		return place_information;
	}
	public void setPlace_information(String place_information) {
		this.place_information = place_information;
	}
	public int getFavorite_count() {
		return favorite_count;
	}
	public void setFavorite_count(int favorite_count) {
		this.favorite_count = favorite_count;
	}
	public int getReview_number() {
		return review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
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
