package dao.supervisor.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.supervisor.face.SupervisorDao;
import dbutil.DBConn;
import dto.supervisor.Supervisor;

public class SupervisorDaoImpl implements SupervisorDao{

	//DB관련 객체
	private Connection conn = null; 

	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public int selectCntMemberByUseridAndUserpw(Supervisor supervisor) {
		conn = DBConn.getConnection();
		
		if( supervisor.getSuper_id()== null || supervisor.getSuper_pw() == null ) {
			return -1;
			
		} 

		//쿼리 작성
		String sql = "";
		sql += "SELECT COUNT(*) FROM supervisor";
		sql += " WHERE 1=1";
		sql += " AND super_id = ?";
		sql += " AND super_pw = ?";
		
		int cnt = -1;
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setString(1, supervisor.getSuper_id());
			ps.setString(2, supervisor.getSuper_pw());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				cnt = rs.getInt(1);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//DB객체 닫기
				if(rs!=null)	rs.close();
				if(ps!=null)	ps.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}

	@Override
	public Supervisor selectMemberByUserid(Supervisor supervisor) {
		conn = DBConn.getConnection();

		if( supervisor.getSuper_id() == null ) {
			return null;
		}

		//쿼리 작성
		String sql = "";
		sql += "SELECT * FROM supervisor";
		sql += " WHERE 1=1";
		sql += " AND super_id = ?";
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setString(1, supervisor.getSuper_id());
		
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				supervisor.setSuper_id( rs.getString("userid") );
				supervisor.setSuper_pw( rs.getString("userpw") );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//DB객체 닫기
				if(rs!=null)	rs.close();
				if(ps!=null)	ps.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return supervisor;
		
	}

}
