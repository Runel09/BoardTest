package board.dao.face;

import java.util.List;

import board.dto.Board;
import board.dto.Comment;

public interface CommentDao {

	List<Comment> selectCommentByBoardNo(Board board);
	
	public void insertComment(Comment comment);

	public void deleteComment(Comment comment);
	
}
