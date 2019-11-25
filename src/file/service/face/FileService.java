package file.service.face;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import board.dto.UploadFile;

public interface FileService {

	public void fileupload(HttpServletRequest req, HttpServletResponse resp);
	
	/**
	 * 
	 * @param req 파일 번호가 들어있는 리퀘스트 객체
	 * @return 파일정보
	 */
	public UploadFile getFile(HttpServletRequest req);
	
	/**
	 * 
	 * @param board 게시물 번호가 들어있는 보드 객체
	 * @return 해당정보로 불러온 파일 
	 */
	public UploadFile viewFile(Board board);
	
	/**
	 * 
	 * @param req
	 * @param resp
	 */
	public void fileupdate(HttpServletRequest req, HttpServletResponse resp);

}
