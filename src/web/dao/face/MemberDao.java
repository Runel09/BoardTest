package web.dao.face;

import java.util.List;

import util.Paging;
import web.dto.Member;

public interface MemberDao {
	
	public List<Member> getUserList(Paging paging);
	
	public int selectCntAll(String search);

	public void memberdelete(Member member);

}
