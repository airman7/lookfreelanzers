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
<script type="text/javascript" src="js/ajax.js"></script>
<title>Employer Home</title>

</head>
<body>
	<div class='searchbar'>
		<img class='logo' src='images/logo.jpg'> <input class='input1'
			id="search" type="text"> <select class='input1' id="searchin">
			<%
            for(int i=0;i<count;i++)
            {
          %>
			<option value="<%= field[i] %>"><%= field[i] %></option>
			<%
            }
          %>
		</select>
		<!--        <input id="search" type="text" name="search"><br>
            <select name="searchin" id="searchin">
    -->
		<img id='search2' src='images/search.jpg' onclick="ajaxsearch()">
		<img src='images/pic.png' id="profile"> <img
			src='images/menu.png' id="menuButton"> <label id='name'><%= (String)session.getAttribute("ename")%></label>
	</div>
	<br>
	<div id='leftMenu'>
		<div class='content'>
			<a class='button' type="button" id="menu_button">Ads</a><br>
			<br>
			<ul type="none" class='menu' id="menu">
				<li class="submenu" id="post">Post New Ad</li>
				<li class="submenu" id="viewad" onclick="main()">View Ads</li>
			</ul>
			<a class='button' type="button" id="menu_button2">Change</a><br>
			<br>
			<ul type="none" id="menu2" class='menu'>
				<li class="submenu" id="personal">Details</li>
			</ul>
			<!--a class='button' type="button" id="menu_button3">View profile</a><br><br>
          <a class='button' type="button" href='index.html' id="menu_button5">About Us</a><br><br>
          <a class='button' type="button" href='index.html' id="menu_button6">Feedback</a><br><br>
          <a class='button' type="button" href='index.html' id="menu_button7">Home</a><br><br-->
		</div>
	</div>


	<div class='container2'>

		<span id="personalform">
			<form style="font-family: 'monotype corosiva'; font-size: 100%;"
				method='post'>
				<br> <label>Employer/company Name</label><input required
					type='text' name='name' maxlength="50" size="30"
					placeholder="enter your name"><br>
				<br> <label>Contact Number</label><input type='text'
					name="contact" maxlength="12" required size="30"><br>
				<br> <label>Address</label><input type='text' name="add"
					maxlength="100" required size="30"><br>
				<br> <label>Email Address</label><input required type="email"
					name='email' maxlength="50" size="30" required
					placeholder="username@example.com"><br>
				<br> <label>Description</label><input type='text'
					name='description' maxlength="50" size="30"
					placeholder="Describe your institute"><br>
				<br> <br>
				<br> <input class='submit' value="Submit" type="submit"
					class="button">
			</form>
		</span> <span id="postad">
			<h1>Post New Ad</h1>
			<form method="post" action="postAd">
				<br>
				<br> <label>Title</label><input required type="text"
					name="title" /><br>
				<br> <label> Work field </label><select name="field"
					class='select1'>
					<%
               for(int i=0;i<count;i++)
               {
             %>
					<option value="<%= id[i] %>"><%= field[i] %></option>
					<%
               }
             %>
				</select><br>
				<br> <label>StartDate</label> <input type="date" name="sdate" /><br>
				<br> <label>End Date</label> <input type="date" name="edate" /><br>
				<br> <label>Description</label>
				<textarea required size="2000" name="desc" type="text"></textarea>
				<br>
				<br>
				<br> <input class='submit' type="submit" value="Submit" />
			</form>
		</span> <span id="changepassword">
			<h1>Change Password</h1>
			<form style="font-family: Berlin Sans FB; font-size: 100%;"
				method="post" action="ChangePassword">
				<br>
				<label>Old Password</label><input required type="password"
					name="oldpassword"><br>
				<br> <br>
				<label>New Password</label><input required type="password"
					name="newpassword"><br>
				<br> <br>
				<label>Confirm Password</label><input required type="password"
					name="newpassword2"><br>
				<br> <input class='submit' type="submit" value="Submit">
			</form>
		</span>


		<!--ad template-->
		<div id='viewads'>

			<div id='ad1' class='ad' onclick="people('1')">
				<div class='adtitle'>
					<div id='adid1' style="display: none"></div>
					<div id='adname1' class='Name'></div>
				</div>
				<hr>
				<div id='adfield1' class='workfield'>
					<hr>
				</div>
				<hr>
				<div class='details'>
					<div class='item'>
						<div id='startdate1' class='left'></div>
						<div id='enddate1' class='right'></div>
					</div>
					<hr>
					<div id='addescription1' class='description'></div>
					<div id='adapplied1' class='apply'></div>
				</div>
			</div>

			<div id='ad2' class='ad' onclick="people('2')">
				<div class='adtitle'>
					<div id='adid2' style="display: none"></div>
					<div id='adname2' class='Name'></div>
				</div>
				<hr>
				<div id='adfield2' class='workfield'></div>
				<hr>
				<div class='details'>
					<div class='item'>
						<div id='startdate2' class='left'></div>
						<div id='enddate2' class='right'></div>
					</div>
					<hr>
					<div id='addescription2' class='description'></div>
					<div id='adapplied2' class='apply'></div>
				</div>
			</div>
			<div id='ad3' class='ad' onclick="people('3')">
				<div class='adtitle'>
					<div id='adid3' style="display: none"></div>
					<div id='adname3' class='Name'></div>
				</div>
				<hr>
				<div id='adfield3' class='workfield'></div>
				<hr>
				<div class='details'>
					<div class='item'>
						<div id='startdate3' class='left'></div>
						<div id='enddate3' class='right'></div>
					</div>
					<hr>
					<div id='addescription3' class='description'></div>
					<div id='adapplied3' class='apply'></div>
				</div>
			</div>

			<div id='ad4' class='ad' onclick="people('4')">
				<div class='adtitle'>
					<div id='adid4' style="display: none"></div>
					<div id='adname4' class='Name'></div>
				</div>
				<hr>
				<div id='adfield4' class='Name'>
					<hr>
				</div>
				<hr>
				<div class='details'>
					<div class='item'>
						<div id='startdate4' class='left'></div>
						<div id='enddate4' class='right'></div>
					</div>
					<hr>
					<div id='addescription4' class='description'></div>
					<div id='adapplied4' class='apply'></div>
				</div>
			</div>

		</div>
		<!--ad template-->

		<div id='searchresult'>
			<div class='ad' id='sr1' onclick="gotoprofile('1')">
				<div id='srid1' style="display: none"></div>
				<div class='SName' id='srname1'></div>
				<div class='SName' id='srfield1'></div>
				<hr>
				<div class='details'>
					<div class='item'>
						<div class='left' id='srcontact1'></div>
						<div class='right' id='sremail1'></div>
					</div>
				</div>
			</div>

			<div class='ad' id='sr2' onclick="gotoprofile('2')">
				<div id='srid2' style="display: none"></div>
				<div class='SName' id='srname2'></div>
				<div class='SName' id='srfield2'></div>
				<hr>
				<div class='details'>
					<div class='item'>
						<div class='left' id='srcontact2'></div>
						<div class='right' id='sremail2'></div>
					</div>
				</div>
			</div>

			<div class='ad' id='sr3' onclick="gotoprofile('3')">
				<div id='srid3' style="display: none"></div>
				<div class='SName' id='srname3'></div>
				<div class='SName' id='srfield3'></div>
				<hr>
				<div class='details'>
					<div class='item'>
						<div class='left' id='srcontact3'></div>
						<div class='right' id='sremail3'></div>
					</div>
				</div>
			</div>

			<div class='ad' id='sr4' onclick="gotoprofile('4')">
				<div id='srid4' style="display: none"></div>
				<div class='SName' id='srname4'></div>
				<div class='SName' id='srfield4'></div>
				<hr>
				<div class='details'>
					<div class='item'>
						<div class='left' id='srcontact4'></div>
						<div class='right' id='sremail4'></div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div id='rightmenu'>
		<ul type='none'>
			<li class="submenu2"><a href="Logout">Logout</a></li>
			<li class="submenu2" onclick="hideall()"><a>Home</a></li>
			<li class='submenu2' id="ChangePassword"><a>Change Password
			</a>
			<li>
			<li class='submenu2'><a>Complaint</a>
			<li>
		</ul>
	</div>

	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/j.js"></script>
</body>
</html>
