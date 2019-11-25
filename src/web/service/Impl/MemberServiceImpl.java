package web.service.Impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.Impl.MemberDaoImpl;
import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

public class MemberServiceImpl implements MemberService{

	
	MemberDao memberdao = new MemberDaoImpl();
	
	@Override
	public List<Member> getuserList(Paging paging) {
		return memberdao.getUserList(paging);
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// 요청파라미터 curPage를 파싱한다
				String param = req.getParameter("curPage");
				int curPage = 0;
				if (param != null && !"".equals(param)) {
					curPage = Integer.parseInt(param);
				}
//				System.out.println("curPage: "+curPage);

				// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
				int totalCount = memberdao.selectCntAll(req.getParameter("search"));

				// Paging 객체 생성
				Paging paging = new Paging(totalCount, curPage);
				
				return paging;
			}

	@Override
	public void DeleteUser(HttpServletRequest req) {

	String[] params= req.getParameterValues("check");
	
	Member member = new Member();

	for(String param : params) {
		System.out.println(param);

		member.setUser_Num(Integer.parseInt(param));
		
		 memberdao.memberdelete(member);
		
	}
	
	}



}
