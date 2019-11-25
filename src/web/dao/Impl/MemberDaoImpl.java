package web.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConn;
import util.Paging;
import web.dao.face.MemberDao;
import web.dto.Member;

//관리자에서 멤버목록 불러오기
public class MemberDaoImpl implements MemberDao {

	// DB연결 객체
	private Connection conn = null;// DB연결 객체
	private PreparedStatement ps = null;// SQL 수행 객체
	private ResultSet rs = null;// SQL수행 결과 객체
	
	@Override
	public List<Member> getUserList(Paging paging) {
		conn = DBConn.getConnection(); // DB연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "select * from(";
		sql += " Select rownum rnum, B.* FROM(";
		sql += " select * from userinfo";
		if(paging.getSearch()!=null) {
			sql+=" WHERE db_id LIKE ? ";
		}
		sql += " order by user_num desc)B";
		sql += " ORDER BY rnum)BOARD";
		sql += " WHERE rnum BETWEEN ? AND ?";

		List<Member> list = new ArrayList<Member>();
		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기
			
			if(paging.getSearch()!=null) {
				ps.setString(1, "%" + paging.getSearch() + "%");
				ps.setInt(2, paging.getStartNo());
				ps.setInt(3, paging.getEndNo());
			} else {
				ps.setInt(1, paging.getStartNo());
				ps.setInt(2, paging.getEndNo());
			}
			
			
			rs = ps.executeQuery();// sql 수행결과 얻기

			// SQL 수행결과 처리
			while (rs.next()) {
				Member member = new Member();// 각 행을 처리할 DTO

				member.setUser_Num(rs.getInt("user_num"));
				member.setDB_Email(rs.getString("db_email"));
				member.setDB_Id(rs.getString("db_id"));
				member.setDB_Pw(rs.getString("db_pw"));
				member.setDB_Name(rs.getString("db_name"));
				member.setDB_Nick(rs.getString("db_nick"));
				member.setDB_Gender(rs.getInt("db_gender"));
				member.setDB_Addr(rs.getString("db_addr"));
				member.setDB_Addr_detail(rs.getString("db_addr_detail"));
				member.setDB_Mailnum(rs.getString("db_mailnum"));
				member.setDB_Birth(rs.getString("db_birth"));
				member.setDB_Phnum(rs.getString("db_phnum"));
				
				list.add(member);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int selectCntAll(String search) {
		conn = DBConn.getConnection(); // DB연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT count(*) FROM userinfo";
		if(search!=null && !"".equals(search)) {
		sql +=" WHERE DB_id LIKE ?";
		}
		

		// 최종 결과 변수
		int cnt = 0;

		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기
			if(search!=null && !"".equals(search)) {
				ps.setString(1, "%" + search + "%");
			}
			rs = ps.executeQuery();// sql 수행결과 얻기

			// SQL 수행결과 처리
			while (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		// 최종결과 반환
		return cnt;
	}

	@Override
	public void memberdelete(Member member) {

		conn= DBConn.getConnection();

		String sql="";
		sql+="DELETE FROM userinfo";
		sql+=" WHERE user_num=?";

		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기
			ps.setInt(1, member.getUser_Num());
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


 
}
