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
  int id[]={};
  String field[]={};
  try{
      stmt=con.createStatement();
      rs= stmt.executeQuery(query);
      while (rs.next())
        ++count;
      id=new int[count];
      field= new String[count];
      rs.first();
      for(int i=0;i<count;i++)
      {
        id[i]=rs.getInt("id");
        field[i]=rs.getString("name");
        rs.next();
      }
    }catch (Exception e)
    {
        out.println(e);
    }

%>
<!doctype html>
<html>
    <head>
        <title>User Home</title>
    </head>
    <body>
      <form action="SearchResult" method="get">

    <!--
    Search can be done in 3 ways:
    1. just give a search field and then write backend to check
    all  the resources and job category for matches
    2.provide two search fields: one to search by name
    one to search by job(drop down for job)eesy peesy
    3.provide 2 non mandatory fields, one specifying job type
    and other for name
    -->
      <form>
        <input id="search" type="text" name="search"><br>
        <select name="searchin">
        <%
          for(int i=0;i<count;i++)
          {
        %>
        <option value="<%= field[i] %>"><%= field[i] %></option>
        <%
          }
        %>
        </select>
        <input type="submit" value="Submit">
      </form>
      <br><hr>
      <pre>
        <form method="get" action="postAd">
          Description <input required size="2000" name="desc" type="text">
          number of resource required <input required type="number" name="requirement">
          Work field <select name="field">
          <%
            for(int i=0;i<count;i++)
            {
          %>
          <option value="<%= id[i] %>"><%= field[i] %></option>
          <%
            }
          %>
          </select>
          <input type="submit" value="Submit">
        </form>
      </pre>
    </body>
</html>
