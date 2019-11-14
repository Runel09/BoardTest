package board.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.dao.face.BoardDao;
import board.dao.impl.BoardDaoImpl;
import board.dto.Board;
import board.service.face.BoardService;

public class BoardServiceImpl implements BoardService {
	private BoardDao boardDao = new BoardDaoImpl();
	
	@Override
	public List<Board> listview() {
		return boardDao.boardList();
	
	}

	@Override
	public Board getBoardno(HttpServletRequest req) {
		// 전달 파라미터 얻기
		String param = req.getParameter("boardno");

		// 전달 값이 없으면 종료
		if (param == null)
			return null;

		// 전달 파라미터를 int형으로 변환
		int boardno = Integer.parseInt(param);
		// 전달 파라미터를 DTO(모델)에 담기
		
		Board board = new Board();
		board.setBoardno(boardno);

		// DB 조회 결과 반환
		return board;
	}

	@Override
	public Board view(Board board) {
		
//		boardDao.updateHit(board);
		Board resultBoard = boardDao.selectBoardByBoardno(board);
		return resultBoard;
		
	}
	
	//-----------------------------------------------------------

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

	@Override
	public void writeBoard(Board board) {
		boardDao.insertReco(board);
	}
	
	

}
