<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/png" href="image/favicon.png" />
<link rel="stylesheet" type="text/css" href="css/change_password.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="row">
		<jsp:include page="header.jsp" />
	</div>
	<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="col-md-4 col-md-offset-4">
				<form action="change_pwd.jsp" method="post">
					<h2>Change Password</h2>
					<div class="col-md-12">
						<hr class="colorgraph">
					</div>
					<label class="col-md-4 control-label">Current Password</label>
					<div class="col-sm-8 form-group">
						<input type="password" required
							placeholder="Enter Current Password.." class="form-control" name="current">
					</div>
					<label class="col-md-4 control-label">New Password</label>
					<div class="col-sm-8 form-group">
						<input type="password" required placeholder="Enter New Password.."
							class="form-control" id="new_password" name="new">
					</div>

					<label class="col-md-4 control-label">Re-Password</label>
					<div class="col-sm-8 form-group">
						<input type="password" required placeholder="Enter Re-Password.."
							class="form-control" id="re_password" name="confirm"
							onkeyup="checkPass(); return false;">
					</div>
					<p id="confirmMessage" class="text-center" style="margin-top: 10x;"></p>

					<div class="col-md-12">
						<hr class="colorgraph">
					</div>
					<div class="row col-md-10 col-md-offset-1">
						<div class="col-xs-6 col-md-6">
							<input type="submit" value="Submit"
								class="btn btn-success btn-block btn-md" tabindex="7">
						</div>
						<div class="col-xs-6 col-md-6">
							<input class="btn btn-danger btn-block btn-md" type="reset"
								value="Clear">
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- Footer start here -->
		<div class="row" style="margin-top: 50px;">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>