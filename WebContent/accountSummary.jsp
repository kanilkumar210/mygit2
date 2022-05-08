<%@page import="com.pack.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.button3 {
	position: relative;
	left: 220px;
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
<body style="background-color: blue">
	<%
		User user = (User) request.getAttribute("details");
	%>
	<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root"
		password="Anilkarre8@" />

	<sql:query dataSource="${dbsource}" var="result">
	SELECT * FROM account_setup where corporate_id=? and status='active';
		<sql:param value="<%=user.getCorporate_id()%>"></sql:param>
	</sql:query>

	<div class="container">
		<h1 style="font-size: 60px; text-align: center;">Account Summary</h1>
		<br>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">

					<h3 class="form-group" style="color: white;">
						Select Account : <a href="index.jsp"><button class="button3">Log
								Out</button> </a>
					</h3>
					<input list="accountnumber" type="text" class="form-control"
						id="accountData">
					<datalist style="width: 155px" id="accountnumber">
						<c:forEach items="${result.rows}" var="row">
							<option value="${row.account_number}">${row.account_number}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${row.account_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${row.branch}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${row.currency}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${row.available_balance}</option>
						</c:forEach>
					</datalist>
					<input type="submit" onclick="getAccount(accountData.value)"
						value="Account Details"
						style="background-color: green; color: white;">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/* document.getElementById("button").onclick = */
		function getAccount(data) {
			console.log(data);
			/* var temp = document.getElementById("accountnumber").innerHTML;
			console.log(temp); */

			location.href = `accountDetails.jsp?id=` + data;
		}
	</script>
</body>
</html>