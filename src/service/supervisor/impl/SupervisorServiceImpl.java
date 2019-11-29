package service.supervisor.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.supervisor.face.SupervisorDao;
import dao.supervisor.impl.SupervisorDaoImpl;
import dto.login.Member;
import dto.supervisor.Supervisor;
import service.supervisor.face.SupervisorService;
import util.Paging;

public class SupervisorServiceImpl implements SupervisorService{
	
	//SupervisorDao 객체
	private SupervisorDao supervisordao = new SupervisorDaoImpl();


	@Override
	public Supervisor getLoginMember(HttpServletRequest req) {
		Supervisor supervisor = new Supervisor();

		supervisor.setSuper_id(req.getParameter("supervisor_id"));
		supervisor.setSuper_pw(req.getParameter("supervisor_pw"));

		return supervisor;
	}

	@Override
	public boolean login(Supervisor supervisor) {
		if( supervisordao.selectCntMemberByUseridAndUserpw(supervisor) >= 1 ) {
			//로그인 성공
			return true;

		} else {
			//로그인 실패
			return false;
			
		}
	}

	@Override
	public Supervisor getMemberByUserid(Supervisor supervisor) {
		return supervisordao.selectMemberByUserid(supervisor);
	}

	@Override
	public List<Member> getuserList(Paging paging) {
		return supervisordao.getUserList(paging);
	}

	@Override
	public void DeleteUser(HttpServletRequest req) {
		String[] params= req.getParameterValues("check");

		Member member = new Member();

		for(String param : params) {
			System.out.println(param);

			member.setUser_Num(Integer.parseInt(param));

			supervisordao.memberdelete(member);

		}
				
	}

	@Override
	public Paging memberListgetPaging(HttpServletRequest req) {
		// 요청파라미터 curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0;
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
//		System.out.println("curPage: "+curPage);

		// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
		int totalCount = supervisordao.memberselectCntAll(req);
		System.out.println("totalcount:" + totalCount);
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		if(req.getParameter("search")!=null&&!"".equals(req.getParameter("search"))) {
			paging.setSearch(req.getParameter("search"));
		}
		
		return paging;
	}

}
