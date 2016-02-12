<%@page import="Connection.Conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String query = "select * from `work fields`";
  Connection con=Conn.getCon();
  Statement stmt;
  int count = 0;
  ResultSet rs;

  /*
  try{
      stmt=con.createStatement();
      rs= stmt.executeQuery(query);
      while (rs.next())
        ++count;
    }catch (Exception e)
    {
        out.println(e);
    }
  */
%>
<!doctype html>
<html>
    <head>
        <title>Resource Home</title>
    </head>
    <body>
      <form action="SearchAds" method="get">
      <input id="search" type="text" name="search"><br>
      <select name="searchin" >
          <option value="field">By your field</option>
          <option value="all">all ads</option>
      </select><br>
      <input type="submit" value="submit">
      </form>
    </body>
</html>
