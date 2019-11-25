package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConn;
import util.Paging;
import web.dao.face.BoardDao;
import web.dto.Board;


public class BoardDaoImpl implements BoardDao {

	private Connection conn = null; //DB연결 객체
	private PreparedStatement ps = null; //SQL 수행 객체
	private ResultSet rs = null; //SQL수행 결과 객체

	@Override
	public void insertText() {
		
	}

	@Override
	public void insertImage() {
		
	}

	@Override
	public void selectBoard() {
		
	}

	@Override
	public void insertReco() {
		
	}

	@Override
	public void insertCmt() {
		
	}


	@Override
	public List<Board> selectAll(Paging paging) {

		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "SELECT * FROM (";
		sql	+=	"    SELECT rownum rnum, B.* FROM (";
		sql	+=	"        SELECT *";
		sql	+=	"        FROM board";
		
		if(paging.getSearch()!=null&&!"".equals(paging.getSearch())) {
			sql += " WHERE title LIKE ?";
		}
		
		sql	+=	"        ORDER BY boardno DESC";
		sql	+=	"    ) B";
		sql	+=	"    ORDER BY rnum";
		sql	+=	" ) BOARD";
		sql	+=	" WHERE rnum BETWEEN ? AND ?";

		List<Board> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			if(paging.getSearch()!=null&&!"".equals(paging.getSearch())) {
				
				ps.setString(1, "%"+paging.getSearch()+"%");
				ps.setInt(2, paging.getStartNo());
				ps.setInt(3, paging.getEndNo());
				
			} else {
				
				ps.setInt(1, paging.getStartNo());
				ps.setInt(2, paging.getEndNo());
			}
			
			
			rs = ps.executeQuery();
			
//			System.out.println(rs.next());
			
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
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public void selectList() {
		
	}

	@Override
	public void selectPlanner() {
		
	}


}
