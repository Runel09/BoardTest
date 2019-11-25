package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.Member;

public interface MemberService {

	/**
	 * 페이징 정보를 활용하여 보여질 게시글 목록만 조회
	 * @param paging-페이징 정보
	 * @return List - user 목록
	 */
	public List<Member>  getuserList(Paging paging);
	
	
	/**
	 * 요청파라미터 curPage를 파싱한다
	 * Board TB와 curPage값을 이용한  Paging 객체를 생성하고 반환
	 * @param req- 요청정보 객체
	 * @return Paging -페이징 정보
	 */
	
	public Paging getPaging(HttpServletRequest req);
	
	/**
	 * 회원 삭제
	 * @param req- 요청정보 객체(user_num 사용)
	 */
	public void DeleteUser(HttpServletRequest req);
}
