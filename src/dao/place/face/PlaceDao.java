package dao.place.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.place.PlaceDto;
import dto.place.PlaceFile;

public interface PlaceDao {
	public void insert(PlaceDto place);
	
	public int selectPlace_num();
	
	public void insertFile(PlaceFile placeFile);
	
	
	public PlaceDto selectPlace(PlaceDto place);
	
	public PlaceFile selectfile(PlaceFile placeFile);
	
	/**
	 * 
	 * @return DB에 존재하는 모든 장소의 지리정보
	 */
	public List<PlaceDto> selectAllLocation();

	public PlaceFile getfile(PlaceDto place);

	/**
	 * 장소정보 수정
	 * @param req- 요청객체(place_number)
	 */
	void updatePlace(PlaceDto place);
	
	/**
	 * 기존의 첨부파일 삭제
	 * @param prevfile-기존 첨부파일 객체
	 */
	public void delete(PlaceFile prevfile);
}
