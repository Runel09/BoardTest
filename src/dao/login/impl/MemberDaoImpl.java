package dao.login.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.login.face.MemberDao;
import dbutill.DBConn;
import dto.login.Member;

public class MemberDaoImpl implements MemberDao{

	private Connection conn = null; // DB연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL 수행 결과 객체
	
	@Override
	public int selectCntMemberByUserid(Member member) {
		
		conn = DBConn.getConnection(); //DB 연결
		
		String sql ="";
		sql+= "select count(*) as cnt";
		sql+= " from userinfo";
		sql+= " where USER_ID=? and USER_PW=?";
		
		int cnt = 0;
		System.out.println(member);
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getUser_id() );
			ps.setString(2, member.getUser_pw() );
			
			rs = ps.executeQuery();

			while(rs.next()) {
			
				cnt = rs.getInt("cnt");
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println(cnt);
		return cnt;
	}

	@Override
	public Member selectMemberByUserid(Member member) {
		
		conn = DBConn.getConnection(); //DB 연결
		
		String sql ="";
		sql	+= "select * from userinfo";
		sql += "	WHERE USER_ID=?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, member.getUser_id());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
			
			member.setUser_number(rs.getInt("user_number"));
			member.setUser_nick(rs.getString("USER_nick"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
		return member;
	}

	@Override
	public void insert(Member member) {
		
	
		
		conn = DBConn.getConnection(); //DB 연결
		
		String sql ="";
		sql	+= "insert into userinfo(USER_NUMBER , USER_ID, USER_PW, USER_NAME"
				+ ", USER_NICK, USER_GENDER, USER_EMAIL, USER_ADDR, USER_ADDR_DETAIL, USER_MAILNUM"
				+ ", USER_BIRTH ,USER_phnum) ";
		
		sql += " values( USER_seq.nextval,?,?,?,?,0,?,?,?,?,?,?)";
//			System.out.println(sql);
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, member.getUser_email());
			ps.setString(2, member.getUser_id());
			ps.setString(3, member.getUser_pw());
			ps.setString(4, member.getUser_name());
			ps.setString(5, member.getUser_nick());
			ps.setString(6, member.getUser_addr());
			ps.setString(7, member.getUser_addr_detail());
			ps.setString(8, member.getUser_mailnum());
			ps.setString(9, member.getUser_birth());
			ps.setString(10, member.getUser_phnum());
			
			
			ps.executeQuery();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
		
	}

    public boolean duplicateIdCheck(String id){
    	
    	conn = DBConn.getConnection();
       
    	// 쿼리
       	conn = DBConn.getConnection();
        
    	// 쿼리
    	String query = null;
    	query = "SELECT USER_ID FROM Userinfo WHERE USER_ID=?";
        boolean x= false;
        
        try {
                        
        	ps = conn.prepareStatement(query);
        	ps.setString(1, id);
         
            rs = ps.executeQuery();
            
            if(rs.next()) x= true; //해당 아이디 존재
            
            
        } catch (Exception e) {
         e.printStackTrace();
        } finally {
            try{
            	if ( rs != null ){ rs.close(); rs=null; }
                if ( ps != null ){ ps.close(); ps=null; }
            }catch(Exception e){
            	e.printStackTrace();
            }
        }
        return x;
    } // end duplicateIdCheck()

	
	


	

}
