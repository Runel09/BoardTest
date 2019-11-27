package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbutill.DBConn;
import web.dao.face.MemberDao;
import web.dto.Member;

public class MemberDaoImpl implements MemberDao{

	private Connection conn = null; // DB연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL 수행 결과 객체
	
	@Override
	public int selectCntMemberByUserid(Member member) {
		
		conn = DBConn.getConnection(); //DB 연결
		
		String sql ="";
		sql+= "select count(*) as cnt";
		sql+= " from userinfo";
		sql+= " where DB_ID=? and DB_PW=?";
		
		int cnt = 0;
		System.out.println(member);
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getDB_Id() );
			ps.setString(2, member.getDB_Pw() );
			
			rs = ps.executeQuery();

			while(rs.next()) {
			
				cnt = rs.getInt("cnt");
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println(cnt);
		return cnt;
	}

	@Override
	public Member selectMemberByUserid(Member member) {
		
		conn = DBConn.getConnection(); //DB 연결
		
		String sql ="";
		sql	+= "select * from userinfo";
		sql += "	WHERE DB_ID=?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, member.getDB_Id());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
			
			member.setDB_Nick(rs.getString("DB_nick"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
		return member;
	}

	@Override
	public void insert(Member member) {
		
	
		
		conn = DBConn.getConnection(); //DB 연결
		
		String sql ="";
		sql	+= "insert into userinfo(user_num ,DB_EMAIL, DB_ID, DB_PW, DB_NAME"
				+ ", DB_NICK, DB_GENDER, DB_ADDR, DB_ADDR_DETAIL, DB_MAILNUM"
				+ ", DB_BIRTH ,DB_phnum) ";
		
		sql += " values( USER_seq.nextval,?,?,?,?,?,0,?,?,?,?,?)";
//			System.out.println(sql);
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, member.getDB_Email());
			ps.setString(2, member.getDB_Id());
			ps.setString(3, member.getDB_Pw());
			ps.setString(4, member.getDB_Name());
			ps.setString(5, member.getDB_Nick());
			ps.setString(6, member.getDB_Addr());
			ps.setString(7, member.getDB_Addr_detail());
			ps.setString(8, member.getDB_Mailnum());
			ps.setString(9, member.getDB_Birth());
			ps.setString(10, member.getDB_Phnum());
			
			
			ps.executeQuery();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
		
	}



	

}
