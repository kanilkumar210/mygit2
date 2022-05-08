<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: orange;
}

h1 {
	font-size: 80px;
	text-align: center;
}

.abc {
	text-align: left;
	align-items: center;
	appearance: none;
	background-image: radial-gradient(100% 100% at 100% 0, #5adaff 0, #5468ff 100%);
	border: 0;
	border-radius: 6px;
	box-shadow: rgba(45, 35, 66, .4) 0 2px 4px, rgba(45, 35, 66, .3) 0 7px
		13px -3px, rgba(58, 65, 111, .5) 0 -3px 0 inset;
	box-sizing: border-box;
	color: #fff;
	cursor: pointer;
	display: inline-flex;
	font-family: "JetBrains Mono", monospace;
	height: 48px;
	justify-content: center;
	line-height: 1;
	list-style: none;
	overflow: hidden;
	padding-left: 16px;
	padding-right: 16px;
	position: relative;
	text-align: left;
	text-decoration: none;
	transition: box-shadow .15s, transform .15s;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	white-space: nowrap;
	will-change: box-shadow, transform;
	font-size: 18px;
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
	<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root"
		password="Anilkarre8@" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from project.corporate_setup where status='active';
        </sql:query>
	<div class="container">

		<h2 style="color: blue; text-align: center;">Add Account Details</h2>
		<a href="getAccountDetails.jsp"><button class="abc3">Back</button></a>
		<div class="row">
			<!-- <a href="view1.jsp" style="text-align: right;">View All Records</a> -->
			<hr>

			<div class="col-md-4 offset-4">
				<form action="AccountServlet" method="get">

					<label class="form-group">Corporate Id</label> <select
						name="corporate_id" style="width: 155px" required="required"
						class="form-control">
						<c:forEach items="${result.rows}" var="row">
							<option>${row.corporate_id}</option>
						</c:forEach>
					</select> <label class="form-group">Account Number:</label> <input
						type="number" placeholder="Account Number" name="account_number"
						required="required" class="form-control" /> <label
						class="form-group">Account Name:</label> <input type="text"
						placeholder="Account Name" name="account_name" required="required"
						class="form-control" /> <label class="form-group">Branch:</label>
					<select name="branch" style="width: 155px" required="required"
						class="form-control">
						<option>Hyderabad</option>
						<option>Banglore</option>
						<option>Chennai</option>
						<option>Pune</option>
						<option>Other</option>
					</select> <label class="form-group">Currency:</label> <select
						name="currency" style="width: 155px" required="required"
						class="form-control">
						<option>Rupees</option>
						<option>Dollar</option>
						<option>Other</option>
					</select> <label class="form-group">Available Balance:</label> <input
						placeholder="Balance" type="number" name="available_balance"
						required="required" class="form-control" /> <input type="hidden"
						name="action" value="add" />

					<button type="submit" class="btn btn-success my-1 pt-1">
						Submit</button>
				</form>

			</div>
		</div>
	</div>
</body>
</html>