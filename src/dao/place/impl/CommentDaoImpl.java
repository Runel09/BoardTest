package dao.place.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.place.face.CommentDao;
import dbutill.DBConn;
import dto.place.Comment;
import dto.place.PlaceDto;




public class CommentDaoImpl implements CommentDao {
	// DB 연결 객체
		private Connection conn = null;

		// JDBC 객체
		private PreparedStatement ps;
		private ResultSet rs;

		@Override
		public List selectComment(PlaceDto place) {

			conn = DBConn.getConnection();

			String sql
			= "SELECT * FROM ("
					+ "SELECT rownum rnum, B.* FROM ("
					+ "	SELECT"
					+ "		review_number,"
					+ "		user_number,"
					+ "		place_number,"
					+ "		review_score,"					
					+ "		review_char"
					+ "	FROM review"
					+ "	WHERE place_number = ?"					
					+ "	) B"
					+ ") ORDER BY rnum";

			List commentList = new ArrayList();
			try {
				ps = conn.prepareStatement(sql);

				ps.setInt(1, place.getPlace_number() );

				// ResultSet 반환
				rs = ps.executeQuery();

				while( rs.next() ) {
					Comment comment = new Comment();

					comment.setReview_number(rs.getInt("review_number"));
					comment.setUser_number(rs.getInt("user_number"));
					comment.setPlace_number(rs.getInt("place_number"));
					comment.setReview_score(rs.getInt("review_score"));
					comment.setReview_char(rs.getString("review_char"));
					

					commentList.add(comment);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs!=null)	rs.close();
					if(ps!=null)	ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}

			return commentList;
		}

		@Override
		public void insertComment(Comment comment) {

			conn = DBConn.getConnection();

			String sql
			= "INSERT INTO review ("
					+ "		review_number,"
					+ "		user_number,"
					+ "		place_number,"
					+ "		review_char )"
					+ "	VALUES ("
					+ "		review_seq.nextval,"
					+ "		?,"
					+ "		?,"
					+ "		? )";

			try {
				ps = conn.prepareStatement(sql);

				ps.setInt(1, comment.getUser_number());
				ps.setInt(2, comment.getPlace_number());
				ps.setString(3, comment.getReview_char());
				ps.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(ps!=null)	ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}


		}

		@Override
		public void deleteComment(Comment comment) {

			conn = DBConn.getConnection();

			String sql
			= "DELETE review"
					+ "	WHERE review_number = ?";

			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, comment.getReview_number());
				
				ps.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(ps!=null)	ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		@Override
		public int countComment(Comment comment) {

			conn = DBConn.getConnection();

			String sql = "SELECT COUNT(*) FROM review WHERE review_number=?";
			
			int cnt = 0;
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, comment.getReview_number());
				rs = ps.executeQuery();
				rs.next();
				cnt = rs.getInt(1);
				
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
