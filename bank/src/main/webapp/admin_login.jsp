<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="bank.AccountModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main_css.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="row">
		<jsp:include page="header.jsp" />
	</div>
	<%
			AccountModel ac = null;
		
			ac = (AccountModel) session.getAttribute("userDetails");
			if (ac != null) {
				
		%>
<div class="row" style="margin-top: 150px;">
			<div class="alert alert-warning col-md-4 col-md-offset-4"
				role="alert">
				<strong>Warning!</strong> You have to logout first from <%= ac.getUsername()%>
			</div>
		</div>
		<%
			} else {
		%>
	<div class="container-fullwidth">
		<div class="container" style="margin-top:70px">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
				<form action="loan_request.jsp" method="post">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<strong>Admin Log In </strong>
							</h3>
						</div>

						<div class="panel-body">
							<form role="form">
							<div class="space" style="margin-top:20px"></div>
								<!-- <div class="alert alert-danger">Incorrect Username or
									Password!</div> -->
								<div style="margin-bottom: 12px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input
										id="login-username" type="text" class="form-control"
										name="username" value="" placeholder="Username">
								</div>

								<div style="margin-bottom: 12px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input
										id="login-password" type="password" class="form-control"
										name="password" placeholder="Password">
								</div>


								<input type="submit" value="Sign In" class="btn btn-success" />

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
<%} %>
		<!-- Footer start here -->
		<div class="row" style="margin-top: 50px;">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>