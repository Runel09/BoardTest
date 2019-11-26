package place.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConn;
import place.dao.face.CommentDao;
import place.dto.Comment;
import place.dto.PlaceDto;




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
					+ "		userno,"
					+ "		place_number,"
					+ "		commentno,"
					+ "		content,"					
					+ "		writtendate"
					+ "	FROM PLACECOMMENTB"
					+ "	WHERE place_number = ?"
					+ "	ORDER BY writtendate"
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

					comment.setUserno(rs.getInt("userno"));
					comment.setPlace_number(rs.getInt("place_number"));
					comment.setCommentNo(rs.getInt("commentno"));
					comment.setContent(rs.getString("content"));
					comment.setWrittenDate(rs.getDate("writtendate"));

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
			= "INSERT INTO PLACECOMMENTB ("
					+ "		commentno,"
					+ "		place_number,"
					+ "		userno,"
					+ "		content )"
					+ "	VALUES ("
					+ "		PLACECOMMENTB_seq.nextval,"
					+ "		?,"
					+ "		?,"
					+ "		? )";

			try {
				ps = conn.prepareStatement(sql);

				ps.setInt(1, comment.getPlace_number());
				ps.setInt(2, comment.getUserno());
				ps.setString(3, comment.getContent());
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
			= "DELETE PLACECOMMENTB"
					+ "	WHERE commentno = ?";

			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, comment.getCommentNo());
				
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

			String sql = "SELECT COUNT(*) FROM PLACECOMMENTB WHERE commentno=?";
			
			int cnt = 0;
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, comment.getCommentNo());
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
