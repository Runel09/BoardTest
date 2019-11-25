package web.dto;

public class Board2 {

	private int board_num;// 게시글 번호
	private String board_name; // 게시글 제목
	private String board_text; // 게시글 본문
	private String board_writer; // 게시글 작성자
	private int board_cate; // 게시글 작성시간
	private int board_recos; // 게시글 추천수
	private int board_views; // 게시글 조회수
	
	private int file_num; // 파일 번호
	private String file_name; // 파일 이름
	private String file_addr; // 파일 주소
	private int file_type; // 파일 타입
	
	private int cmt_num; // 댓글 번호
	private String cmt_text; // 댓글 내용
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_text() {
		return board_text;
	}
	public void setBoard_text(String board_text) {
		this.board_text = board_text;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public int getBoard_cate() {
		return board_cate;
	}
	public void setBoard_cate(int board_cate) {
		this.board_cate = board_cate;
	}
	public int getBoard_recos() {
		return board_recos;
	}
	public void setBoard_recos(int board_recos) {
		this.board_recos = board_recos;
	}
	public int getBoard_views() {
		return board_views;
	}
	public void setBoard_views(int board_views) {
		this.board_views = board_views;
	}
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_addr() {
		return file_addr;
	}
	public void setFile_addr(String file_addr) {
		this.file_addr = file_addr;
	}
	public int getFile_type() {
		return file_type;
	}
	public void setFile_type(int file_type) {
		this.file_type = file_type;
	}
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}
	public String getCmt_text() {
		return cmt_text;
	}
	public void setCmt_text(String cmt_text) {
		this.cmt_text = cmt_text;
	}
	

	
}
