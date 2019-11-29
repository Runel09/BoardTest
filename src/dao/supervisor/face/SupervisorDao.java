package dao.supervisor.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.login.Member;
import dto.supervisor.Supervisor;
import util.Paging;

public interface SupervisorDao {

	/**
	 * id,pw에 맞는 관리자가 있는지 확인
	 * @param supervisor-로그인한 관리자
	 * @return-id,pw와 일치하는 관리자 수
	 */
	int selectCntMemberByUseridAndUserpw(Supervisor supervisor);

	/**
	 * id로 관리자 선택
	 * @param supervisor-로그인한 관리자
	 * @return-id에 맞는 관리자
	 */
	Supervisor selectMemberByUserid(Supervisor supervisor);

	/**
	 * 회원정보리스트 불러오기
	 * @param paging-페이징 객체
	 * @return-회원리스트
	 */
	List<Member> getUserList(Paging paging);

	/**
	 * 회원삭제
	 * @param member-삭제할 회원
	 */
	void memberdelete(Member member);
	
	/**
	 * 검색한결과 전체 갯수
	 * @param search-검색어
	 * @return-검색결과 갯수
	 */
	public int selectCntAll(HttpServletRequest req);


}
