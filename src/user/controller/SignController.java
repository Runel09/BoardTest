package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dto.User;
import user.service.face.UserService;
import user.service.impl.UserServiceImpl;

/**
 * Servlet implementation class SignController
 */
@WebServlet("/sign")
public class SignController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private UserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String inputId=(String) req.getAttribute("InputId");
    	User inputUser =new User();
    	inputUser.setUSERID(inputId);
    	
    	userService.checkId(inputUser);
    }

}
