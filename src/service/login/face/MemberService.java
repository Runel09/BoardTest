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
	
	public Member getfindUserParam(HttpServletRequest req);
	public Member getUserId(Member member);
	

	
	
}