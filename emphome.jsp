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
      <link type="text/css" href="css/st.css" rel='stylesheet'>
      <title>Employer Home</title>
      <script type="text/javascript" src="js/ajax.js"></script>
    </head>
    <body>
      <div class='searchbar'>
          <img class='logo' src='images/logo.jpg'>
            <input class='input1' id="search" type="text" name="search">
            <select class='input2' name="searchin" id="searchin">
              <option value="groot">groot</option>
            </select>
            <img id='search2' src='search.jpg'>
            <img src='images/pic' id="profile.JPG">
          <img src='images/menu.png' id="menuButton">
        <label id='name'> </label>
      </div><br>
      <div id='leftMenu'>
        <div class='content'>
          <a class='button' type="button" id="menu_button">Posts</a><br><br>
          <ul type="none" class='menu' id="menu">
              <li class="submenu" id="post">Post New Ad</li>
              <li class="submenu" id="viewad"  onclick="main()">View Ads</li>
          </ul>
          <a class='button' type="button" id="menu_button2">Change Details</a><br><br>
          <ul type="none" id="menu2" class='menu'>
              <li class="submenu" id="personal">Personal</li>
              <li class="submenu" id="work">Work</li>
          </ul>
          <a class='button' type="button" id="menu_button3">View profile</a><br><br>
          <ul type="none" id="menu3" class='menu'>
              <li class="submenu"><a>Resource</a></li>
              <li class="submenu"><a>Employer</a></li>
          </ul>
          <a class='button' type="button" href='index.html' id="menu_button5">About Us</a><br><br>
          <a class='button' type="button" href='index.html' id="menu_button6">Feedback</a><br><br>
          <a class='button' type="button" href='index.html' id="menu_button7">Home</a><br><br>
        </div>
      </div>

      <div class='container2'>
        <span id="personalform">
            <form style="font-family:'monotype corosiva';font-size:100%;" method='post'><br>
              <label>Employer/company Name</label><input  required type='text' name='name' maxlength="50" size="30" placeholder="enter your name"><br><br>
              <label>Contact Number</label><input type='text' name="contact" maxlength="12" required	size="30"><br><br>
              <label>Address</label><input type='text' name="add" maxlength="100" required	size="30"		 ><br><br>
              <label>Email Address</label><input  required type="email" name='email' maxlength="50" size="30"  required placeholder="username@example.com"><br><br>
              <label>Description</label><input  type='text' name='description' maxlength="50" size="30" placeholder="Describe your institute"><br><br>
                        <br><br>  <input class='submit' value="Submit" type="submit" class="button">
            </form>
          </span>

      <span  id="postad">
        <h1>Post New Add</h1>
       <form style="font-family:Berlin Sans FB;font-size:100%;" method="get" action="postAd" >
         <br><label>Name</label><input required type="text" name="name1"><br><br>
       <label>  Work field </label><select name="field">
         <%
           for(int i=0;i<count;i++)
           {
         %>
         <option value="<%= id[i] %>"><%= field[i] %></option>
         <%
           }
         %>
       </select><br><br>
       <label>StartDate(unnecessary:/)</label> <input required type="date" name="startdate"><br><br>
       <label>To be Submitted by</label> <input type="date" /><br><br>
       <label>Description</label> <textarea  clrequired size="2000" name="desc" type="text"></textarea><br><br><br><br><br>
         <input class='submit' type="submit" value="Submit">
       </form>
     </span>

     <div id='viewads'>
     </div>
   </div>

      <div id='rightmenu'>
        <ul type='none'>
            <li class="submenu2"><a>Logout</a></li>
            <li class="submenu2"><a>Home</a></li>
            <li class='submenu2'><a>View profile</a><li>
        </ul>
      </div>

      <script type="text/javascript" src="js/jquery.js"></script>
      <script type="text/javascript" src="js/j.js"></script>
          </body>
      </html>
    <!--
    Search can be done in 3 ways:
    1. just give a search field and then write backend to check
    all  the resources and job category for matches
    2.provide two search fields: one to search by name
    one to search by job(drop down for job)eesy peesy
    3.provide 2 non mandatory fields, one specifying job type
    and other for name
      <form action="main()" method="get">
        <input id="search" type="text" name="search"><br>
        <select name="searchin" id="searchin">
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
      <div id="searchresults">
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
      </pre><br><br>
      <a href="ShowMyAds">View your ads</a>
      -->
