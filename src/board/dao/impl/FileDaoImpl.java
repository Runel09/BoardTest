package board.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.dao.face.FileDao;
import board.dto.UploadFile;
import dbutil.DBConn;

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

}
