package board.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.dto.Board;
import util.Paging;

public interface BoardService {
	public List<Board> listview();
	
	/**
	 *  페이징 정보를 활용하여 보여질 게시글 목록만 조회
	 * @param paging-페이징 정보
	 * @return List - 게시글 목록
	 */
	public List<Board> listview(Paging paging);
	
	public Board getBoardno(HttpServletRequest req);
	
	
	/**
	 * 요청파라미터 curPage를 파싱한
	 * @param req
	 * @return
	 */
	public Paging getPaging(HttpServletRequest req);
	

	public Board view(Board board);//게시판 DB데이터 받아오기
	
	//-------------------------------------------------
	// ------------- 일반 게시판 ( 쓰기 )
	public void writeBoard(Board board);
	
		
	// ------------- 일반 게시판 ( 읽기 )
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
