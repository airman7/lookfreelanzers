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
    <link type="text/css" href="css/st.css" rel='stylesheet'>
    <title>Resource Home</title>
    <script type="text/javascript" src="js/ajax.js"></script>
  </head>
  <body>
    <div class='searchbar'>
        <img class='logo' src='images/logo.jpg'>
        <input class='input1' id="search" type="text" name="search">
        <select class='input1' name="searchin" id="searchin">
            <option value="groot">groot</option>
        </select>
        <img id='search2' src='images/search.jpg'>
          <img src='images/pic.JPG' id="profile">
        <img src='images/menu.png' id="menuButton">
      <label id='name'> </label>
    </div><br>
    <div id='leftMenu'>
      <div class='content'>
        <a class='button' type="button" id="menu_button">Ads</a><br><br>
        <ul type="none" class='menu' id="menu">
            <li class="submenu" id="SearchAd">Search</li>
        </ul>
        <a class='button' type="button" id="menu_button2">Build Profile</a><br><br>
        <ul type="none" id="menu2" class='menu'>
            <li class="submenu" id="personal">Details</li>
            <li class="submenu" id="work">Work</li>
        </ul>
        <a class='button' type="button" id="menu_button3">View profile</a><br><br>
        <!--a class='button' type="button" href='index.html' id="menu_button5">About Us</a><br><br>
        <a class='button' type="button" href='index.html' id="menu_button6">Feedback</a><br><br>
        <a class='button' type="button" href='index.html' id="menu_button7">Home</a><br><br-->
      </div>
    </div>

    <div class='container2'>
      <span id="personalform">

        <form style="font-family:'monotype corosiva';font-size:100%;" method='post'><br>
            <label>City</label><input type='text' name="city" maxlength="12" 	size="30"><br><br>
            <label>Date of Birth</label><input type='date' name="add" maxlength="100" 	size="30"		 ><br><br>
            <br><br>  <input class='submit' value="Submit" type="submit" class="button">
        </form>
      </span>
      <span id="workform">
          <h1>Work Details</h1>
              <input type='radio'>Skillset<br><br>
              <input type='radio'>Certifications<br><br>
              <input type='radio'>Past Experience<br>
            <form id="skillset" style="font-family:'monotype corosiva';font-size:100%;" method='post'><br>
              <br><br>  <input class='submit' value="Submit" type="submit" class="button">
            </form><br>
            <form id="certification" style="font-family:'monotype corosiva';font-size:100%;" method='post'><br>
              <br><br>  <input class='submit' value="Submit" type="submit" class="button">
            </form><br>
            <form id="exp" style="font-family:'monotype corosiva';font-size:100%;" method='post'><br>
              <br><br>  <input class='submit' value="Submit" type="submit" class="button">
            </form>
          </span>
<!--ad template-->
      <div id='viewads'>
       <div id='ad'>
         <div id="adname" class='Name'>
           <hr>
         </div>
         <div class='details'>
          <div id="addesc" class='description'>

          </div><hr>
          <div class='item'>
           <div class='left'>
             left
           </div>
           <div class='right'>
             right
           </div>
         </div>
        </div>
       </div>
     </div>
     <!--ad template-->
        </div>
   <div id='rightmenu'>
     <ul type='none'>
         <li class="submenu2"><a>Logout</a></li>
         <li class="submenu2"><a>Home</a></li>
         <li class='submenu2'><a>View profile</a><li>
         <li class='submenu2'><a>Complaint</a><li>
     </ul>
   </div>

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/j.js"></script>
        </body>
      </html>
