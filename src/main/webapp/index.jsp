<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.android.util.DBConnection"%>

<style type="text/css">
.back-img {
	background: url("image/19362653.jpg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid back-img text-center text-success">
		<h1>Welcome to PhoneBook App</h1>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>