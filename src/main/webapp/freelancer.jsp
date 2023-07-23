<%@page import="Connection.Conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

String name="";
String address="";
String place="";
String jobcategory="";
String contact="";
String email="";
String birthday="";
try{
	String query="select * from resource where rid=?";
	Connection con = Conn.getCon();
	String s=request.getParameter("id");
	PreparedStatement ps = con.prepareStatement(query);
	int i=Integer.parseInt(s);
	ps.setInt(1,i);
	ResultSet rs = ps.executeQuery();
	rs.next();
	name=rs.getString("rname");
	 address=rs.getString("raddress");
	 place=rs.getString("city");
	 jobcategory=rs.getString("work field");
	 contact=rs.getString("rcontact");
	 email=rs.getString("email");
	 birthday=rs.getString("DOB");

}
catch(Exception e)
{
	out.println(e);
}
%>

<!doctype html>
<html>
<head>
<title>Profile Page</title>
<link rel="stylesheet" type="text/css" href="css/pro.css">
<title>Homepage</title>
</head>
<body>
	<center>
		<fieldset
			style="width: 60%; display: inline-block; float: center; align-items: stretch;">
			<div style='width: 100%;'>
				<table style='display: inline-block;'>
					<tr>
						<td>Name:</td>
						<td><%= name %></td>
					</tr>
					<tr>
						<td>Adress:</td>
						<td><%=address%></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<td>Place:</td>
					<td><%=place%></td>
					</tr>
				</table>
				<table style='display: inline-block; float: right;'>
					<tr>
						<td>Contact Number:</td>
						<td><%=contact%></td>
					</tr>
					<tr>
						<td>Email Id:</td>
						<td><%=email%></td>
					</tr>
					<tr>
						<td>DOB:</td>
						<td><%=birthday%></td>
					</tr>
				</table>
			</div>

			<hr>
			<divstyle:"text-align:left;">
	  <div>
	  Skillset<hr>
	  <ul><li><li><li></ul>
	  <br><br>
	</div>
	<div>
	  Work experience <hr><hr><br>
	    <div>Project<hr>
	    <table style='width:80%;'>
	    <tr><td>SNo.</td><td>Title</td><td>technologies used</td><td>description</td><tr></table></div><br><br>
	    <div>Job<hr>  <table style='width:80%;'><tr><td>Sno.</td><td>Company Name</td><td>Work Field</td><td>Joining Year</td><td>Description</td></tr></table><br><br></div>
	    <div>Internship<hr>
	    <table style='width:80%;'><tr><td>Sno.</td><td>Company Name</td><td>Completion Year</td><td>Description</td></tr></table><br><br></div>
	    <div>Training<hr>
	      <table style='width:80%;'><tr><td>Sno.</td><td>Company Name</td><td>Completion Year</td><td>Technologies trained in </td></tr></table><br><br></div>
	</div>

	<div>
	  Certifications<hr>
	  <table style='width:80%;'><tr><td>Sno.</td><td>Field of certification</td><td>Certified By</td><td>Certified On</td></tr></table><br><br></div>
	</div>

	  </fieldset>
	</center>

</body>
</html>
