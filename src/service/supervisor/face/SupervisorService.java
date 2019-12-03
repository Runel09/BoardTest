package service.supervisor.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.login.Member;
import dto.place.PlaceDto;
import dto.place.PlaceFile;
import dto.supervisor.Supervisor;
import util.Paging;

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
	
	
	/**
	 * 페이징 정보를 활용하여 보여질 게시글 목록만 조회
	 * @param paging-페이징 정보
	 * @return List - user 목록
	 */
	public List<Member>  getuserList(Paging paging);
	

	/**
	 * 회원 삭제
	 * @param req- 요청정보 객체(user_num 사용)
	 */
	public void DeleteUser(HttpServletRequest req);
	
	/**
	 * 요청파라미터 curPage를 파싱한다
	 * Board TB와 curPage값을 이용한  Paging 객체를 생성하고 반환
	 * @param req- 요청정보 객체
	 * @return Paging -페이징 정보
	 */
	
	public Paging memberListgetPaging(HttpServletRequest req);

	/**
	 * 장소정보 수정
	 * @param req-요청정보 객체(place_number사용)
	 */
	public void UpdatePlace(HttpServletRequest req);
	
	/**
	 * 장소정보 삭제
	 * @param place-삭제할장소정보객체
	 */
	public void placeDelete(HttpServletRequest req);
}
