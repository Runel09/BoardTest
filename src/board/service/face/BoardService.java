package board.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.dto.Board;

public interface BoardService {
	public List<Board> listview();
	
	public Board getBoardno(HttpServletRequest req);
	
	public Board view(Board board);
}
