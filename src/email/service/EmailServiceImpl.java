package email.service;

import email.dto.Email;
import user.dao.face.UserDao;
import user.dao.impl.UserDaoImpl;

public class EmailServiceImpl implements EmailService{
	UserDao userDao = new UserDaoImpl();
	@Override
	public void sendCheckInfo(Email email) {
		userDao.insertFindInfo(email);
		
		
	}

}
