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
	
	public int selectCnAll(String search);
	
	
	public List<PlaceDto> selectAll(Paging paging);
}
