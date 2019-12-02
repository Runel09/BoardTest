package service.board.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.board.Board;
import dto.board.BoardFile;
import dto.board.Comment;
import dto.board.Recommend;
import dto.board.Report;
import util.Paging;

public interface BoardService {

	/**
	 * 게시글 목록 조회
	 * 
	 * @return List - 게시글 목록
	 */
	public List<Board> getList();

	
	
	/**
	 * 페이징 정보를 활용하여 보여질 게시글 목록만 조회
	 * 
	 * @param Paging - 페이징 정보
	 * @return List - 게시글 목록
	 */

	public List<Board> getFreeList(Paging paging);
	public List<Board> getTipList(Paging paging);
	public List<Board> getQuestionList(Paging paging);
	public List<Board> getPlannerList(Paging paging);
	
	public Board getBoardno(HttpServletRequest req);

	public Board view(Board board);

	/**
	 * 요청파라미터 curPage를 파싱한다
	 * Borad TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
	 * 
	 * @param req - 요청정보 객체
	 * @return Paging - 페이징 정보
	 */
	public Paging getPaging(HttpServletRequest req);


	/**
	 * 
	 * 
	 * @param board - 등록할 내용
	 */
	public void write(Board board);


	public void write(HttpServletRequest req, HttpServletResponse resp);


	public BoardFile getBoardFileByBoardno(int boardno);


	public BoardFile getFileno(HttpServletRequest req);


	public BoardFile getFile(BoardFile boardFile);


	public void update(HttpServletRequest req);

	
	public void delete(Board board);

	
	public List<Comment> commentList(Board board);

	
	public void commentInsert(Comment comment);

	
	public void commentDelete(Comment comment);

	
	public void deleteCheckBoardno(String[] check);
	
	
	public String getNick(Board board);
	
	/**
	 * 게시글 추천 상태 조회
	 * 
	 * @param recommend - 추천 상태 체크 객체
	 * @return boolean - true:추천했음, false:추천하지않았음
	 */
	public boolean isRecommend(Recommend recommend);
	
	/**
	 * 추천 정보 파라미터 얻기
	 * 
	 * @param req - 요청 정보 객체
	 * @return Recommend - 추천 정보 객체
	 */
	public Recommend getRecommend(HttpServletRequest req);
	
	/**
	 * 추천 토글
	 * 
	 * @param recommend - 추천 정보 객체
	 * @return boolean - true:추천 성공, false:추천취소 성공
	 */
	public boolean recommend(Recommend recommend);
	
	/**
	 * 게시글의 총 추천 수 구하기
	 * 
	 * @param board - 해당 게시글
	 * @return int - 총 추천 수
	 */
	public int getTotalCntRecommend(Recommend recommend);



	public void updateReport(Board board);



	public void insertReport(Report report);
}
