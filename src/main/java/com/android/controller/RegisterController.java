package com.android.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.android.entity.User;
import com.android.model.UserDao;
import com.android.util.DBConnection;


@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		System.out.println(name+" "+email+" "+password);
		
		User user=new User(name,email,password);
		
		UserDao userDao= new UserDao(DBConnection.getConnection());
		System.out.println(DBConnection.getConnection());
		boolean register=userDao.userRegister(user);
		
		HttpSession session=request.getSession();
		if(register==true)
		{
			session.setAttribute("sucssMsg","User register successfully!.....");
			response.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("errorMsg","Oops,something went wrong!.....");
			response.sendRedirect("register.jsp");
		}
		
	}

}
