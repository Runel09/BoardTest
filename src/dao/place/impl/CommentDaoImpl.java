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
					+ "	ORDER BY review_number"
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
					+ "		review_score,"
					+ "		review_char )"
					+ "	VALUES ("
					+ "		review_seq.nextval,"
					+ "		?,"
					+ "		?,"
					+ "		?,"
					+ "		? )";

			try {
				ps = conn.prepareStatement(sql);

				ps.setInt(1, comment.getUser_number());
				ps.setInt(2, comment.getPlace_number());
				ps.setInt(3, comment.getReview_score());
				ps.setString(4, comment.getReview_char());
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
	
		
	@Override
	public PlaceDto inScore(Comment comment) {
		
		conn = DBConn.getConnection();
		int score=0;
		String sql="";
		PlaceDto placeDto = new PlaceDto();
		placeDto.setPlace_number(comment.getPlace_number());
		sql += "select review_score from review";
		sql += " where place_number=?";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, comment.getPlace_number());
			
			rs=ps.executeQuery();
			while(rs.next()) {
				
				placeDto.setReview_score(rs.getInt("review_score"));
				score= score+placeDto.getReview_score();
				placeDto.setReview_score(score);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return placeDto;
	}
		
	
	@Override
	public void updateScore(PlaceDto placeDto) {
		
		System.out.println("updateScore:"+placeDto.getReview_score());
		System.out.println("place_number"+placeDto.getPlace_number());
		conn = DBConn.getConnection();
		String sql="";
		
		sql +="update placeinfo set review_score=?";
		sql +=" where place_number=?";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, placeDto.getReview_score());
			ps.setInt(2, placeDto.getPlace_number());
			ps.execute();// sql 수행
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
	
	
	
	
}
