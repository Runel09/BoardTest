package dto.board;

public class Recommend {
	private String user_id;
	private int boardno;
	@Override
	public String toString() {
		return "Recommend [user_id=" + user_id + ", boardno=" + boardno + "]";
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
	
}