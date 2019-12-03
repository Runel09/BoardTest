package service.login.impl;

import javax.servlet.http.HttpServletRequest;

import dao.login.face.MemberDao;
import dao.login.impl.MemberDaoImpl;
import dto.login.Member;
import service.login.face.MemberService;


public class MemberServiceImpl implements MemberService{

	private MemberDao memberDao = new MemberDaoImpl();
	
	@Override
	public Member getLoginMember(HttpServletRequest req) {
		
		Member member = new Member() ;
		System.out.println(req.getParameter("userid"));
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


}