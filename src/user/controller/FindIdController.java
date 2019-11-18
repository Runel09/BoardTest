package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import email.dto.Email;
import email.service.EmailService;
import email.service.EmailServiceImpl;
import user.service.face.UserService;
import user.service.impl.UserServiceImpl;

/**
 * Servlet implementation class FindId
 */
@WebServlet("/find/Id")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
		UserService userService =new UserServiceImpl();
		EmailService emailService = new EmailServiceImpl();
		
		@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			userService.checkEmail(req);
			Email email= null;
			emailService.sendCheckInfo((Email)email);
			
			
			}
		
		@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
			}
}
