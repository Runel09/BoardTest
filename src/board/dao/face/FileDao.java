package board.dao.face;

import board.dto.UploadFile;

public interface FileDao {
	/**
	 * 입력 파일정보 객체에서 해당 정보를 꺼내 맞는 위치에 저장
	 * 
	 * @param uploadFile-입력 파일 정보 객체
	 */
	public void insert(UploadFile uploadFile);
	
}
