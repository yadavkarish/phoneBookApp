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
   
</body>
</html>