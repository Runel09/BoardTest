package dto.board;

import java.util.Date;

public class Board {
	
	private int boardno;
	private String title;
	private String user_id;
	private String content;
	private int hit;
	private Date writtendate;
	private int recommend;
	private String checkboard;
	
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public String getCheckboard() {
		return checkboard;
	}
	public void setCheckboard(String checkboard) {
		this.checkboard = checkboard;
	}
	public int getBoardrepo() {
		return boardrepo;
	}
	public void setBoardrepo(int boardrepo) {
		this.boardrepo = boardrepo;
	}

	private int boardrepo;
	
	@Override
	public String toString() {
		return "Board [boardno=" + boardno + ", title=" + title + ", user_id=" + user_id + ", content=" + content
				+ ", hit=" + hit + ", writtendate=" + writtendate + ", recommend=" + recommend + ", checkboard="
				+ checkboard + ", boardrepo=" + boardrepo + "]";
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
