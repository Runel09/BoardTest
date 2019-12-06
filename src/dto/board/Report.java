package dto.board;

public class Report {
	 
	 private String user_id;	
	 private int boardno; 
	 private String reason; 
	 private String content;
	 private int reportno;
	
	 @Override
	public String toString() {
		return "Report [user_id=" + user_id + ", boardno=" + boardno + ", reason=" + reason + ", content=" + content
				+ ", reportno=" + reportno + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReportno() {
		return reportno;
	}
	public void setReportno(int reportno) {
		this.reportno = reportno;
	}

	
}
