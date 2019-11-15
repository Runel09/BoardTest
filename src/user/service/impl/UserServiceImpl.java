package user.service.impl;

import javax.servlet.http.HttpServletRequest;

import user.dao.face.UserDao;
import user.dao.impl.UserDaoImpl;
import user.dto.User;
import user.service.face.UserService;

public class UserServiceImpl implements UserService {
	private UserDao userDao=new UserDaoImpl();
	@Override
	public User checkId(User user) {
		
		return userDao.checkIdDB(user);
	}

	@Override
	public User setAdress(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void checkAndInsert(User user) {
		// TODO Auto-generated method stub
		
	}
	

	@Override
	public User checkEmail(HttpServletRequest req) {
		
		return null;
	}


	@Override
	public User findId(User user) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public User findPw(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getLoginMember(HttpServletRequest req) {
		User user = new User();
		user.setUSERID((String)req.getParameter("userId"));
		user.setUSERPW((String)req.getParameter("userPw"));
		return user;
	}

	@Override
	public boolean login(User user) {
		int checkCnt=0;
		checkCnt=userDao.selectCntUserByDBID(user);
		if(checkCnt==1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public User getMemberByUserid(User user) {
		return userDao.selectUserByDBID(user);
		 
	}


}
