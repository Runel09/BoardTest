package board.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.dao.face.BoardDao;
import board.dto.Board;
import dbutil.DBConn;


public class BoardDaoImpl implements BoardDao {
	private Connection conn = null;// DB연결 객체
	private PreparedStatement ps = null;// SQL 수행 객체
	private ResultSet rs = null;// SQL 수행 결과 객체

	@Override
	public List<Board> boardList() {
		List<Board> list =new ArrayList<Board>();

		conn = DBConn.getConnection();// DB 연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT boardno,title,id,content,hit,writtendate";
		sql += " FROM board ORDER BY boardno desc";

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Board board = new Board();

				board.setBoardno(rs.getInt("boardno"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setWrittendate(rs.getDate("writtendate"));
				list.add(board);
				board.toString();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		System.out.println(list);
		return list;
	}

}
