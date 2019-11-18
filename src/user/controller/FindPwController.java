package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import email.service.EmailService;
import email.service.EmailServiceImpl;
import user.dto.User;
import user.service.face.UserService;
import user.service.impl.UserServiceImpl;

/**
 * Servlet implementation class FindPwController
 */
@WebServlet("/find/pw")
public class FindPwController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService=new UserServiceImpl();
	EmailService emailService = new EmailServiceImpl();
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			super.doGet(req, resp);
			
		}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
