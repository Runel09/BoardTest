package board.dao.face;

import java.util.List;

import board.dto.Board;
import util.Paging;

public interface BoardDao {
	// ------------- 일반게시판 (목록)
	public List<Board> boardList();
	
	public List<Board> boardList(Paging paging);

    
	public List<Board> selectAll(); //게시글 DB에서 가져오기
	
	public List<Board> selectList(Board board);//검색어에 맞는 데이터 DB에서 가져오기-Board에 검색에 입력
	public int selectCntAll();
	
	
	
	// ------------ 일반게시판 쓰기
	
	public void insertImage(Board board); //이미지정보저장
	
	public void insertReco(Board board);//게시글 정보 저장 DB에 저장
	
	public void insertCmt(Board board);//댓글 DB에 저장
	// ------------ 일반게시물 읽기
	
	public Board selectBoardByBoardno(Board inboard);//게시물 번호를 통해 게시물 불러오기
	
	public List<Board> loadCmt(Board board);//게시물 번호를 통해 댓글 불러오기
	
	public void updateHit(Board board);//게시글 조회수 증가
	
	
	// -------------- 플래너게시물 읽기
	
	public void selectPlanner();
	
	//게시글 삭제
	public void deleteReco(Board board);//삭제할 게시물 번호를 받아서 삭제처리
	
}
