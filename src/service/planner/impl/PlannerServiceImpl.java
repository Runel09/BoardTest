package service.planner.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.place.Place;
import dto.planner.Marker;
import dto.planner.Planner;
import service.planner.face.PlannerService;

public class PlannerServiceImpl implements PlannerService {

	

	@Override
	public List<Planner> presetList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Planner> getPlanner(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> getPlace(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> getLine(List<Planner> placeIndex) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Planner> insertByMarker(Marker marker) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> allPlace() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> catPlLits(Place catInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Planner viewInfo(Planner viewPlanner) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> placeFilter(int[] placeArray) {
		// TODO Auto-generated method stub
		return null;
	}

}
