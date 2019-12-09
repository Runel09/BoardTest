package dao.planner.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.planner.face.PlannerDao;
import dbutil.DBConn;
import dto.planner.Index;
import dto.planner.Planner;

public class PlannerDaoImpl implements PlannerDao {
	private Connection conn = null; // DB연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL수행 결과 객체

	@Override
	public Planner getParam(Planner SelectedPlanner) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPlannerNum() {
		int planner_num = 0;
		conn = DBConn.getConnection();// DB 연결
		String sql = "";
		sql += "SELECT planner_seq.NEXTVAL FROM DUAL";

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				planner_num = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return planner_num;
	}

	@Override
	public void insert_planner(Planner planner) {
		conn = DBConn.getConnection();// DB 연결
		// 수행할 SQL 쿼리
		String sql = "";

		sql += "INSERT INTO PLANNERINFO(PLANNER_NUM, USER_NUMBER, PLANNER_NAME, TRIP_NATION, TRIP_DATE, TRIP_SEASON, TRIP_THEME)";
		sql += " VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, planner.getPLANNER_NUM());
			ps.setInt(2, planner.getUSER_NUMBER());
			ps.setString(3, planner.getPLANNER_NAME());
			ps.setString(4, planner.getTrip_nation());
			ps.setString(5, planner.getTrip_date());
			ps.setString(6, planner.getTrip_season());
			ps.setString(7, planner.getTrip_theme());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

	@Override
	public void insert_index(List<Index> indexList) {
		conn = DBConn.getConnection();// DB 연결
		// 수행할 SQL 쿼리
		String sql = "";

		sql += "INSERT INTO PLANNER_IDX(INDEX_NUM, PLANNER_NUM, PLACE_NUMBER, PLANNER_DATE)";
		sql += " VALUES (planner_index_seq.nextval, ?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			for(int i = 0 ;i<indexList.size();i++) {
				ps.setInt(1, indexList.get(i).getPlanner_num());
				ps.setInt(2, indexList.get(i).getPlace_num());
				ps.setInt(3, indexList.get(i).getPlanner_date());
				ps.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
	}

	@Override
	public Planner getPlanner(Planner planner) {
		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "SELECT * ";
		sql += " FROM plannerInfo ";		
		sql += " where planner_num = ?";
		
		Planner view_planner= new Planner();
		
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, planner.getPLANNER_NUM());
			
			rs = ps.executeQuery();
			
			rs.next();
				
			view_planner.setPLANNER_NAME(rs.getString("planner_name"));
			view_planner.setTrip_nation(rs.getString("trip_nation"));
			view_planner.setTrip_date(rs.getString("trip_date"));
			view_planner.setTrip_season(rs.getString("trip_season"));
			view_planner.setTrip_theme(rs.getString("trip_theme"));
	
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
		         try {
			            if(ps!=null) ps.close();
			            if(rs!=null) rs.close();

			         } catch (SQLException e) {
			            e.printStackTrace();
			         }
			      }
		return view_planner;
	}

	@Override
	public List<Index> getIndex(int parseInt) {
		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "SELECT * ";
		sql += " FROM PLANNER_IDX  ";		
		sql += " where planner_num = ?";
		
		List<Index> indexList= new ArrayList<Index>();
		
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, parseInt);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Index index = new Index();
				index.setIndex_num(rs.getInt("index_num"));
				index.setPlace_num(rs.getInt("place_number"));
				index.setPlanner_date(rs.getInt("planner_date"));
				index.setPlanner_num(rs.getInt("planner_num"));
				indexList.add(index);
			}
				
	
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
		         try {
			            if(ps!=null) ps.close();
			            if(rs!=null) rs.close();

			         } catch (SQLException e) {
			            e.printStackTrace();
			         }
			      }
		return indexList;
	}


	@Override
	public int[] getSize(int[] parseInt) {
		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "SELECT COUNT(*) ";
		sql += " FROM PLANNER_IDX  ";		
		sql += " where planner_num = ? GROUP BY PLANNER_DATE";
		;
		int[] sizeList = new int[parseInt[1]];
		int days=0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, parseInt[0]);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int size = rs.getInt(1);
				System.out.println(days+"회 :"+size);
				sizeList[days]	=size;
				days++;
			}
				
	
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
		         try {
			            if(ps!=null) ps.close();
			            if(rs!=null) rs.close();

			         } catch (SQLException e) {
			            e.printStackTrace();
			         }
			      }
		return sizeList;
	}

	@Override
	public int getDayCnt(int parseInt) {
		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "SELECT count(COUNT(*)) ";
		sql += " FROM PLANNER_IDX  ";		
		sql += " where planner_num = ? GROUP BY PLANNER_DATE";
		int days=0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, parseInt);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				days = rs.getInt(1);
				
			}
				
	
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
		         try {
			            if(ps!=null) ps.close();
			            if(rs!=null) rs.close();

			         } catch (SQLException e) {
			            e.printStackTrace();
			         }
			      }
		return days;
	}

}
