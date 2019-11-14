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
import util.Paging;

public class BoardDaoImpl implements BoardDao {
	private Connection conn = null;// DB연결 객체
	private PreparedStatement ps = null;// SQL 수행 객체
	private ResultSet rs = null;// SQL 수행 결과 객체

	@Override
	public List<Board> boardList() {
		List<Board> list = new ArrayList<Board>();

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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateHit(Board board) {
		// TODO Auto-generated method stub

	}

	@Override
	public Board selectBoardByBoardno(Board inboard) {

		conn = DBConn.getConnection();// DB 연결
		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT boardno,title,id,content,hit,writtendate";
		sql += " FROM board WHERE boardno=?";
		Board board = new Board();
		board.setBoardno(inboard.getBoardno());
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board.getBoardno());
			rs = ps.executeQuery();
			while (rs.next()) {

				board.setBoardno(rs.getInt("boardno"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setWrittendate(rs.getDate("writtendate"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}

	@Override
	public List<Board> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> selectList(Board board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertImage(Board board) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertReco(Board board) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertCmt(Board board) {
		// TODO Auto-generated method stub

	}

	@Override
	public void selectPlanner() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Board> loadCmt(Board board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReco(Board board) {
		// TODO Auto-generated method stub

	}

	@Override
	public int selectCntAll() {
		conn = DBConn.getConnection();// DB 연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT COUNT(*)";
		sql += " FROM board";

		int cnt = 0;

		try {
			ps = conn.prepareStatement(sql);
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
	public List<Board> boardList(Paging paging) {
		List<Board> list = new ArrayList<Board>();

		conn = DBConn.getConnection();// DB 연결
		// 수행할 SQL 쿼리
		String sql = "";
		sql+="SELECT * FROM(";
		sql+=" SELECT rownum rnum,B.* FROM(";
		sql+="		SELECT";
		sql+=" boardno, title, id,";
		sql+=" content, hit ,writtendate" ;
		sql+=" FROM board ORDER BY boardno DESC";    
		sql+="	    )B ORDER BY rnum ";
		sql+="	)BOARD WHERE rnum Between ? and ?";
		

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
			rs = ps.executeQuery();
//			for(int i =1;i< paging.getStartNo();i++) {
//				rs.next();
//			}
//			for(int i = paging.getStartNo(); i<paging.getEndNo()+1;i++) {
				while(rs.next()) {
					Board board = new Board();
					
					board.setBoardno(rs.getInt("boardno"));
					board.setTitle(rs.getString("title"));
					board.setId(rs.getString("id"));
					board.setContent(rs.getString("content"));
					board.setHit(rs.getInt("hit"));
					board.setWrittendate(rs.getDate("writtendate"));
					list.add(board);
					
				}
//			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	
	}



	// -----------------------------------------------

}
