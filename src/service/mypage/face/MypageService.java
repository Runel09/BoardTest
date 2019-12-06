package service.mypage.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.board.Board;
import dto.board.Comment;
import dto.login.Member;
import util.Paging;

public interface MypageService {

	public Member selectUserInfo(Member member);

	public List<Board> selectBoardByUserId(Paging paging,HttpServletRequest req);

	public Paging mypageReviewListgetPaging(HttpServletRequest req);

	public Member getupdateUserId(HttpServletRequest req);

	public Member view(Member member);

	public void userUpdate(HttpServletRequest req);

	public void deleteMember(HttpServletRequest req);


	
}
