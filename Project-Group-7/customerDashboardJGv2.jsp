<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String email = ""; %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Dashboard</title>
</head>

<body>
Hello customer:
<%
email = request.getParameter("customerEmail");
String customerName = "";
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String getName = "SELECT customer_name FROM customers WHERE customer_email = '" + email + "'"; 
		PreparedStatement ps = con.prepareStatement(getName);
		ResultSet result = ps.executeQuery(getName);
		result.first();
		customerName = result.getString(1);
	
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
	}

out.print(customerName); %>
	<form method="get" action="HelloWorld.jsp">
			<button type="submit" name="logout"> Logout</button>
	</form>
	<form method="get" action="setAuctionFields.jsp">
			<button type="submit" name="offer item"> Offer Item for Auction</button>
			<input type="hidden" name="customerEmail" value=<%out.print(email);%>> 
	</form>
	<form method="get" action="generalSearch.jsp">
			<button type="submit" name="search"> Search Market</button>
			<input type="hidden" name="customerEmail" value=<%out.print(email);%>> 
	</form>
	<form method="get" action="deleteMyCustomerAccount.jsp">
			<button type="submit" name="deleteMyAccount"> Delete My Account</button>
			<input type="hidden" name="customerEmail" value=<%out.print(email);%>>  
	</form>
	<form method="get" action="setAlertsForTags.jsp">
			<button type="submit" name="view item alerts"> View Item Alerts</button>
			<input type="hidden" name="customerEmail" value=<%out.print(email);%>>  
	</form>
	<form method="get" action="viewItemAlerts.jsp">
			<button type="submit" name="set alerts for tags"> Set Alerts for Tags</button>
			<input type="hidden" name="customerEmail" value=<%out.print(email);%>>  
	</form>
</body>
</html>