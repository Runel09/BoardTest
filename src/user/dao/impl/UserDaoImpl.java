package user.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.dto.Board;
import dbutil.DBConn;
import email.dto.Email;
import user.dao.face.UserDao;
import user.dto.User;

public class UserDaoImpl implements UserDao {
	private Connection conn = null;// DB연결 객체
	private PreparedStatement ps = null;// SQL 수행 객체
	private ResultSet rs = null;// SQL 수행 결과 객체

	@Override
	public boolean checkIdDB(User user) {
		boolean result =false;
		int cnt=0;
		conn = DBConn.getConnection();// DB 연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT COUNT(*) ";
		sql += " FROM USERINFO WHERE DB_ID = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUSERID());
			rs = ps.executeQuery();
			while (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(cnt ==0) result=true;
			

		return result;
	}

	@Override
	public User findAdress(User user) {
		User resultUser = null;

		return resultUser;
	}

	@Override
	public void insertUser(User user) {
		conn = DBConn.getConnection();// DB 연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "INSERT INTO USERINFO(USER_NUM," + 
				"DB_EMAIL," + 
				"DB_ID," + 
				"DB_PW," + 
				"DB_NAME," + 
				"DB_NICK," + 
				"DB_GENDER," + 
				"DB_ADDR," + 
				"DB_ADDR_DETAIL," + 
				"DB_MAILNUM," + 
				"DB_BIRTH," + 
				"DB_PHNUM)";
		sql += "  VALUES (user_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getUSERID());
			ps.setString(3, user.getUSERPW());
			ps.setString(4, user.getUSERName());
			ps.setString(5, user.getNick());
			ps.setInt(6, user.getGender());
			ps.setString(7, user.getAddr());
			ps.setString(8, user.getAddress_detail());
			ps.setString(9, user.getMailnum());
			ps.setString(10, user.getBirthday());
			ps.setString(11, user.getEmail());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

	

	@Override
	public User findUserId(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserPw(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Email searchEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFindInfo(Email email) {
		// TODO Auto-generated method stub

	}

	@Override
	public int selectCntUserByDBID(User user) {
		int cnt = 0;

		conn = DBConn.getConnection();// DB 연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT COUNT(*) ";
		sql += " FROM USERINFO WHERE DB_ID = ? AND DB_PW = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUSERID());
			ps.setString(2, user.getUSERPW());
			rs = ps.executeQuery();
			while (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return cnt;
	}

	@Override
	public User selectUserByDBID(User user) {
		conn = DBConn.getConnection();// DB 연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT DB_ID,DB_NICK ";
		sql += " FROM USERINFO WHERE DB_ID = ? AND DB_PW = ?";
		User infoUser = new User();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUSERID());
			ps.setString(2, user.getUSERPW());
			rs = ps.executeQuery();
			while (rs.next()) {
				infoUser.setUSERID(rs.getString("DB_ID"));
				infoUser.setNick(rs.getString("DB_NICK"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return infoUser;
	}

}
