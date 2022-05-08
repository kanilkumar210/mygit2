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
<body>

	<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root"
		password="Anilkarre8@" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from account_setup where status='active';
            
        </sql:query>

	<%-- <c:forEach items="${list}" var="u">
	<tr><td>${u.getId()}</td><td>${u.getName()}<td>${u.getEmail()}</td><td>${u.getGender()}</td><td>${u.getCountry()}</td><td><a href="editform.jsp?id=${u.getId()}">Edit</a></td><td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td></tr>
</c:forEach> --%>
	<h2 style="color: skyblue; text-align: center;">Account Details</h2>

	<div class="container">
		<a href="addaccform.jsp">Add Account</a> &nbsp;&nbsp;&nbsp;<a
			href="adminHome.jsp">Admin Home</a>&nbsp;&nbsp;&nbsp;<a
			href="login.html">Log Out </a>

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
							<td><a href="getAccounts.jsp?id=${u.getCorporateId()}"><c:out
										value="${row.corporate_id}" /></a></td>
							<td><c:out value="${row.account_number}" /></td>
							<td><c:out value="${row.account_name}" /></td>
							<td><c:out value="${row.branch}" /></td>
							<td><c:out value="${row.currency}" /></td>
							<td><c:out value="${row.available_balance}" /></td>

							<!--  <td><a href="update.jsp?id=${row.id}">Update</a></td>-->
							<td><a
								href="AccountServlet?id=${row.account_number}&action=delete">CloseAccount</a></td>

						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
	</div>
</body>
</html>