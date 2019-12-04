package dao.board.face;

import dto.board.Board;
import dto.board.BoardFile;

public interface BoardFileDao {

	void insert(BoardFile boardFile);

	BoardFile getfile(Board board);

	void delete(BoardFile prevfile);

}
