<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
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

.button3 {
	position: relative;
	left: 1000px;
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
</style>
</head>
<body>
	<%@page import="com.pack.dao.CorporateDao,com.pack.model.Corporate"%>


	<%
		CorporateDao corporateDao = new CorporateDao();
		int id = Integer.parseInt(request.getParameter("id"));
		Corporate u = corporateDao.getRecordByCorporateId(id);
	%>

	<div class="container">
		<div class="row">
			<h1 style="font-size: 40px; text-align: center;">Update
				Corporate</h1>
			<a href="login.html"><button class="button3">Log Out</button></a>
			<hr>
			<div class="col-md-4 offset-4">
				<form action="edituser.jsp" method="post">
					<input type="hidden" name="corporateId"
						value="<%=u.getCorporateId()%>" /> <label class="form-group">CorporateName:
						<input type="text" name="corporateName"
						value="<%=u.getCorporateName()%>" class="form-control"
						readonly="readonly" /> <label class="form-group">Address:</label>
						<input type="text" name="address" value="<%=u.getAddress()%>"
						class="form-control" required="required" /> <label
						class="form-group">PhoneNumber:</label> <input type="tel"
						name="phoneNumber" pattern="[0-9]{10}" title="Ten digits code"
						required="required" value="<%=u.getPhoneNumber()%>"
						class="form-control" />
						<button type="submit" class="btn btn-success my-1 pt-1">submit</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>