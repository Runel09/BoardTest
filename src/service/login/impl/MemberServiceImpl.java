package web.service.impl;

import javax.servlet.http.HttpServletRequest;

import web.dao.face.MemberDao;
import web.dao.impl.MemberDaoImpl;
import web.dto.Member;
import web.service.face.MemberService;

public class MemberServiceImpl implements MemberService{

	private MemberDao memberDao = new MemberDaoImpl();
	
	@Override
	public Member getLoginMember(HttpServletRequest req) {
		
		Member member = new Member() ;
		
		member.setDB_Id(req.getParameter("userid"));
		member.setDB_Pw(req.getParameter("userpw"));
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

}