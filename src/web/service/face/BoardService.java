package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.Board2;

public interface BoardService {
	
	/**
	 * Board DTO 형식의 전달 파라미터를 파싱한다 
	 *
	 * @param req - 요청 정보 객체
	 * @return Board - 전달 받은 요청 파라미터 정보
	 */
	public Board2 getParam(HttpServletRequest req);
	
	// ------------- 일반 게시판 ( 쓰기 )
	
	public void writeBoard();
	
	// ------------- 일반 게시판 ( 읽기 )
	
	public Paging getPaging(HttpServletRequest req);
	
	public List<Board2> getList(Paging paging);
	
	public void readBoard(); //게시판 DB데이터 받아오기
	
	public void recoBoard(); //추천수 DB에 저장,가져오기
	
	public void downLoad(); //게시글 다운로드
	
	public void repoBoard(); //신고하기
	
	public void cmtBoard(); //댓글작성
	
	// ------------- 일반 게시판 ( 읽기 - 목록 )
	
	public void readAll();//게시글 DB에서 가져오기 
	
	public void searchBoard();//검색메소드
	
	// -------------- 플래너 게시판 ( 읽기 )
	
	public void readPlanner();//카테고리별로 플래너 DB에서 출력
	
	
	
	
	
	
}
