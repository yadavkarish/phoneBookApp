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


@WebServlet("/UpdateContact")
public class UpdateController extends HttpServlet {
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int cid=Integer.parseInt(request.getParameter("cid"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phoneNo=request.getParameter("phoneNo");
		String about=request.getParameter("about");
		
		Contact contact=new Contact();
		contact.setName(name);
		contact.setEmail(email);
		contact.setAbout(about);
		contact.setPhoneNo(phoneNo);
		ContactDao contactDao=new ContactDao(DBConnection.getConnection());
		boolean update =contactDao.updateContact(contact);
		
		HttpSession session=request.getSession();
		if(update!=false) {
		     session.setAttribute("succMsg", "Contact update successfully!");
		     response.sendRedirect("viewcontact.jsp");
		}else {
			session.setAttribute("failMsg", "oops,something went wrong on server!");
		     response.sendRedirect("updateContact.jsp?cid=");
		}

		
	}

}
