package service.supervisor.face;

import javax.servlet.http.HttpServletRequest;

import dto.supervisor.Supervisor;

public interface SupervisorService {
	/**
	 * 로그인 정보 파싱
	 * 
	 * @param req - 요청 정보 객체
	 * @return Member - 로그인 정보
	 */
	public Supervisor getLoginMember(HttpServletRequest req);
	
	/**
	 * 로그인 처리
	 * 
	 * @param member - 로그인 정보
	 * @return boolean - true(인증), false(비인증)
	 */
	public boolean login(Supervisor supervisor);
	
	/**
	 * 유저정보가져오기
	 * 
	 * @param member - 회원 아이디를 가진 객체
	 * @return Member - 조회된 회원
	 */
	public Supervisor getMemberByUserid(Supervisor supervisor);


}
