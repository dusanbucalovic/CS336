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
<%email = request.getParameter("customerEmail"); %>

<form method = "get" action = "customerDashboard.jsp">
			<button type="submit" name="back"> Back</button>
	
			<input type="hidden" name="customerEmail" value=<%out.print(email);%>>
	</form>
<% 
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();	
Statement stmt = con.createStatement();

String str = "select * from faqs";

ResultSet result = stmt.executeQuery(str);
int i = 1;
while (result.next()){
	%>
	<br>
	<%
	out.println("Question "+i+": "+ result.getString("questions"));
	%>
	<br>
	<% 
	out.println("Answer "+i+":"+result.getString("answers"));
	i++;
	%> 
	<br>
	<%
}
%>

<form method = "get" action = "viewFAQsorted.jsp">
<input type = "text" name = "key">
<input type = "submit">
<input type = "hidden" name = "customerEmail" value="<%out.print(email);%>">
</form>


</body>
</html>