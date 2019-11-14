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
	public User confirmLoginInformation(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User checkEmail(HttpServletRequest req) {
		// TODO Auto-generated method stub
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


}
