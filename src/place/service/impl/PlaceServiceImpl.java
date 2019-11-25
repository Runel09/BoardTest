package place.service.impl;

import java.util.List;

import place.dao.face.PlaceDao;
import place.dao.impl.PlaceDaoImpl;
import place.dto.PlaceDto;
import place.service.face.PlaceService;

public class PlaceServiceImpl implements PlaceService{
	PlaceDao placeDao=new PlaceDaoImpl();
	@Override
	public PlaceDto getInfoByplaceno(int placeno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaceDto> getAlleGeoInfo() {
		
		return placeDao.selectAllLocation();
	}

}
