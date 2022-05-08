<%-- <%@page import="com.pack.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	padding-top: 40px;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%
		User u = (User) request.getAttribute("details");
		//long id = Long.parseLong(request.getParameter(u.getLogin_id()));
		//System.out.println(u.getLogin_id());
	%>
	<div class="container">
		<a href="accountSummary.jsp?id=<%=u.getCorporate_id()%>">Account
			Summary </a> <br> <a
			href="accountDetails.jsp?id=<%=u.getCorporate_id()%>&name=<%=u.getUsername()%>">Account
			Details</a><br> <a href="login.html">Log Out</a><!--  -->
	</div>

</body>
</html> --%>