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
		response.sendRedirect("login.jsp");
		}%>
	<div class="container-fluid">
		<div class="row p-3 mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Contact Page</h4>
						<form>
							<div class="form-group">
								<label for="exexampleInputName1">Enter Name</label> <input
									type="text" class="form-control" id="exampleInputName1">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputNo1">Enter phone number</label> <input
									type="text" class="form-control" id="exampleInputNo1">
							</div>
							<div class="form-group">
								<textarea class="form-control" >Enter About....</textarea>
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