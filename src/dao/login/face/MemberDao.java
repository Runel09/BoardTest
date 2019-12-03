package dao.login.face;

import dto.login.Member;

public interface MemberDao {

	public int selectCntMemberByUserid(Member member);
	
	public Member selectMemberByUserid(Member member);

	/**
	 * DB에 들어가는 user정보
	 * @param member
	 */
	public void insert(Member member);

	/*
	 * 아이디 중복여부
	 */
	public boolean duplicateIdCheck(String id);

	
/*
 * 아이디찾기
 */
	public Member finduserid(Member member) ;

/*
 * 비밀번호찾기
 */
	public Member finduserpw(Member member2);

	
}
