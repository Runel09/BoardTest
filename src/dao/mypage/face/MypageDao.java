package dao.mypage.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.board.Board;
import dto.board.Comment;
import dto.login.Member;
import util.Paging;

public interface MypageDao {

	Member selectUserInfo(Member member);

	List<Board> selectBaordByUserId(Paging paging,HttpServletRequest req);

	int mypageboardselectCntAll(HttpServletRequest req);

	Member selectMemberbyUserid(Member member);

	void updateMemberinfo(HttpServletRequest req);



}
