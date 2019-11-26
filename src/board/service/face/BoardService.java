package board.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import board.dto.BoardFile;
import board.dto.Comment;
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
	public List<Board> getList(Paging paging);

	
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

	public void recommend(Board recommendBoard);


	public int getRecommendCount(Board recommendBoard);


	public boolean checkRecommend(Board recommendBoard);
	
	public String getNick(Board board);
}
