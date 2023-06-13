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


                 <div id="section">
                 <p style="text-align:justify">Please ensure that the details you submitted while signing up were correct and also provide additional information to enhance your profile.Thus, improving the search results and increasing your visibility to the hirers.</p>
                 <form method ='get' action='changeDetails'><br><br>
                   <label>Name </label>*<input required type="text" name="name" placeholder="your name"><br><br>
                   <label>Contact Number </label>*<input required type='text' name="contact" maxlength="12" required size="30" placeholder="your contact number"><br><br>
                   <label>Contact Number 2 </label><input type='text' name="contact" maxlength="12"  size="30" placeholder="secondary contact number incase the first one becomes disfunctional "><br><br>
                   <label>Address </label>*<input type='text' name="add" maxlength="100" required size="30" placeholder="your address"><br><br>
                   <label>Permanent Address </label><input type='text' name="add" maxlength="100" size="30" placeholder="optional"><br><br>
                   <label>Email Address *</label><br><br><input  required type="text" name='email' maxlength="50" size="30"  required placeholder="username@domain.com">
                 <br><br>
                   <label>Job Category *</label>
                   <select name="work fields" required>
                     <option value="actor">Actor</option>
                     <option value="carpenter">Carpenter</option>
                     <option value="other">Other</option>
                    </select><br><br>
                  <label>Place *</label>
                 <select name="place" required>
                     <option value="Mumbai">Mumbai</option>
                     <option value="Indore">Indore</option>
                     <option value="other">Other</option>
                 </select><br><br>
                 <label>State</label>
                 <select name="state">
                 	<option value="Andhra Pradesh">Andhra Pradesh</option>
                 	<option value="Arunachal Pradesh">Arunachal Pradesh</option>
                 	<option value="Assam">Assam</option>
                 	<option value="Bihar">Bihar</option>
                 	<option value="Chhattisgarh">Chhattisgarh</option>
                 	<option value="Delhi">Delhi</option>
                 	<option value="Goa">Goa</option>
                 	<option value="Gujarat">Gujarat</option>
                 	<option value="Haryana">Haryana</option>
                 	<option value="Himachal Pradesh">Himachal Pradesh</option>
                 	<option value="Jammu and Kashmir">Jammu and Kashmir</opiton>
                 	<option value="Jharkhand">Jharkhand</option>
                 	<option value="Karnataka">Karnataka</option>
                 	<option value="Kerala">Kerala</option>
                 	<option value="Madhya Pradesh">Madhya Pradesh</option>
                 	<option value="Maharashtra">Maharashtra</option>
                 	<option value="Manipur">Maharashtra</option>
                 	<option value="Meghalaya">Meghalaya</option>
                 	<option value="Mizoram">Mizoram</option>
                 	<option value="Nagaland">Nagaland</option>
                 	<option value="Orissa">Orissa</option>
                 	<option value="Punjab">Punjab</option>
                 	<option value="Rajasthan">Rajasthan</option>
                 	<option value="Sikkim">Sikkim</option>
                 	<option value="Tamil Nadu">Tamil Nadu</option>
                 	<option value="Tripura">Tripura</option>
                 	<option value="Uttaranchal">Uttaranchal</option>
                 	<option value="Uttar Pradesh">Uttar Pradesh</option>
                 	<option value="West Bengal">West Bengal</option>
                 	<option value="Andaman and Nicobar">Andam,an and Nicobar</option>
                 	<option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                 	<option value="Daman and Diu">Daman and Diu</option>
                 	<option value="Lakshadeep">Lakshadeep</option>
                 	<option value="Pondicherry">Pondicherry</option>
                 </select><br><br>
                 <label>Date of Birth </label>
                 <input type="date" name="birthday">
                 <br><br>
                 <label>Marital Status </label><br>
                 <input type="radio" name="marital" value="single" >Single<br>
                 <input type="radio" name="marital" value="married">Married<br>
                 <input type="radio" name="marital" value="divorced">Divorced<br><br>
                 <input type="submit" value="Update">
                 </form>
                </div>

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
