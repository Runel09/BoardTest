package place.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbutil.DBConn;
import place.dao.face.PlaceDao;
import place.dto.PlaceDto;
import place.dto.PlaceFile;

public class PlaceDaoImpl implements PlaceDao {
	private Connection conn = null;//DB 연결 객체 
	private PreparedStatement ps =null;//SQL 수행 객체
	private ResultSet rs =null;//SQL 수행 결과 객체
	
	
	@Override
	public void insert(PlaceDto place) {
		conn=DBConn.getConnection();
		
		String sql="";
		sql +="insert into PLACEINFO(place_number,place_name,coordinate_lat,coordinate_lng,adress,place_cate,detail,db_web_site,business_hours,tel_number,place_information)";
		sql +=" values(?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1,place.getPlace_number());
			ps.setString(2,place.getPlace_name());
			ps.setDouble(3,place.getCoordinate_lat());
			ps.setDouble(4,place.getCoordinate_lng());
			ps.setString(5,place.getAddress());
			ps.setString(6,place.getPlace_cate());
			ps.setString(7,place.getDetail());
			ps.setString(8,place.getDb_web_site());
			ps.setString(9,place.getBusiness_hours());
			ps.setString(10,place.getTel_number());
			ps.setString(11,place.getPlace_information());
			
			rs=ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public int selectPlace_num() {
		conn=DBConn.getConnection();
		
		String sql="";
		sql +="select place_seq.NEXTVAL";
		sql +=" from dual";
		
		int no = 0;
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
			no=rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return no;
	}
	@Override
	public void insertFile(PlaceFile placeFile) {
		conn=DBConn.getConnection();
		
		String sql="";
		sql +="insert into placeinfo_file";
		sql +=" values(placeinfo_file_seq.NEXTVAL,?,?,?,?)";
		
		
		try {
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1,placeFile.getPlace_number());
			ps.setString(2,placeFile.getOriginname());
			ps.setString(3,placeFile.getStoredname());
			ps.setInt(4,placeFile.getFilesize());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	@Override
	public PlaceDto selectPlace(PlaceDto place) {

		conn=DBConn.getConnection();
		
		String sql="";
		sql+="select * from PLACEINFO";
		sql+=" where place_number=?";
		
		PlaceDto placedto = new PlaceDto();
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, place.getPlace_number());
			rs=ps.executeQuery();
			
			while(rs.next()) {
				placedto.setPlace_number(rs.getInt("place_number"));
				placedto.setPlace_name(rs.getString("place_name"));
				placedto.setCoordinate_lat(rs.getDouble("coordinate_lat"));
				placedto.setCoordinate_lng(rs.getDouble("coordinate_lng"));
				placedto.setAddress(rs.getString("adress"));
				placedto.setPlace_cate(rs.getString("place_cate"));
				placedto.setDetail(rs.getString("detail"));
				placedto.setDb_web_site(rs.getString("db_web_site"));
				placedto.setBusiness_hours(rs.getString("business_hours"));
				placedto.setTel_number(rs.getString("tel_number"));
				placedto.setPlace_information(rs.getString("place_information"));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return placedto;
	}

	@Override
	public PlaceFile selectfile(PlaceFile placeFile) {
		conn=DBConn.getConnection();
		
		String sql="";
		sql +="select * from placeinfo_file";
		sql +=" where place_number=?";
		
		PlaceFile placefile = new PlaceFile();
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, placefile.getPlace_number());
			rs=ps.executeQuery();
			
			while(rs.next()) {
				placefile.setFileno(rs.getInt("fileno"));
				placefile.setPlace_number(rs.getInt("place_number"));
				placefile.setOriginname(rs.getString("originname"));
				placefile.setStoredname(rs.getString("storedname"));
				placefile.setFilesize(rs.getInt("filesize"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return placefile;
	}

}
