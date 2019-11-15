package user.dao.face;

import email.dto.Email;
import user.dto.User;

public interface UserDao {	
	//서비스에서 보내준 아이디 정보를 DB에서 확인후 0,1로 반환(0=중복,1=비중복)
	public User checkIdDB(User user);
	
	public User findAdress(User user);
	
	//보낸 User 정보를 DB에 입력 
	public void insertUser(User user);
	
	public Email searchEmail(String email);
	/**
	 * 
	 * @param email  
	 */
	public void insertFindInfo(Email email);
	
	public User findUserId(User user);
	
	public User findUserPw(User user);

	public int selectCntUserByDBID(User user);
	
	User selectUserByDBID(User user);
	
}
