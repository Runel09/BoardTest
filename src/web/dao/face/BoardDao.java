package web.dao.face;

import java.util.List;

import util.Paging;
import web.dto.Board;

public interface BoardDao {

	
	// ------------ 일반게시판 쓰기
	
	public void insertText(); //텍스트정보저장
	
	public void insertImage(); //이미지정보저장
	
	// ------------ 일반게시판 읽기
	
	public void selectBoard();//게시판 DB데이터 받아오기
	
	public void insertReco();//추천수 DB에 저장
	
	public void insertCmt();//댓글 DB에 저장
	
	// ------------- 일반게시판 읽기(목록)
	
	public List<Board> selectAll(Paging paging); //게시글 DB에서 가져오기
	
	public void selectList();//검색어에 맞는 데이터 DB에서 가져오기
	
	// -------------- 플래너게시판 읽기
	
	public void selectPlanner();
	
}
