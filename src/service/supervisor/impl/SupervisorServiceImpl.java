package service.supervisor.impl;

import javax.servlet.http.HttpServletRequest;

import dao.supervisor.face.SupervisorDao;
import dao.supervisor.impl.SupervisorDaoImpl;
import dto.supervisor.Supervisor;
import service.supervisor.face.SupervisorService;

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

}
