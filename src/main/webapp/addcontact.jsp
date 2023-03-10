<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
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
						<h4 class="text-center text-success">Add Contact Page</h4>
						<%
						String succMsg = (String) session.getAttribute("succMsg");
						String failMsg = (String) session.getAttribute("failMsg");
						if (succMsg != null) {
						%>
						<h6 class="text-success text-center"><%=succMsg%></h6>
						<%
						session.removeAttribute("succMsg");
						} if (failMsg != null) {
						%>
						<h6 class="text-danger text-center"><%=failMsg%></h6>
						<%
						session.removeAttribute("failMsg");
						}
						%>
						<form action="addContact" method="post">
						<%if(user!=null){ %>
						<input name="userId" type="hidden" value="<%=user.getId()%>">
						<%} %>
							<div class="form-group">
								<label for="exexampleInputName1">Enter Name</label> <input name="name"
									type="text" class="form-control" id="exampleInputName1">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputNo1">Enter phone number</label> <input name="phoneNo"
									type="text" class="form-control" id="exampleInputNo1">
							</div>
							<div class="form-group">
								<textarea class="form-control" row="3" cols="" name="about" placeholder="Enter About...." ></textarea>
							</div>

							<div class="text-center mt-2">
								<button type="submit" class="btn btn-success">Save Contact</button>
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