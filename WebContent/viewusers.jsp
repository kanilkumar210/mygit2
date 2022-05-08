<!DOCTYPE html>

<%@page import="com.pack.model.Corporate"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Corporates</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: pink;
}

.heading {
	color: white;
	text-align: center;
	font-size: 80px;
}

.abc1 {
	position: relative;
	left: 300px;
	top: 10px;
	background-color: #c2fbd7;
	border-radius: 100px;
	box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .15) 0 1px 2px, rgba(44, 187, 99, .15) 0 2px 4px,
		rgba(44, 187, 99, .15) 0 4px 8px, rgba(44, 187, 99, .15) 0 8px 16px,
		rgba(44, 187, 99, .15) 0 16px 32px;
	color: green;
	cursor: pointer;
	display: inline-block;
	font-family: CerebriSans-Regular, -apple-system, system-ui, Roboto,
		sans-serif;
	padding: 7px 20px;
	text-decoration: none;
	transition: all 250ms;
	border: 0;
	font-size: 16px;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

.abc2 {
	position: relative;
	left: -100px;
	top: 10px;
	background-color: #c2fbd7;
	border-radius: 100px;
	box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .15) 0 1px 2px, rgba(44, 187, 99, .15) 0 2px 4px,
		rgba(44, 187, 99, .15) 0 4px 8px, rgba(44, 187, 99, .15) 0 8px 16px,
		rgba(44, 187, 99, .15) 0 16px 32px;
	color: green;
	cursor: pointer;
	display: inline-block;
	font-family: CerebriSans-Regular, -apple-system, system-ui, Roboto,
		sans-serif;
	padding: 7px 20px;
	text-decoration: none;
	transition: all 250ms;
	border: 0;
	font-size: 16px;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

.abc3 {
	position: relative;
	left: 700px;
	top: 10px;
	background-color: red;
	border-radius: 100px;
	box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .15) 0 1px 2px, rgba(44, 187, 99, .15) 0 2px 4px,
		rgba(44, 187, 99, .15) 0 4px 8px, rgba(44, 187, 99, .15) 0 8px 16px,
		rgba(44, 187, 99, .15) 0 16px 32px;
	color: white;
	cursor: pointer;
	display: inline-block;
	font-family: CerebriSans-Regular, -apple-system, system-ui, Roboto,
		sans-serif;
	padding: 7px 20px;
	text-decoration: none;
	transition: all 250ms;
	border: 0;
	font-size: 16px;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}
</style>

</head>
<body>

	<%@page import="com.pack.dao.CorporateDao,com.pack.model.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1 style="color: red; text-align: center;">Corporate List</h1>

	<%
		CorporateDao corDao = new CorporateDao();
		List<Corporate> list = corDao.getAllRecords();
		request.setAttribute("list", list);
	%>
	<div class="container">
		<a href="adduserform.jsp"><button class="abc1">Add
				Corporate</button></a> <a href="adminHome.jsp"><button class="abc2">Admin
				Home</button></a> <a href="index.jsp"><button class="abc3">Log Out</button></a>

		<hr>
		<table class="table table-striped" style="text-align: center;">
			<tr>
				<th>Corporate_Id</th>
				<th>Corporate_Name</th>
				<th>Address</th>
				<th>PhoneNumber</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${list}" var="u">
				<tr>
					<td>${u.getCorporateId()}</td>
					<td>${u.getCorporateName()}</td>
					<td>${u.getAddress()}</td>
					<td>${u.getPhoneNumber()}</td>
					<td><a href="editform.jsp?id=${u.getCorporateId()}"><button
								type="button"
								style="background-color: green; border-radius: 80px; color: white;">Update</button></a></td>
					<td><a href="deleteCorporate.jsp?id=${u.getCorporateId()}"><button
								type="button"
								style="background-color: red; border-radius: 80px; color: white;">Delete</button></a></td>
				</tr>
			</c:forEach>
		</table>

	</div>

</body>
</html>