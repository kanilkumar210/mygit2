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
</head>
<body style="background-color: blue">
	<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root"
		password="Anilkarre8@" />

	<sql:query dataSource="${dbsource}" var="result">
	SELECT * FROM project.corporate_setup where status='active';
	</sql:query>
	<h1 style="font-size: 80px; text-align: center; color: white;">Smart
		Bank</h1>
	<!-- 	<h2 style="color: white; text-align: center;">Select Corporate</h2>
 -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3 class="form-group" style="color: white;">Select Corporate</h3>
				<input list="AccountDetails" type="text" class="form-control"
					id="accountData">
				<datalist style="width: 155px" id="AccountDetails">
					<c:forEach items="${result.rows}" var="row">
						<option value="${row.corporate_name}"></option>
					</c:forEach>
				</datalist>
				<input type="submit" onclick="getAccounts(accountData.value)"
					value="Get Accounts" style="background-color: green; color: white;">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function getAccounts(data) {
			console.log(data);
			location.href = `getAccounts.jsp?id=` + data;
		}
	</script>
</body>
</html>