package place.dao.face;

import place.dto.PlaceDto;
import place.dto.PlaceFile;

public interface PlaceDao {
	public void insert(PlaceDto place);
	
	public int selectPlace_num();
	
	public void insertFile(PlaceFile placeFile);
	
	
	public PlaceDto selectPlace(PlaceDto place);
	
	public PlaceFile selectfile(PlaceFile placeFile);
	
}
