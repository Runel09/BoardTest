package dao.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.board.face.CommentDao;
import dbutil.DBConn;
import dto.board.Board;
import dto.board.Comment;

public class CommentDaoImpl implements CommentDao{

	private Connection conn = null; //DB연결 객체
	private PreparedStatement ps = null; //SQL 수행 객체
	private ResultSet rs = null; //SQL수행 결과 객체
	
	@Override
	public List<Comment> selectCommentByBoardNo(Board board) {
		
		
		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "SELECT commentno, boardno, userid, content, writtendate";
		sql += " FROM commenttb WHERE boardno = ? ORDER BY commentno DESC";
		
		List<Comment> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, board.getBoardno());
			
			rs = ps.executeQuery();
			
//			System.out.println(rs.next());
			
			while(rs.next()) {
				Comment comment = new Comment();
				
				comment.setCommentno(rs.getInt("commentno"));
				comment.setBoardno(rs.getInt("boardno"));
				comment.setUserid(rs.getString("userid"));
				comment.setContent(rs.getString("content"));
				comment.setWrittendate(rs.getDate("writtendate"));
				
				list.add(comment);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public void insertComment(Comment comment) {
		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "INSERT INTO commenttb(commentno, boardno, userid, content, writtendate)";
		sql += " VALUES(commentTB_seq.nextVal, ?, ?, ?, sysdate)";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, comment.getBoardno());
			ps.setString(2,	comment.getUserid());
			ps.setString(3,	comment.getContent());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteComment(Comment comment) {
		conn = DBConn.getConnection();

		String sql = "";
		sql += "DELETE FROM commenttb";
		sql += " WHERE commentno=?";

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, comment.getCommentno());

			ps.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}

}
