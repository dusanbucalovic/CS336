<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String email = ""; %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<% email = request.getParameter("customerEmail"); %>
<% out.println("Welcome to the flea market!! Try not to get scammed.."); 


%>

<form action="searchResults.jsp" method="get">
			General Search:
			<input type="text" name="search general">
			<input type="submit" value="Go!">
			<br>
			<br>
			</form>
<form action="searchResults.jsp" method="get">
			Filter By Tags Instead?
			<input type="text" name="search filter">
			<input type="submit" value="Next">
		
			<br>
			such as "blue", "used", "socks", etc.
			Note that "bl" can be used short for "blue", isn't that Great?!
			<input type="hidden" name="customerEmail" value="<%out.print(email);%>">
			
</form>

<form method = "get" action = "customerDashboard.jsp">
			<button type="submit" name="back"> Back</button>
	
			<input type="hidden" name="customerEmail" value="<%out.print(email);%>">
	</form>
</body>
</html>