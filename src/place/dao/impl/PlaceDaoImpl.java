package place.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.dto.Board;
import dbutil.DBConn;
import place.dao.face.PlaceDao;
import place.dto.PlaceDto;

public class PlaceDaoImpl implements PlaceDao {

	private Connection conn = null;// DB연결 객체
	private PreparedStatement ps = null;// SQL 수행 객체
	private ResultSet rs = null;// SQL 수행 결과 객체
	
	@Override
	public List<PlaceDto> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaceDto> selectAllLocation() {
		conn = DBConn.getConnection();// DB 연결
		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT *";
		sql += " FROM PLACEINFO order by place_number";
		
		List<PlaceDto> list = new ArrayList<PlaceDto>();
		try {
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				PlaceDto place = new PlaceDto();
				place.setPlace_number(rs.getInt("place_number"));
				place.setPlace_name(rs.getString("place_name"));
				place.setCoordinate_lat(rs.getDouble("coordinate_lat"));
				place.setCoordinate_lng(rs.getDouble("coordinate_lng"));
				place.setAddress(rs.getString("adress"));
				place.setPlace_cate(rs.getString("place_cate"));
				place.setDetail(rs.getString("detail"));
				place.setDb_web_site(rs.getString("db_web_site"));
				place.setBusiness_hours(rs.getString("business_hours"));
				place.setTel_number(rs.getString("tel_number"));
				place.setScore(rs.getDouble("score"));
				
				list.add(place);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		for(PlaceDto model : list) {
            System.out.println(model.getPlace_name());
        }
		return list;
	}

}
