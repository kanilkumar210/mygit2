<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>SELECT Operation</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<style>
body {
	background-color: #ecf1f8;
}

h1 {
	font-size: 80px;
	text-align: center;
	color: white;
}

.button1 {
	background-color: blue;
	border-radius: 100px;
	box-shadow: black;
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

.button2 {
	position: relative;
	left: 100px;
	background-color: orange;
	border-radius: 100px;
	box-shadow: black;
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

.button3 {
	position: relative;
	left: 700px;
	top: px;
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
<body>

	<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root"
		password="Anilkarre8@" />

	<sql:query dataSource="${dbsource}" var="result">
	SELECT * FROM account_setup inner join corporate_setup on account_setup.corporate_id=corporate_setup.corporate_id where corporate_name=? and account_setup.status!='close';
	<sql:param value="${param.id}"></sql:param>
	</sql:query>

	<%-- <c:forEach items="${list}" var="u">
	<tr><td>${u.getId()}</td><td>${u.getName()}<td>${u.getEmail()}</td><td>${u.getGender()}</td><td>${u.getCountry()}</td><td><a href="editform.jsp?id=${u.getId()}">Edit</a></td><td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td></tr>
</c:forEach> --%>
	<h2 style="color: red; text-align: center;">Account Details</h2>

	<div class="container">
		<a href="addaccform.jsp">
			<button class="button1">Add Account</button>
		</a> <a href="adminHome.jsp"><button class="button2">Admin
				Home</button> </a> <a href="index.jsp"><button class="button3">Log
				Out</button> </a>

		<div class="row">
			<hr>
			<form>
				<table class="table table-striped" style="text-align: center;">
					<tr>
						<th>Corporate_Id</th>
						<th>Account Number</th>
						<th>Account Name</th>
						<th>Branch</th>
						<th>Currency</th>
						<th>AvailableBalance</th>
						<th colspan="2">Action</th>
					</tr>
					<c:forEach var="row" items="${result.rows}">
						<tr>
							<td><c:out value="${row.corporate_id}" /></td>
							<td><c:out value="${row.account_number}" /></td>
							<td><c:out value="${row.account_name}" /></td>
							<td><c:out value="${row.branch}" /></td>
							<td><c:out value="${row.currency}" /></td>
							<td><c:out value="${row.available_balance}" /></td>

							<!--  <td><a href="update.jsp?id=${row.id}">Update</a></td>-->
							<td><a
								href="AccountServlet?id=${row.account_number}&corname=${row.corporate_name}&action=deleteAccount"><button
										type="button"
										style="background-color: red; border-radius: 80px; color: white;">CloseAccount</button></a></td>

						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
	</div>
</body>
</html>