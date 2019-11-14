package user.dao.face;

import user.dto.User;

public interface SignDao {	
	//서비스에서 보내준 아이디 정보를 DB에서 확인후 0,1로 반환(0=중복,1=비중복)
	public User checkIdDB(User user);
	
	
}
