package place.service.face;

import java.util.List;

import place.dto.PlaceDto;

public interface PlaceService {

	public PlaceDto getInfoByplaceno(int placeno);
	/**
	 * 
	 * @return
	 */
	public List<PlaceDto> getAlleGeoInfo();
}
