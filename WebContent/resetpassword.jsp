<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3 style="color: blue; text-align: center;">Reset Password...!</h3>
				<hr>

				<form action="Login" method="post">
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