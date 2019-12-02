package dto.board;

public class Report {
	 
	 private String db_id;	
	 private int boardno; 
	 private String reason; 
	 private String content;

	 
	 public String getDb_id() {
		return db_id;
	}
	public void setDb_id(String db_id) {
		this.db_id = db_id;
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
	@Override
	public String toString() {
		return "Report [db_id=" + db_id + ", boardno=" + boardno + ", reason=" + reason + ", content=" + content + "]";
	}
}
