package dto.board;

import java.util.Date;

public class Board {
	
	private int boardno;
	private String title;
	private String id;
	private String content;
	private int hit;
	private Date writtendate;
	private int recommend;
	private String checkboard;
	
	public String getCheckboard() {
		return checkboard;
	}

	public void setCheckboard(String checkboard) {
		this.checkboard = checkboard;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	@Override
	public String toString() {
		return "Board [boardno=" + boardno + ", title=" + title + ", id=" + id + ", content=" + content + ", hit=" + hit
				+ ", writtendate=" + writtendate + ", recommend=" + recommend + ", checkboard=" + checkboard + "]";
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getWrittendate() {
		return writtendate;
	}

	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	
	
}
