package service.login.face;

import javax.servlet.http.HttpServletRequest;

import dto.login.Member;

public interface MemberService {

	public Member getLoginMember(HttpServletRequest req);
	/**
	 *로그인
	 */ 
	public boolean login(Member member);
	
	public Member getMemberByUserid(Member member);

	/**
	 *회원가입
	 */ 
	public void join(Member member);
	
	
	public boolean idcheck(String id);
	
	
	public Member finduserid();
	
	/*
	 * 이메일과 이름을 입력받아와 아이디찾기
	 */
	public Member getfindUserParam(HttpServletRequest req);
	
	public Member getUserId(Member member);
	/*
	 * 아이디와 휴대폰 번호를 입력받아와 비밀번호 찾기
	 */
	public Member getfinduserparam2(HttpServletRequest req);
	
	public Member getUserPw(Member member2);
	
	
	public void sendEmailPw(Member memberResult2);
	
	public String getRamdomPassword(int len);
	
	public void ChangePw(Member memberResult2);
	
	
}