<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
h1 {
	text-align: center;
	font-size: 60px;
}

#abc {
	text-align: center;
}

table.mytable-marg {
	border-collapse: collapse;
}

table.mytable-marg td, table.mytable-marg th {
	border: 1px solid #ccc;
}

.mytable-marg {
	margin: 0px 400px;
	width: 500px;
}

td {
	padding: 20px;
	width: 2000px;
	text-align: center;
	background-color: skyblue;
}

.button {
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
}
</style>
<body style="background-color: lightyellow;">
	<h1>Smart Bank</h1>

	<table class="mytable-marg">
		<tr>
			<td><a href="viewusers.jsp"><button class="button">Corporate
						Setup</button></a></td>
		</tr>
		<tr>
			<td><a href="getUsers.jsp"><button class="button">User
						Setup</button></a></td>
		</tr>
		<tr>
			<td><a href="getAccountDetails.jsp"><button class="button">Account
						Setup</button></a></td>
		</tr>
		<!-- <tr>
			<td><a href="registerUser.jsp"><button class="button">Add
						User</button></a></td>
		</tr>
		<tr>
			<td><a href="adduserform.jsp"><button class="button">Add
						Corporate</button></a></td>
		</tr> -->
		<!-- <tr>
			<td><a href="addaccform.jsp"><button class="button">Add
						Account</button></a></td>
		</tr> -->
		<tr>
			<td><a href="index.jsp"><button class="button"
						style="background-color: red;">Log Out</button></a></td>
		</tr>
	</table>


</body>
</html>

