package com.android.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.android.entity.Contact;
import com.android.model.ContactDao;
import com.android.util.DBConnection;

@WebServlet("/addContact")
public class AddContactController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId= Integer.parseInt(req.getParameter("userId"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phoneNo=req.getParameter("phoneNo");
		String about=req.getParameter("about");
		System.out.println(userId+""+name+""+email+""+phoneNo+""+about);
		ContactDao contactDao=new ContactDao(DBConnection.getConnection());
		Contact contact=new Contact( name, email, phoneNo, about, userId);
		
		boolean add=contactDao.saveContact(contact);
		HttpSession session=req.getSession();
		if(add!=false) {
		     session.setAttribute("succMsg", "Contact saved successfully!");
		     resp.sendRedirect("addcontact.jsp");
		}else {
			session.setAttribute("failMsg", "oops,something went wrong on server!");
		     resp.sendRedirect("addcontact.jsp");
		}
		
	}
	

}
