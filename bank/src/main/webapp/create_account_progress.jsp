<%@page import="bank.DatabaseOperations"%>
<%@page import="bank.AccountModel"%>
<%@page import="bank.JDBC_Connect"%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/png" href="image/favicon.png" />
<link rel="stylesheet" type="text/css" href="css/deposit.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="row">
		<jsp:include page="header.jsp" />
	</div>

	<!-- Declaring all variables -->
	<%!String account_no;
	int amount;
	boolean allRight;
	AccountModel model = new AccountModel();
	DatabaseOperations dbOperation = new DatabaseOperations();%>

	<!-- Inserting account info into Database -->
	<%
		model = (AccountModel) request.getAttribute("Account_details");
		allRight = dbOperation.insertAccountDetails(model);
		if (allRight) {
	%>

	<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="alert alert-success col-md-4 col-md-offset-4" role="alert">
				<h4 class="alert-heading">Success!</h4>
				<p>
					<strong>Your Account has been created.</strong>
				</p>
				<p class="mb-0">
					<b>Account Number: </b>
					<%=model.getAccount_no()%>
				</p>
				<p class="mb-0">
					<b>Amount: </b>
					<%=model.getAmount()%>
				</p>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="container-fullwidth">
			<div class="row" style="margin-top: 50px;">
				<div class="alert alert-danger col-md-4 col-md-offset-4" role="alert">
					<strong>Oh snap!</strong> Something wrong with Database insert.
				</div>
			</div>
		</div>

		<%
			}
		%>
		<!-- Footer start here -->
		<div class="row" style="margin-top: 50px;">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>