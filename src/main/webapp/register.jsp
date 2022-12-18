<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color: #f7faf8;">
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-5 mt-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Registration Page</h4>
						<%
						String sucssMsg = (String) session.getAttribute("sucssMsg");
						String erorrMsg = (String) session.getAttribute("erorrMsg");
						if (sucssMsg != null) {
						%>
						<h6 class="text-success text-center"><%=sucssMsg%></h6>
						<%
						session.removeAttribute("sucssMsg");
						} if (erorrMsg != null) {
						%>
						<h6 class="text-danger text-center"><%=erorrMsg%></h6>
						<%
						session.removeAttribute("errorMsg");
						}
						%>
						<form action="Register" method="post">
							<div class="form-group">
								<label for="exexampleInputName1">Enter Name</label> <input
									name="name" type="text" class="form-control"
									id="exampleInputName1">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 123px;">
		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>