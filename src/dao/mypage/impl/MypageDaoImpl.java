package dao.mypage.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.mypage.face.MypageDao;
import dbutil.DBConn;
import dto.board.Board;
import dto.board.Comment;
import dto.login.Member;
import util.Paging;

public class MypageDaoImpl implements MypageDao {

	//DB관련 객체
		private Connection conn = null; 

		private PreparedStatement ps = null;
		private ResultSet rs = null;
		
	@Override
	public Member selectUserInfo(Member member) {
		conn = DBConn.getConnection();

		if( member.getUser_id() == null ) {
			return null;
		}

		//쿼리 작성
		String sql = "";
		sql += "SELECT * FROM userinfo";
		sql += " WHERE 1=1";
		sql += " AND user_id = ?";
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getUser_id());
		
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				member.setUser_id( rs.getString("user_id") );
				member.setUser_email( rs.getString("user_email"));
				member.setUser_nick( rs.getString("user_nick"));
				member.setUser_phnum( rs.getString("user_phnum"));
				member.setUser_name( rs.getString("user_name"));
				member.setUser_addr( rs.getString("user_addr"));
				member.setUser_addr_detail(rs.getString("user_addr_detail"));
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
		
		return member;
	}

	@Override
	public List<Board> selectBaordByUserId(Paging paging, HttpServletRequest req) {
		conn = DBConn.getConnection(); // DB연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "select * from(";
		sql += " Select rownum rnum, B.* FROM(";
		sql += " select * from board";


		sql += " order by boardno desc)B";
		sql += " ORDER BY rnum) BOARD";
		sql += " WHERE rnum BETWEEN ? AND ? and id=?";

		List<Board> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기

	
				ps.setInt(1, paging.getStartNo());
				ps.setInt(2, paging.getEndNo());
				ps.setString(3,(String)req.getSession().getAttribute("userid") );
	

			rs = ps.executeQuery();// sql 수행결과 얻기

			// SQL 수행결과 처리
			while (rs.next()) {
//				System.out.println("HERE");
				Board board= new Board();
				
				board.setBoardno(rs.getInt("boardno"));
				board.setTitle(rs.getString("TITLE"));
				board.setId(rs.getString("ID"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setWrittendate(rs.getDate("writtendate"));
				board.setCheckboard(rs.getString("checkboard"));
				
				list.add(board);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}

	@Override
	public int mypageboardselectCntAll(HttpServletRequest req) {
		conn = DBConn.getConnection(); // DB연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT count(*) FROM board";
		sql += " WHERE id=?";

		// 최종 결과 변수
		int cnt = 0;

		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기
			ps.setString(1, (String)req.getSession().getAttribute("userid"));
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
