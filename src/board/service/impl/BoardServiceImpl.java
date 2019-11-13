package board.service.impl;

import java.util.List;

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

}
