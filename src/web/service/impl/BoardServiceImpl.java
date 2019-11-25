package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.face.BoardDao;
import web.dao.impl.BoardDaoImpl;
import web.dto.Board2;
import web.service.face.BoardService;

public class BoardServiceImpl implements BoardService{

	BoardDao boardDao = new BoardDaoImpl();
	
	@Override
	public Board2 getParam(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void writeBoard() {
		// TODO Auto-generated method stub
		
	}

	// 페이징 처리 메소드
	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		
		//요청파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0;
		if(param!=null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		//Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
		int totalCount = boardDao.selectCntAll(req);
		
		//Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		if(req.getParameter("search")!=null&&!"".equals(req.getParameter("search"))) {
			paging.setSearch(req.getParameter("search"));
		}
		
		return paging;
	}
	
	// 전체 게시물 가져오는 메소드
	@Override
	public List<Board2> getList(Paging paging) {

		return boardDao.selectAll(paging);
	}
	
	
	@Override
	public void readBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void recoBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void downLoad() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void repoBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cmtBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void readAll() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void searchBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void readPlanner() {
		// TODO Auto-generated method stub
		
	}

}
