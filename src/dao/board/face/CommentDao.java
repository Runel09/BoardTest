package dao.board.face;

import java.util.List;

import dto.board.Board;
import dto.board.Comment;

public interface CommentDao {

	List<Comment> selectCommentByBoardNo(Board board);
	
	public void insertComment(Comment comment);

	public void deleteComment(Comment comment);
	
}
