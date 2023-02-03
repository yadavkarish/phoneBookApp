package com.android.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.android.model.ContactDao;
import com.android.util.DBConnection;

@WebServlet("/delete")
public class DeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid=Integer.parseInt(req.getParameter("cid"));
		ContactDao cd=new ContactDao(DBConnection.getConnection());
		boolean delete=cd.deleteContactById(cid);
		HttpSession session=req.getSession();
		if(delete!=false) {
		     session.setAttribute("succMsg", "Contact deleted successfully!");
		     resp.sendRedirect("viewcontact.jsp");
		}else {
			session.setAttribute("failMsg", "oops,something went wrong on server!");
		     resp.sendRedirect("viewcontact.jsp");
		}
	}
	


}
