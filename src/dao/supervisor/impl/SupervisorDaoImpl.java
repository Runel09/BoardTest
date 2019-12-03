package dao.supervisor.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.supervisor.face.SupervisorDao;
import dbutil.DBConn;
import dto.login.Member;
import dto.supervisor.Supervisor;
import util.Paging;

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
				supervisor.setSuper_id( rs.getString("super_id") );
				supervisor.setSuper_pw( rs.getString("super_pw") );
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

	@Override
	public List<Member> getUserList(Paging paging) {
		conn = DBConn.getConnection(); // DB연결
		
		// 수행할 SQL 쿼리
		String sql = "";
		sql += "select * from(";
		sql += " Select rownum rnum, B.* FROM(";
		sql += " select * from userinfo";
		
		if(paging.getSearch()!=null&&!"".equals(paging.getSearch())) {
			sql+=" WHERE db_id LIKE ? or db_PHnum LIKE ? or db_name LIKE ?";
		}
		
		sql += " order by user_num desc)B";
		sql += " ORDER BY rnum) BOARD";
		sql += " WHERE rnum BETWEEN ? AND ?";

		List<Member> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기
			
			if(paging.getSearch()!=null&&!"".equals(paging.getSearch())) {
				ps.setString(1, "%" + paging.getSearch() + "%");
				ps.setString(2, "%" + paging.getSearch() + "%");
				ps.setString(3, "%" + paging.getSearch() + "%");
				ps.setInt(4, paging.getStartNo());
				ps.setInt(5, paging.getEndNo());
			} else {
				ps.setInt(1, paging.getStartNo());
				ps.setInt(2, paging.getEndNo());
			}
			
			rs = ps.executeQuery();// sql 수행결과 얻기

			// SQL 수행결과 처리
			while (rs.next()) {
//				System.out.println("HERE");
				Member member = new Member();// 각 행을 처리할 DTO

				member.setUser_number(rs.getInt("user_num"));
//				member.setDB_Email(rs.getString("db_email"));
				member.setUser_id(rs.getString("db_id"));
				member.setUser_pw(rs.getString("db_pw"));
				member.setUser_name(rs.getString("db_name"));
//				member.setDB_Nick(rs.getString("db_nick"));
//				member.setDB_Gender(rs.getInt("db_gender"));
//				member.setDB_Addr(rs.getString("db_addr"));
//				member.setDB_Addr_detail(rs.getString("db_addr_detail"));
//				member.setDB_Mailnum(rs.getString("db_mailnum"));
//				member.setDB_Birth(rs.getString("db_birth"));
				member.setUser_phnum(rs.getString("db_phnum"));
				
				list.add(member);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void memberdelete(Member member) {

		conn= DBConn.getConnection();

		String sql="";
		sql+="DELETE FROM userinfo";
		sql+=" WHERE user_num=?";

		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기
			ps.setInt(1, member.getUser_number());
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
	public int memberselectCntAll(HttpServletRequest req) {
		conn = DBConn.getConnection(); // DB연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT count(*) FROM userinfo";
		if(req.getParameter("search")!=null && !"".equals(req.getParameter("search"))) {
		sql +=" WHERE DB_id LIKE ? or db_PHnum LIKE ? or db_name LIKE ?";
		}
		

		// 최종 결과 변수
		int cnt = 0;

		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기
			if(req.getParameter("search")!=null && !"".equals(req.getParameter("search"))) {
				ps.setString(1, "%" + req.getParameter("search") + "%");
				ps.setString(2, "%" + req.getParameter("search")+ "%");
				ps.setString(3, "%" + req.getParameter("search")+ "%");
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




}
