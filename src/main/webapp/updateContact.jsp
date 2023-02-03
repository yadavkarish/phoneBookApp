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
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%if(user==null){
		session.setAttribute("Invalid", "please Login..");
		response.sendRedirect("login.jsp");
		}%>
	<div class="container-fluid">
		<div class="row p-3 mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Update Contact Page</h4>
						<%
						String failMsg = (String) session.getAttribute("failMsg");
						if (failMsg != null) {
						%>
						<h6 class="text-danger text-center"><%=failMsg%></h6>
						<%
						session.removeAttribute("failMsg");
						}
						%>
						<form action="UpdateContact" method="post">
						<%
						int cid=Integer.parseInt(request.getParameter("cid"));
						ContactDao cd = new ContactDao(DBConnection.getConnection());
						Contact contact = cd.getContactById(cid);
						%>
							<div class="form-group">
								<label for="exexampleInputName1">Enter Name</label> <input value="<%=contact.getName()%>" name="name"
									type="text" class="form-control" id="exampleInputName1">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input value="<%=contact.getEmail()%>" name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputNo1">Enter phone number</label> <input value="<%=contact.getPhoneNo()%>" name="phoneNo"
									type="text" class="form-control" id="exampleInputNo1">
							</div>
							<div class="form-group">
								<textarea class="form-control" row="3" cols="" name="about" placeholder="Enter About...." ><%=contact.getAbout()%>"</textarea>
							</div>

							<div class="text-center mt-2">
								<button type="submit" class="btn btn-success">Update Contact</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 69px;">
		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>