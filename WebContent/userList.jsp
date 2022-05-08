<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: yellow;
}

h1 {
	font-size: 80px;
	text-align: center;
	color: red;
}

.button1 {
	background-image: linear-gradient(#0dccea, #0d70ea);
	border: 0;
	border-radius: 4px;
	box-shadow: rgba(0, 0, 0, .3) 0 5px 15px;
	box-sizing: border-box;
	color: #fff;
	cursor: pointer;
	font-family: Montserrat, sans-serif;
	font-size: .9em;
	margin: 5px;
	padding: 10px 15px;
	text-align: center;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

.button3 {
	position: relative;
	left: 750px;
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
</head>
<body>
	<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root"
		password="Anilkarre8@" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT user.* from user inner join corporate_setup on user.corporate_id=corporate_setup.corporate_id where  activestatus='active' and corporate_setup.corporate_name=?;
            <sql:param value="${param.id}"></sql:param>
	</sql:query>
	<h2 style="color: blue; text-align: center;">User Details</h2>
	<div class="container">
		<a href="registerUser.jsp">
			<button class="button1">Add User</button>
		</a> <a href="adminHome.jsp"><button class="button1">Admin
				Home</button></a> <a href="index.jsp"><button class="button3">Log
				Out</button></a>
		<div class="row">
			<hr>
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th>Corporate Id</th>
						<th>Login Id</th>
						<th>User Name</th>
						<th>Password</th>
						<th>Department</th>
						<th>Address</th>
						<th>Phone Number</th>
						<th>Update</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${result.rows}" var="user">
						<tr>
							<td>${user.corporate_id}</td>
							<td>${user.login_id}</td>
							<td>${user.username}</td>
							<td>${user.password}</td>
							<td>${user.department}</td>
							<td>${user.address}</td>
							<td>${user.mobilenumber}</td>
							<td><a
								href="UpdateUserDetails?id=${user.login_id}&corId=${user.corporate_id}"><button
										type="button"
										style="background-color: green; border-radius: 80px; color: white;">Update</button></a></td>
							<td><a
								href="DeleteUserServlet?id=${user.login_id}&corId=${user.corporate_id}"
								onclick="alert('Successfully deleted...')"><button
										type="button"
										style="background-color: red; border-radius: 80px; color: white;">Delete</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
