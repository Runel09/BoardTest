package dao.place.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.place.face.PlaceDao;
import dbutill.DBConn;
import dto.place.Paging;
import dto.place.PlaceDto;
import dto.place.PlaceFile;


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
				placedto.setReview_score(rs.getInt("review_score"));
				
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
	
	
	@Override
	public int selectCnAll(Paging paging) {
		
		System.out.println("selectcnAll"+paging.getCate());
		System.out.println(paging.getSearch());
		conn=DBConn.getConnection();
		String sql="";
//		if(paging.getSearch() != null) {
//			sql += "SELECT count(*) FROM placeinfo";
//			sql += " WHERE place_name LIKE ?";
//		}
//		else if(paging.getCate() != null){
//			sql +="SELECT count(*) FROM placeinfo";
//			sql +=" WHERE PLACE_CATE LIKE ?";
//		}
//		else{		
//			sql += "SELECT count(*) FROM placeinfo";
//		}
//		
		//--------------------------------------------------------
			sql +="SELECT count(*) FROM placeinfo";
		if(paging.getSearch() != null && paging.getCate() == null) {
			sql += " where place_name LIKE '%'||'"+paging.getSearch()+"'||'%'";
		}else if(paging.getCate() != null && "".equals(paging.getSearch())) {
			sql += " where place_cate LIKE '%'||'"+paging.getCate()+"'||'%'"; 		
		}else if(paging.getCate() != null && !"".equals(paging.getSearch())) {
			sql += " where place_name LIKE '%'||'"+paging.getSearch()+"'||'%'";
			sql += " AND place_cate LIKE '%'||'"+paging.getCate()+"'||'%'";
		}
		
			
		
		//최종 
		int cnt =0;
		
		try {
//			if(paging.getSearch() != null) {
//			   ps=conn.prepareStatement(sql);
//			   ps.setString(1, "%" + paging.getSearch() + "%");
//			   rs=ps.executeQuery();
//			}
//			else if(paging.getCate() != null) {
//			   ps=conn.prepareStatement(sql);	
//			   ps.setString(2, "%" + paging.getCate() + "%");
//			   rs=ps.executeQuery();
//			}
//			else{
//				ps=conn.prepareStatement(sql);
//				rs=ps.executeQuery();
//			}
			
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				
				cnt=rs.getInt(1);
				System.out.println("cnt:"+cnt);
			}
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return cnt;
		
		


	}
	
	@Override
	public List<PlaceDto> selectAll(Paging paging) {
		conn=DBConn.getConnection();
		
		String sql = "";

		sql += "select * from(";
		sql += " select rownum rnum, B.* FROM(";
		sql += " select place_number, place_name, adress, place_cate, favorite_count from placeinfo";
		if( paging.getSearch() != null && !"".equals(paging.getSearch()) && paging.getCate() == null ) {
			sql += " where place_name LIKE '%'||'"+paging.getSearch()+"'||'%'";
		}
		else if(paging.getCate() != null && paging.getSearch() == null) {
			sql += " where place_cate LIKE '%'||'"+paging.getCate()+"'||'%'";
		}
		else if (paging.getSearch() != null && paging.getCate() != null) {
			sql += " where place_name LIKE '%'||'"+paging.getSearch()+"'||'%'";
			sql += " AND place_cate LIKE '%'||'"+paging.getCate()+"'||'%'";
		}
		sql += " order by place_number desc";
		sql += " )B";
		sql += " ORDER BY rnum";
		sql += " )BOARD";
		sql += " WHERE rnum BETWEEN ? AND ?";

		List list = new ArrayList();
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());

			rs= ps.executeQuery();
			while(rs.next()) {
				PlaceDto placeDto = new PlaceDto();
				
				placeDto.setPlace_number(rs.getInt("place_number"));
				placeDto.setPlace_name(rs.getString("place_name"));
				placeDto.setAddress(rs.getString("adress"));
				placeDto.setPlace_cate(rs.getString("place_cate"));
				placeDto.setFavorite_count(rs.getInt("favorite_count"));
				
				list.add(placeDto);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void delete(PlaceFile prevfile) {
		conn= DBConn.getConnection();

	      PlaceFile placefile=new PlaceFile();
	      String sql="";
	      sql+="DELETE FROM placeinfo_file";
	      sql+=" WHERE fileno=?";

	      try {
	         ps = conn.prepareStatement(sql);// 수행객체 얻기
	         ps.setInt(1, placefile.getFileno());
	         rs = ps.executeQuery();// sql 수행결과 얻기

	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if( rs!=null)rs.close();
	            if( ps!=null)ps.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		
	}

	@Override
	public void updatePlace(PlaceDto place) {
		conn = DBConn.getConnection(); // DB연결

	      // 수행할 SQL 쿼리
	      String sql = "";
	      sql += "UPDATE placeinfo SET place_name=?, coordinate_lat=?,coordinate_lng=?,";
	      sql +=" adress=?, place_cate=?, detail=?,db_web_site=?,business_hours=?,";
	      sql +=" tel_number=?, place_information=?";
	      sql += " WHERE place_number=?";
	      
	      try {
	         ps = conn.prepareStatement(sql);// sql 수행 객체

	         // sql쿼리의 ? 채우기
	         ps.setString(1, place.getPlace_name());
	         ps.setDouble(2, place.getCoordinate_lat());
	         ps.setDouble(3, place.getCoordinate_lng());
	         ps.setString(4, place.getAddress());
	         ps.setString(5, place.getPlace_cate());
	         ps.setString(6, place.getDetail());
	         ps.setString(7, place.getDb_web_site());
	         ps.setString(8, place.getBusiness_hours());
	         ps.setString(9, place.getTel_number());
	         ps.setString(10, place.getPlace_information());
	         ps.setInt(11, place.getPlace_number());
	         ps.execute();// sql 수행

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (ps != null)
	               ps.close();
	         } catch (SQLException e) {

	            e.printStackTrace();
	         }
	      }
	      
	      
	   }

	@Override
	public PlaceFile getfile(PlaceDto place) {
		conn = DBConn.getConnection(); // DB연결

	      PlaceFile placefile = null;
	      
	      // 수행할 SQL 쿼리
	      String sql = "";
	      sql += "SELECT * FROM placeinfo_file";
	      sql += " WHERE place_number=?";
	      try {
	         ps = conn.prepareStatement(sql);// 수행객체 얻기
	         ps.setInt(1, place.getPlace_number());
	         rs = ps.executeQuery();// sql 수행결과 얻기
	         

	         // SQL 수행결과 처리
	         while (rs.next()) {

	            placefile = new PlaceFile();
	            placefile.setFileno(rs.getInt("fileno"));
	            placefile.setOriginname(rs.getString("originname"));
	            placefile.setStoredname(rs.getString("storedname"));
//	            placefile.setWritedate(rs.getDate("writedate"));
	            placefile.setFilesize(rs.getInt("filesize"));
	            place.setPlace_number(rs.getInt("boardno"));

	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      finally {
	         try {
	            if( rs!=null)rs.close();
	            if( ps!=null)ps.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return placefile;
	}
		
	
	
	
	
	
	
	
	
	
	
}
	
	

