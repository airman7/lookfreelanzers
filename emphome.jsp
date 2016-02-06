<%@page import="Connection.Conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <title>User Home</title>
    </head>
    <body>
        <input id="search" type="text" name="search"><br>
        <select name="searchin" >
            <option value="job">By Jobs</option>
            <option value="name">By Name</option>
        </select><br>
        <input type="button" onclick="SearchResult" value="submit">
    </body>
</html>
