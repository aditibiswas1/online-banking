<%@page import="bank.DatabaseOperations"%>
<%@page import="java.sql.Connection"%>
<%@page import="bank.JDBC_Connect"%>
<%@page import="bank.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/png" href="image/favicon.png" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<div class="row">
		<jsp:include page="header.jsp" />
	</div>
	<%! AccountModel ac; %>

	<%
		ac = (AccountModel) session.getAttribute("userDetails");
		String account_no = ac.getAccount_no();
		JDBC_Connect connect = new JDBC_Connect();
		Connection conn = connect.getConnection();
		DatabaseOperations operations = new DatabaseOperations();
		ac = operations.getAccountDetails(conn,account_no);
	%>
	<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="alert alert-success col-md-4 col-md-offset-4"
				role="alert">
				<h4 class="alert-heading">Success!</h4>
				<p>
					<strong>Your Withdraw operation is complete.</strong>
				</p>
				<p class="mb-0">
					<b>Account Number: </b>
					<%=ac.getAccount_no()%>
				</p>
				<p class="mb-0">
					<b>Amount: </b>
					<%=ac.getAmount()%>
				</p>
			</div>
		</div>
		<!-- Footer start here -->
		<div class="row" style="margin-top: 50px;">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>