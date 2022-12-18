package com.android.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.android.entity.User;
import com.android.model.UserDao;
import com.android.util.DBConnection;

@WebServlet("/Login")
public class LoginController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDao userDao = new UserDao(DBConnection.getConnection());
		User user = userDao.loginUser(email, password);
		HttpSession session=req.getSession();
		System.out.println(user);
		if (user != null) {
			session.setAttribute("user", user);
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("Invalid", "Invalid user name or password!");
			resp.sendRedirect("login.jsp");
		}

	}

}
