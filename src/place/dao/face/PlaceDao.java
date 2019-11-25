package place.dao.face;

import java.util.List;

import place.dto.PlaceDto;

public interface PlaceDao {
	
	/**
	 * 
	 * @return DB에 존재하는 모든 마커 포인트 정보
	 */
	public List<PlaceDto> selectAll();
	
	/**
	 * 
	 * @return DB에 존재하는 모든 장소의 지리정보
	 */
	public List<PlaceDto> selectAllLocation();

}
