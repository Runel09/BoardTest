package service.mypage.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.mypage.face.MypageDao;
import dao.mypage.impl.MypageDaoImpl;
import dto.board.Board;
import dto.board.Comment;
import dto.login.Member;
import service.mypage.face.MypageService;
import util.Paging;

public class MypageServiceImpl implements MypageService {
	
	private MypageDao mypageDao = new MypageDaoImpl();
	
	@Override
	public Member selectUserInfo(Member member) {
		return mypageDao.selectUserInfo(member);
	}

	@Override
	public List<Board> selectBoardByUserId(Paging paging, HttpServletRequest req) {

		
		return mypageDao.selectBaordByUserId(paging,req);
		
	}

	@Override
	public Paging mypageReviewListgetPaging(HttpServletRequest req) {
		// 요청파라미터 curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0;
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		//		System.out.println("curPage: "+curPage);

		// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환s
		int totalCount = mypageDao.mypageboardselectCntAll(req);

		System.out.println("totalcount:" + totalCount);
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);


		return paging;
	}

	@Override
	public Member getupdateUserId(HttpServletRequest req) {
		HttpSession session = null;
		session=req.getSession();
		
		String userid = ((String)session.getAttribute("userid"));
		if(userid == null)
			return null;
		
		Member member= new Member();
		member.setUser_id(userid);
		
		return member;
	}

	@Override
	public Member view(Member member) {
		
		return mypageDao.selectMemberbyUserid(member);
	}

	@Override
	public void userUpdate(HttpServletRequest req) {
		
		mypageDao.updateMemberinfo(req);
		
	}
	
}
