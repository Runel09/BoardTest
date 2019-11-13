package board.dao.face;

import java.util.List;

import board.dto.Board;

public interface BoardDao {

	public List<Board> boardList();

	public Board selectBoardByBoardno(Board inboard);
	
	public void updateHit(Board board);
}
