
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: skyblue;
}

.button {
	position: relative;
	background-color: #EA4C89;
	border-radius: 8px;
	border-style: none;
	box-sizing: border-box;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial,
		sans-serif;
	font-size: 14px;
	font-weight: 500;
	height: 40px;
	line-height: 20px;
	list-style: none;
	margin: 0;
	outline: none;
	padding: 10px 16px;
	position: relative;
	text-align: center;
	text-decoration: none;
	transition: color 100ms;
	vertical-align: baseline;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

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

<body>
	<div class="container">
		<div class="row">
			<!-- <h1 style="color: blue; text-align: center; font-size: 80px;">Smart
				Bank</h1> -->
			<h1 style="color: red; text-align: center;">Add Corporate</h1>
			<a href="viewusers.jsp"">
				<button class="button">Corporate List</button>
			</a> <a href="viewusers.jsp"><button class="abc3">Back</button></a>
			<hr>

			<div class="col-md-4 offset-4">
				<form action="adduser.jsp" method="post">
					<label class="form-group">CorporateName:</label> <input type="text"
						name="corporateName" class="form-control" required="required"
						placeholder="Corporate Name" /> <label class="form-group">Address:</label>
					<input type="text" name="address" class="form-control"
						required="required" placeholder="Address" /> <label
						class="form-group">PhoneNumber:</label> <input type="tel"
						name="phoneNumber" pattern="[0-9]{10}" title="Ten digits code"
						class="form-control" required="required"
						placeholder="Phone Number">
					<button type="submit" class="btn btn-success my-1 pt-1">submit</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>