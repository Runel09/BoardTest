package dao.place.face;

import java.util.List;

import dto.place.Paging;
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
	
	public int selectCnAll(Paging paging);
	
	
	public List<PlaceDto> selectAll(Paging paging);

	/**
	 * 이전 파일지우기
	 * @param prevfile-이전 첨부파일
	 */
	public void delete(PlaceFile prevfile);

	/**
	 * 장소정보 수정
	 * @param place-수정할 장소
	 */
	public void updatePlace(PlaceDto place);

	/**
	 * 첨부파일 가져오기
	 * @param place-해당 장소
	 * @return-첨부파일
	 */
	public PlaceFile getfile(PlaceDto place);
	
	
	
		
}
