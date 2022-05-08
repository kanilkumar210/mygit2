<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style type="text/css">
div.col-md-6 {
	border: 2px solid blue;
	border-radius: 50px 20px;
	padding-top: 60px;
	padding-bottom: 100px;
	padding-left: 50px;
	padding-right: 50px;
	margin: 100px;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body style="background-color: #F0F8FF;">

	<div class="container">
		<div class="row">
			<div class="col-md-6">

				<h2 style="color: blue; text-align: center; font: bold;">Login
					Here.....!!!</h2>

				<form action="AdminLogin" method="get">

					<div class="form-group">
						<label>Username</label> <input type="text" name="username"
							class="form-control" required="required">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							name="password" class="form-control" required="required">
					</div>
					<button type="submit" class="btn btn-success my-1 pt-1">
						Login</button>
					<button type="reset" class="btn btn-danger my-1 pt-1">Reset</button>
					<br>

				</form>
			</div>
		</div>
	</div>
</body>
</html>
