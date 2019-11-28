package dto.place;

import java.util.Date;

public class Comment {
	private int userno;
	private int commentNo;
	private int place_number;
	private String content;
	private Date WrittenDate;
	@Override
	public String toString() {
		return "Comment [userno=" + userno + ", commentNo=" + commentNo + ", place_number=" + place_number
				+ ", content=" + content + ", WrittenDate=" + WrittenDate + "]";
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getPlace_number() {
		return place_number;
	}
	public void setPlace_number(int place_number) {
		this.place_number = place_number;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrittenDate() {
		return WrittenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		WrittenDate = writtenDate;
	}
	
	
	
	
}
