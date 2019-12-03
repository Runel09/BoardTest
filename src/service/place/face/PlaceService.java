package service.place.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.place.Comment;
import dto.place.Paging;
import dto.place.PlaceDto;
import dto.place.PlaceFile;


public interface PlaceService {
	public void write(HttpServletRequest req);
	
	public void write(PlaceDto place);
	
	public PlaceDto getPlace_number(HttpServletRequest req);
	
	public PlaceDto view(PlaceDto place);
	
	public PlaceFile getfilePlace_number(HttpServletRequest req);
	
	public PlaceFile fileview(PlaceFile placefile);
	
	
	/**
	 * 댓글 전달파라미터 꺼내기
	 */
	public Comment getComment(HttpServletRequest req);
	
	/**
	 * 댓글 입력
	 * 
	 * @param comment - 삽입될 댓글
	 */
	public void insertComment(Comment comment);
	
	/**
	 * 댓글 리스트
	 * 
	 * @param board - 댓글이 조회될 게시글
	 * @return List - 댓글 리스트
	 */
	public List getCommentList(PlaceDto place);
	
	/**
	 * 댓글 삭제
	 *  
	 * @param comment - 삭제할 댓글
	 * @return boolean - 삭제 성공 여부
	 */
	public boolean deleteComment(Comment comment);
	
	
	public List<PlaceDto> getAlleGeoInfo();
	
	public Paging getPaging(HttpServletRequest req);
	
	public List getList(Paging paging);
	
	
}
