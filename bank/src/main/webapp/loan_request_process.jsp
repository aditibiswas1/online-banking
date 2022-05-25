<%@page import="bank.LoanModel"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
<div class="row">
		<jsp:include page="header.jsp" />
	</div>


	<%
		String account_no = request.getParameter("account_no");
		int amount = Integer.parseInt(request.getParameter("amount"));
		DatabaseOperations operations = new DatabaseOperations();
		operations.UpdateAmount(account_no, amount);
	%>

	<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="alert alert-success col-md-4 col-md-offset-4"
				role="alert">
				<h4 class="alert-heading">Success!</h4>
				<p>
					<strong>Loan Amount has been approved.</strong>
				</p>
				<p class="mb-0">
					<b>Account Number: </b>
					<%=account_no%>
				</p>
				<p class="mb-0">
					<b>Loan Amount: </b>
					<%=amount%>
				</p>
			</div>
			<div class="scheme-button col-md-4 col-md-offset-4">
			<a type="button" class="btn btn-default btn-small" href="loan_request.jsp"
							style="border-radius: 24px;">Go back</a>
		</div>
		</div>
		<!-- Footer start here -->
		<div class="row" style="margin-top: 50px;">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>