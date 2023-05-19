<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String email = ""; %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% email = request.getParameter("customerEmail");


String case1 = request.getParameter("sort price htl");
String case2 = request.getParameter("sort price lth");
String case3 = request.getParameter("sort by popularity");

String general = request.getParameter("search general");
String filter = request.getParameter("search filter");


%>
<form method = "get" action = "searchResults.jsp">
			<input type="submit" value="click to see new results">
			<% if (case1 == "Sort By Price(High to Low)"){
			%>
			<input type="hidden" name="sortby" value="<%out.print(case1);%>">
			<%  
			} %>
			<% if (case2 == "Sort by Price(Low to High)"){
			%>
			<input type="hidden" name="sortby" value="<%out.print(case2);%>">
			<%  
			} %>
			<% if (case3 == "Sort by Popuarity"){
			%>
			<input type="hidden" name="sortby" value="<%out.print(case3);%>">
			<%  
			} %>
			<input type="hidden" name="customerEmail" value="<%out.print(email);%>">
			<%
	if (general != null){
		%>
		<input type = "hidden" name = "search general" value = "<%out.print(general); %>">
		<%
	}
	if (filter != null){
		%>
		<input type = "hidden" name = "search filter" value = "<%out.print(filter); %>">
		<%
	}
	%>
	

	</form>
</body>
</html>