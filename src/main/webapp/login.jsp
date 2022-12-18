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
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Login Page</h4>
						<%
						String invalmsg=(String)session.getAttribute("Invalid");
						if(invalmsg!=null){
						%>
						<p class="text-danger text-center"><%=invalmsg %></p>
						<%
						session.removeAttribute("Invalid");
						} %>
						<%
						String logmsg=(String)session.getAttribute("logmsg");
						if(logmsg!=null){
						%>
						<p class="text-success text-center"><%=logmsg %></p>
						<%
						session.removeAttribute("logmsg");
						} %>
						<form action="Login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="password"
									type="password" class="form-control" id="exampleInputPassword1">
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
	<div style="margin-top: 209px;">
		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>