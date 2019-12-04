package dao.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.board.face.RecommendDao;
import dbutil.DBConn;
import dto.board.Board;
import dto.board.Recommend;

public class RecommendDaoImpl implements RecommendDao {
	
	//DB관련 객체
	private Connection conn = DBConn.getConnection(); 

	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public int selectCntRecommend(Recommend recommend) {
		String sql = "";
		sql += "SELECT count(*) FROM recommend";
		sql += " WHERE boardno = ?";
		sql += " 	AND userid = ?";
		
		//DB 객체
		PreparedStatement ps = null; 
		ResultSet rs = null;
		
		int cnt = -1;
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setInt(1, recommend.getBoardno());
			ps.setString(2, recommend.getUserid());

			rs = ps.executeQuery();
			
			while(rs.next()) {
			
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//DB객체 닫기
				if(ps!=null)	ps.close();
				if(rs!=null)	rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}
	
	@Override
	public void insertRecommend(Recommend recommendBoard) {
		
		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "INSERT INTO recommend(boardno, userid)";
		sql += " VALUES(?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, recommendBoard.getBoardno());
			ps.setString(2, recommendBoard.getUserid());
			
			ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	         try {
		            if(ps!=null) ps.close();
		            if(rs!=null) rs.close();

		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
		
	}

	@Override
	public void deleteRecommend(Recommend recommendBoard) {
		
		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "DELETE FROM recommend";
		sql += " WHERE boardno=? AND userid=?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, recommendBoard.getBoardno());
			ps.setString(2, recommendBoard.getUserid());
			
			ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	         try {
		            if(ps!=null) ps.close();
		            if(rs!=null) rs.close();

		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
	}
	
	@Override
	public int selectTotalCntRecommend(Recommend recommend) {
		String sql = "SELECT COUNT(*) FROM recommend"
				+ " WHERE boardno=?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, recommend.getBoardno());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}

}









