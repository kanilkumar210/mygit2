<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
.abc3 {
	position: relative;
	left: 900px;
	top: -40px;
	background-color: blue;
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
<body style="background-color: lightgreen;">
	<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root"
		password="Anilkarre8@" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from project.corporate_setup where status='active';
        </sql:query>


	<div class="container">
		<div class="row">
			<h2 style="color: blue; text-align: center;">Add User Details</h2>
			<a href="getUsers.jsp"><button class="abc3">Back</button></a>
			<hr>
			<div class="col-md-4 offset-4">

				<form action="AddUserDetails" method="post">
					<div class="form-group">
						<label class="form-group">Corporate Id</label> <select
							name="corporateId" style="width: 155px" required="required"
							class="form-control">
							<c:forEach items="${result.rows}" var="row">
								<option>${row.corporate_id}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="loginId">Login Id</label> <input type="number"
							class="form-control" placeholder="Login Id" name="loginId"
							required="required">
					</div>
					<div class="form-group">
						<label for="username">User Name</label> <input type="text"
							placeholder="Username" class="form-control" name="user"
							required="required">
					</div>
					<div class="form-group">
						<label for="department">Department</label> <input type="text"
							placeholder="Department" name="department" class="form-control"
							required="required">
					</div>
					<div class="form-group">
						<label for="address">Address</label> <input type="text"
							placeholder="Address" name="address" class="form-control"
							required="required">
					</div>
					<div class="form-group">
						<label for="mobNumber">Mobile Number</label> <input type="tel"
							placeholder="850XXXX123" class="form-control" required="required"
							name="mobNumber" pattern="[0-9]{10}" title="Ten digits code">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							placeholder="password" class="form-control" required="required"
							name="pass">
					</div>
					<div class="form-group">
						<label for="confirmpassword">Confirm Password</label> <input
							type="text" placeholder="confirm password" class="form-control"
							required="required" name="confirmPass">
					</div>
					<button type="submit" class="btn btn-success my-1 pt-1">submit</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>