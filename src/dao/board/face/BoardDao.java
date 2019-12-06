package dao.board.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.board.Board;
import dto.board.BoardFile;
import dto.board.PlanBoard;
import dto.board.Report;
import util.Paging;

public interface BoardDao {

	/**
	 * 게시글 전체 목록 조회
	 * 
	 * @return List - 조회된 게시글 목록
	 */
	public List<Board> selectAll();
	
	public String selectNickByUserid(Board board);
	/**
	 * 페이징 대상 게시글 목록 조회
	 * 
	 * @param Paging - 페이징 정보
	 * @return List - 조회된 게시글 목록
	 */
	public List<Board> selectFreeAll(Paging paging);
	public List<Board> selectQuestionAll(Paging paging);
	public List<Board> selectTipAll(Paging paging);
	public List<PlanBoard> selectPlannerAll(Paging paging);

	public Board selectBoardByBoardno(Board board);

	public void updateHit(Board board);

	
	public int selectCntPlanner(Paging paging);
	
	/**
	 * 총 게시글 수 조회
	 * @param req 
	 * 
	 * @return int - 총 게시글 수
	 */
	public int selectCntAll(HttpServletRequest req);


	/**
	 * 입력한 내용을 데이터 베이스에 저장
	 * 
	 * @param board - 작성한 게시글
	 */	
	public void insert(Board board);
	
	public int selectBoardno();
	
	public void insertFile(BoardFile boardFile);


	public BoardFile selectBoardFileByBoardno(int boardno);


	public BoardFile selectByFileno(BoardFile boardFile);


	public Board selectByBoardno(Board board);


	public void update(Board board);


	public void deleteFileByBoardno(Board board);


	public void deleteBoardByboardno(Board board);


	public void deleteBoardList(String[] check);


	public void plusReport(Board board);

	public void insertReport(Report report);

	public List<Board> selectEventAll(Paging paging);


	
	
	
}
