package service.login.impl;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import dao.login.face.MemberDao;
import dao.login.impl.MemberDaoImpl;
import dto.login.Member;
import service.login.face.MemberService;
import util.Gmail;


public class MemberServiceImpl implements MemberService{

	private MemberDao memberDao = new MemberDaoImpl();
	
	@Override
	public Member getLoginMember(HttpServletRequest req) {
		
		Member member = new Member() ;
//      System.out.println(req.getParameter("userid"));
		member.setUser_id(req.getParameter("userid"));
		member.setUser_pw(req.getParameter("userpw"));
//		member.setDB_Nick(req.getParameter("usernick"));
		
		return member;
	}

	@Override
	public boolean login(Member member) {

		int cnt = memberDao.selectCntMemberByUserid(member);
		
		if(cnt == 1) {
			
			return true;
		} else {
			
			return false;
		}

	}

	@Override
	public Member getMemberByUserid(Member member) {
		
		member = memberDao.selectMemberByUserid(member);
		
		return member;
	}

	@Override
	public void join(Member member) {
		
		memberDao.insert(member);
		
	}

	@Override
	public boolean idcheck(String id) {
		
		return memberDao.duplicateIdCheck(id);
	}

	@Override
	public Member finduserid() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member getfindUserParam(HttpServletRequest req) {

		Member member = new Member() ;
		member.setUser_email(req.getParameter("inputEmail"));
		member.setUser_name(req.getParameter("inputName"));
		return member;
	}

	@Override
	public Member getUserId(Member member) {
		return memberDao.finduserid(member);
	}


	@Override
	public Member getfinduserparam2(HttpServletRequest req) {
		Member member2 = new Member() ;
		member2.setUser_id(req.getParameter("inputid"));
		member2.setUser_phnum(req.getParameter("inputphnum"));
		return member2;
	}
	
	@Override
	public Member getUserPw(Member member2) {
		return memberDao.finduserpw(member2);
		
	}
	
	@Override
	public String getRamdomPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 
				'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
		int idx = 0;
		StringBuffer sb = new StringBuffer(); 
		for (int i = 0; i < len; i++) 
		{ 
			idx = (int) (charSet.length * Math.random()); 
			// 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			sb.append(charSet[idx]); }
		return sb.toString();
	}
	
	@Override
	public void ChangePw(Member memberResult2) {

		memberDao.updatePw(memberResult2);
	}

	@Override
	public void sendEmailPw(Member memberResult2) {

		 // 사용자에게 보낼 메시지를 기입합니다.
	      String from = "bgan0064@gmail.com";
	      String host = "http://localhost:8082/";
	      
	      //임시 비밀번호 생성
	      String pwTmember = getRamdomPassword(8);
	      
	      //임시 비밀번호 객체에 담기
	      memberResult2.setUser_pw(pwTmember);
	      
	      //비밀번호 Update
	      ChangePw(memberResult2);
	      
//	      System.out.println("임시 비번  " + pwTmember);
	      
	      String subject = "TRAVELERS 비밀번호 찾기 입니다.";
	      String content = "고객님의 임시 비밀번호는 " + pwTmember +  " 입니다. 홈페이지 바로가기: " + 
          "<a href='" + host + "member/login" + "'><br>돌아가기</a>";

	      // SMTP에 접속하기 위한 정보를 기입합니다.
	      Properties p = new Properties();
	      p.put("mail.smtp.user", from);
	      p.put("mail.smtp.host", "smtp.googlemail.com");
	      p.put("mail.smtp.port", "465");
	      p.put("mail.smtp.starttls.enable", "true");
	      p.put("mail.smtp.auth", "true");
	      p.put("mail.smtp.debug", "true");
	      p.put("mail.smtp.socketFactory.port", "465");
	      p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	      p.put("mail.smtp.socketFactory.fallback", "false");

	      try{
	         Authenticator auth = new Gmail();
	         Session ses = Session.getInstance(p, auth);
	         ses.setDebug(true);
	         MimeMessage msg = new MimeMessage(ses); 
	         msg.setSubject(subject);
	         Address fromAddr = new InternetAddress(from);
	         msg.setFrom(fromAddr);
	         Address toAddr = new InternetAddress(memberResult2.getUser_email());
	         msg.addRecipient(Message.RecipientType.TO, toAddr);
	         msg.setContent(content, "text/html;charset=UTF-8");
	         Transport.send(msg);
	      } catch(Exception e){
	         e.printStackTrace();
	      }
	}

    
	   @Override
	   public Member getmemberParam(HttpServletRequest req) {
		   Member member = new Member(); // 요청 파라미터 저장 객체
	
			member.setUser_id(req.getParameter("userid"));
			member.setUser_nick(req.getParameter("usernick"));
			member.setUser_pw(req.getParameter("userpw"));
			member.setUser_name(req.getParameter("username"));
			member.setUser_email(req.getParameter("usermail"));
			member.setUser_addr(req.getParameter("useraddr"));
			int gender = Integer.parseInt(req.getParameter("gender"));
			member.setUser_gender(gender);
			member.setUser_addr_detail(req.getParameter("useraddrdetail"));
			member.setUser_mailnum(req.getParameter("usermailnum"));
			member.setUser_birth(req.getParameter("userbirth"));
			member.setUser_phnum(req.getParameter("userphnum"));

	      

//			System.out.println(member);
	         return member;
	   }


}