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
<form method = "get" action = "generalSearch.jsp">
			<button type="submit" name="back"> Back</button>
	
			<input type="hidden" name="customerEmail" value=<%out.print(email);%>>
	</form>
<% email = request.getParameter("customerEmail");



String sortby = request.getParameter("sortby");


String str = "";



String general = request.getParameter("search general");
String filter = request.getParameter("search filter");



if (general != null){
	if (sortby == "sort price htl"){
		str = "select items.start_datetime, items.item_name, auctions.item_id, auctions.current_price, auctions.end_datetime, items.item_description, tags.tag_type, tags.tag_content, count(bids.email_bidder) as c from auctions, items, bids, tags where (items.item_name like \"%"+general+"%\" or items.item_description like \"%"+general+"%\" or tags.tag_type like \"%"+general+"%\" or tags.tag_content like \"%"+general+"%\") and auctions.item_id = items.item_id and auctions.item_id = bids.item_id and tags.item_id = auctions.item_id and sysdate() < auctions.end_datetime and sysdate() > items.start_datetime order by auctions.current_price desc;";
	}
	else if (sortby == "sort price lth"){
		str = "select items.start_datetime, items.item_name, auctions.item_id, auctions.current_price, auctions.end_datetime, items.item_description, tags.tag_type, tags.tag_content, count(bids.email_bidder) as c from auctions, items, bids, tags where (items.item_name like \"%"+general+"%\" or items.item_description like \"%"+general+"%\" or tags.tag_type like \"%"+general+"%\" or tags.tag_content like \"%"+general+"%\") and auctions.item_id = items.item_id and auctions.item_id = bids.item_id and tags.item_id = auctions.item_id and sysdate() < auctions.end_datetime and sysdate() > items.start_datetime order by auctions.current_price asc;";
	}
	else if (sortby == "sort by popularity"){
		str = "select items.start_datetime, items.item_name, auctions.item_id, auctions.current_price, auctions.end_datetime, items.item_description, tags.tag_type, tags.tag_content, count(bids.email_bidder) as c from auctions, items, bids, tags where (items.item_name like \"%"+general+"%\" or items.item_description like \"%"+general+"%\" or tags.tag_type like \"%"+general+"%\" or tags.tag_content like \"%"+general+"%\") and auctions.item_id = items.item_id and auctions.item_id = bids.item_id and tags.item_id = auctions.item_id and sysdate() < auctions.end_datetime and sysdate() > items.start_datetime order by c desc;";
	}
	else str = "select items.start_datetime, items.item_name, auctions.item_id, auctions.current_price, auctions.end_datetime, items.item_description, tags.tag_type, tags.tag_content, count(bids.email_bidder) as c from auctions, items, bids, tags where (items.item_name like \"%"+general+"%\" or items.item_description like \"%"+general+"%\" or tags.tag_type like \"%"+general+"%\" or tags.tag_content like \"%"+general+"%\") and auctions.item_id = items.item_id and auctions.item_id = bids.item_id and tags.item_id = auctions.item_id and sysdate() < auctions.end_datetime and sysdate() > items.start_datetime;";
}

else if (filter != null){
	if (sortby == "sort price htl"){
		str = "select items.start_datetime, items.item_name, auctions.item_id, auctions.current_price, auctions.end_datetime, items.item_description, tags.tag_type, tags.tag_content, count(bids.email_bidder) as c from auctions, items, bids, tags where (tags.tag_type like \"%"+filter+"%\" or tags.tag_content like \"%"+filter+"%\") and auctions.item_id = items.item_id and auctions.item_id = bids.item_id and tags.item_id = auctions.item_id and sysdate() < auctions.end_datetime and sysdate() > items.start_datetime order by auctions.current_price desc;";
	}
	else if (sortby == "sort price lth"){
		str = "select items.start_datetime, items.item_name, auctions.item_id, auctions.current_price, auctions.end_datetime, items.item_description, tags.tag_type, tags.tag_content, count(bids.email_bidder) as c from auctions, items, bids, tags where (tags.tag_type like \"%"+filter+"%\" or tags.tag_content like \"%"+filter+"%\") and auctions.item_id = items.item_id and auctions.item_id = bids.item_id and tags.item_id = auctions.item_id and sysdate() < auctions.end_datetime and sysdate() > items.start_datetime order by auctions.current_price asc;";
	}
	else if (sortby == "sort by popularity"){
		str = "select items.start_datetime, items.item_name, auctions.item_id, auctions.current_price, auctions.end_datetime, items.item_description, tags.tag_type, tags.tag_content, count(bids.email_bidder) as c from auctions, items, bids, tags where (tags.tag_type like \"%"+filter+"%\" or tags.tag_content like \"%"+filter+"%\") and auctions.item_id = items.item_id and auctions.item_id = bids.item_id and tags.item_id = auctions.item_id and sysdate() < auctions.end_datetime and sysdate() > items.start_datetime order by c desc;";
	}
	else str = "select items.start_datetime, items.item_name, auctions.item_id, auctions.current_price, auctions.end_datetime, items.item_description, tags.tag_type, tags.tag_content, count(bids.email_bidder) as c from auctions, items, bids, tags where (tags.tag_type like \"%"+filter+"%\" or tags.tag_content like \"%"+filter+"%\") and auctions.item_id = items.item_id and auctions.item_id = bids.item_id and tags.item_id = auctions.item_id and sysdate() < auctions.end_datetime and sysdate() > items.start_datetime;";
}

else str = "select items.start_datetime, items.item_name, auctions.item_id, auctions.current_price, auctions.end_datetime, count(bids.email_bidder) as c from auctions, items, bids where auctions.item_id = items.item_id and auctions.item_id = bids.item_id and sysdate() < auctions.end_datetime and sysdate() > items.start_datetime;";



ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();	
Statement stmt = con.createStatement();


ResultSet result = stmt.executeQuery(str);


%>

<form method = "get" action = "newFilters.jsp">
<input type = "submit" name = "sort price htl" value = "Sort By Price(High to Low)">
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

<form method = "get" action = "newFilters.jsp">
<input type = "submit" name = "sort price lth" value = "Sort by Price(Low to High)"> 
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

<form method = "get" action = "newFilters.jsp">
<input type = "submit" name = "sort by popularity" value = "Sort by Popuarity">
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


<br>
<% 


while (result.next()){
	
	if (result.getString("item_name") == null){
		%> 
		no such items found..
		<%
		break;
	}

 	out.println("Item Name: "+"'"+ result.getString("item_name")+"'" +" |");
	
	out.println("Current Price: "+"$"+result.getFloat("current_price")+" |");
	
	out.println("End Date of Auction: "+result.getString("end_datetime"));

	%>
	<form method = "get" action = "setBidFields.jsp">
	<input type = "button" value = "more info">
	<input type = "hidden" name = "customerEmail" value="<%out.print(email);%>">
	
	<input type = "hidden" name = "item_id" value = "<%out.print(result.getString("item_id")); %>">
	</form>
	
	<% 
}

%>

</body>
</html>