package dto.board;

import java.util.Date;

public class Comment {

	private int commentno;
	private int boardno;
	private String user_id;
	private String content;
	private Date writtendate;
	@Override
	public String toString() {
		return "Comment [commentno=" + commentno + ", boardno=" + boardno + ", user_id=" + user_id + ", content="
				+ content + ", writtendate=" + writtendate + "]";
	}
	public int getCommentno() {
		return commentno;
	}
	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
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
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}


}