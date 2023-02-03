<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
<%@ page import="com.android.util.DBConnection"%>
<%@ page import="com.android.entity.Contact"%>
<%@ page import="com.android.model.ContactDao"%>
<%@ page import="java.util.List"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("Invalid", "please Login..");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container">
		<%
		String succMsg = (String) session.getAttribute("succMsg");
		String failMsg = (String) session.getAttribute("failMsg");
		if (succMsg != null) {
		%>
		<div class="alert alert-success" role="alert"><%=succMsg%></div>
		<%
		session.removeAttribute("succMsg");
		}
		if (failMsg != null) {
		%>
		<div class="alert alert-success" role="alert"><%=failMsg%></div>
		<%
		session.removeAttribute("failMsg");
		}
		%>
		<div class="row p-4">
			<%
			if (user != null) {
				ContactDao cd = new ContactDao(DBConnection.getConnection());
				List<Contact> contact = cd.getAllContacts(user.getId());
				for (Contact c : contact) {
			%>
			<div class="col-md-4 p-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title"><%=c.getName()%></h5>
						<p class="card-text"><%=c.getPhoneNo()%></p>
						<p class="card-text"><%=c.getEmail()%></p>
						<p class="card-text"><%=c.getAbout()%></p>
						<div class="text-center">
							<a href="updateContact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a> <a
								href="delete?cid=<%=c.getId()%>"
								class="btn btn-danger btn-sm text-white">delete</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>
		</div>

	</div>

</body>
</html>