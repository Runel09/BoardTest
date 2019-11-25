package file.dao.face;



import board.dto.UploadFile;

public interface FileDao {
	/**
	 * 입력 파일정보 객체에서 해당 정보를 꺼내 맞는 위치에 저장
	 * 
	 * @param uploadFile-입력 파일 정보 객체
	 */
	public void insert(UploadFile uploadFile);
	
	/**
	 * 
	 * @param boardno 참조값
	 * @return 해당 boardno에 해당하는 파일 정보
	 */
	public UploadFile selectByBoardNo(int boardno);

	public UploadFile selectByfileNo(int fileno);
	
	
	
}
