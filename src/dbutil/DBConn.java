package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	
	//DB 연결 정보
	private static final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private static final String URL="jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USERNAME="scott";
	private static final String PASSWORD="tiger";
	
	//DB연결 객체
	private static Connection conn = null;
	
	//private 생성자
	private DBConn() {
		
	}
	
	//Connection 객체 반환 -Singleton Pattern
	public static Connection getConnection() {
		
		if (conn==null) {
				try {
					Class.forName(DRIVER);//드라이버 로드
					conn=DriverManager.getConnection(URL, USERNAME, PASSWORD);
				}catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			
		}
		
		return conn;//DB연결 객체 반환
	}
	
}

