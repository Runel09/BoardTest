package file.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.dto.Board;
import board.dto.UploadFile;
import dbutil.DBConn;
import file.dao.face.FileDao;

public class FileDaoImpl implements FileDao {
	private Connection conn = null;// DB연결 객체
	private PreparedStatement ps = null;// SQL 수행 객체
	private ResultSet rs = null;// SQL 수행 결과 객체
	@Override
	public void insert(UploadFile uploadFile) {

		conn = DBConn.getConnection();// DB 연결
		// 수행할 SQL 쿼리
		String sql = "";
		sql += "INSERT INTO BOARDFILE(fileno,boardno,originName,storedName,FILESIZE)";
		sql += " VALUES (UpFileNo_sequence.nextval,?, ?, ?,?)";
		System.out.println(sql);
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, uploadFile.getBoardNo());
			ps.setString(2, uploadFile.getOriginName());
			ps.setString(3, uploadFile.getStoredName());
			ps.setInt(4, uploadFile.getFileSize());
			ps.executeUpdate();
			System.out.println("저장 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	@Override
	public UploadFile selectByBoardNo(int boardno) {
		conn = DBConn.getConnection();// DB 연결
		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT *";
		sql += " FROM BOARDFILE WHERE boardno=?";
		UploadFile file = new UploadFile();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardno);
			rs = ps.executeQuery();
			while (rs.next()) {
				file.setFileNo(rs.getInt("fileNo"));
				file.setOriginName(rs.getString("originName"));
				file.setStoredName(rs.getString("storedName"));
				file.setFileSize(rs.getInt("fileSize"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		file.toString();
		return file;
	}
	@Override
	public UploadFile selectByfileNo(int fileno) {
		conn = DBConn.getConnection();// DB 연결
		// 수행할 SQL 쿼리
		String sql = "";
		sql += "SELECT *";
		sql += " FROM BOARDFILE WHERE fileno=?";
		UploadFile file = new UploadFile();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fileno);
			rs = ps.executeQuery();
			while (rs.next()) {
				file.setFileNo(rs.getInt("fileNo"));
				file.setOriginName(rs.getString("originName"));
				file.setStoredName(rs.getString("storedName"));
				file.setFileSize(rs.getInt("fileSize"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		file.toString();
		return file;
	}

}
