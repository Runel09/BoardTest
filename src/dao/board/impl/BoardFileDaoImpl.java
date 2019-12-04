package dao.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.board.face.BoardFileDao;
import dbutil.DBConn;
import dto.board.Board;
import dto.board.BoardFile;

public class BoardFileDaoImpl implements BoardFileDao{
	
	private Connection conn = null; //DB연결 객체
	private PreparedStatement ps = null; //SQL 수행 객체
	private ResultSet rs = null; //SQL수행 결과 객체

	@Override
	public void insert(BoardFile boardFile) {
		// TODO Auto-generated method stub
		
		conn = DBConn.getConnection();
		
		String sql = "";
		sql += "INSERT INTO boardfile(fileno, boardno, originname, storedname, filesize, writedate)";
		sql += " VALUES(boardfile_seq.nextVal,?,?,?,?,sysdate)";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, boardFile.getBoardno());
			ps.setString(2,	boardFile.getOriginname());
			ps.setString(3,	boardFile.getStoredname());
			ps.setInt(4, boardFile.getFilesize());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public BoardFile getfile(Board board) {
		
		conn = DBConn.getConnection(); // DB연결

		BoardFile boardfile = null;
		
		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT * FROM boardfile";
		sql += " WHERE boardno=?";
		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기
			ps.setInt(1, board.getBoardno());
			rs = ps.executeQuery();// sql 수행결과 얻기
			

			// SQL 수행결과 처리
			while (rs.next()) {

				boardfile = new BoardFile();
				boardfile.setFileno(rs.getInt("fileno"));
				boardfile.setOriginname(rs.getString("originname"));
				boardfile.setStoredname(rs.getString("storedname"));
				boardfile.setWritedate(rs.getDate("writedate"));
				boardfile.setFilesize(rs.getInt("filesize"));
				board.setBoardno(rs.getInt("boardno"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if( rs!=null)rs.close();
				if( ps!=null)ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return boardfile;

		
	}

	@Override
	public void delete(BoardFile file) {
		conn= DBConn.getConnection();
		
		String sql="";
		sql+="DELETE FROM boardfile";
		sql+=" WHERE FILENO=?";
		
		try {
			ps = conn.prepareStatement(sql);// 수행객체 얻기
			ps.setInt(1, file.getFileno());
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
