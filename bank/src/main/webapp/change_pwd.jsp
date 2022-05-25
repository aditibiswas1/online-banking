<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
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
String currentPassword=request.getParameter("current");
String Newpass=request.getParameter("new");
String conpass=request.getParameter("confirm");
String connurl = "jdbc:oracle:thin:@localhost:1521:XE";
Connection con=null;
String pass="";
String id="";
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection(connurl, "SYSTEM", "1234");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from bank where password='"+currentPassword+"'");
while(rs.next()){
id=rs.getString(1);
pass=rs.getString(9);
}
System.out.println(id+ " "+pass);
if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update bank set password='"+Newpass+"' where id='"+id+"'");

%>
<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="alert alert-success col-md-4 col-md-offset-4" role="alert">
				<h4 class="alert-heading">Success!</h4>
				<p>
					<strong>Your password has been changed successfully.</strong>
				</p>

			</div>
		</div>

<% 
st1.close();
con.close();
}

else{%>
<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="alert alert-success col-md-4 col-md-offset-4" role="alert">
<p>
					<strong>Your password couldn't be changed.</strong>
				</p>
</div>
</div>
<% }
}
catch(Exception e){
out.println(e);
}
%>

<div class="row" style="margin-top: 50px;">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>