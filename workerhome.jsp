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
<title>Resource Home</title>
<script type="text/javascript" src="js/ajax.js"></script>
</head>
<body>
	<div class='searchbar'>
		<img class='logo' src='images/logo.jpg'>

		<form action="SearchAds">
			<select class='input1' name="searchin" id="searchin">
				<%
  for(int i=0;i<count;i++)
  {
%>
				<option value="<%= id[i] %>"><%= field[i] %></option>
				<%
  }
%>
			</select> <input type="submit" value="search">
		</form>
		<img src='images/pic.png' id="profile"> <img
			src='images/menu.png' id="menuButton"> <label id='name'>
			<%= (String)session.getAttribute("rname")%></label>
	</div>
	<br>
	<div id='leftMenu'>
		<div class='content'>
			<a class='button' type="button" id="menu_button">Ads</a><br>
			<br>
			<ul type="none" class='menu' id="menu">
				<li class="submenu" id="searchad" onclick="">Search</li>
			</ul>
			<a class='button' type="button" id="menu_button2">Build Profile</a><br>
			<br>
			<ul type="none" id="menu2" class='menu'>
				<li class="submenu" id="personal">Personal</li>
				<li class="submenu" id="work">Work</li>
			</ul>

			<!--a class='button' type="button" href='index.html' id="menu_button5">About Us</a><br><br>
        <a class='button' type="button" href='index.html' id="menu_button6">Feedback</a><br><br>
        <a class='button' type="button" href='index.html' id="menu_button7">Home</a><br><br-->
		</div>
	</div>

	<div class='container2'>
		<span id="personalform">
			<h1>Update Your Details</h1>

			<div id="section">
				<p style="text-align: justify">Provide additional information to
					enhance your profile.Thus, improving the search results and
					increasing your visibility to the hirers.</p>
				<form method='get' action='changeDetails'>
					<br>
					<br> <label>Name </label><input required type="text"
						name="name" placeholder="your name" size="30"><br>
					<br> <label>Contact Number </label><input required type='text'
						name="contact" maxlength="12" required size="30"
						placeholder="your contact number"><br>
					<br> <label>Contact Number 2 </label><input type='text'
						name="contact" maxlength="12" size="30"
						placeholder="secondary contact number incase the first one becomes disfunctional "><br>
					<br> <label>Address </label><input type='text' name="add"
						maxlength="100" required size="30" placeholder="your address"><br>
					<br> <label>Permanent Address </label><input type='text'
						name="add" maxlength="100" size="30" placeholder="optional"><br>
					<br> <label>Email Address</label><input required type="text"
						name='email' maxlength="30" size="30" required
						placeholder="username@domain.com"> <br>
					<br> <label>Job Category</label> <select name="work fields"
						required width='30'>
						<option value="actor">Actor</option>
						<option value="carpenter">Carpenter</option>
						<option value="other">Other</option>
					</select><br>
					<br> <label>Place</label> <select name="place" required
						width='30'>
						<option value="Mumbai">Mumbai</option>
						<option value="Indore">Indore</option>
						<option value="other">Other</option>
					</select><br>
					<br> <label>State</label> <select name="state" width='30'>
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
						<option value="Jammu and Kashmir">Jammu and Kashmir
							</opiton>
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
						<option value="Dadar and Nagar Haveli">Dadar and Nagar
							Haveli</option>
						<option value="Daman and Diu">Daman and Diu</option>
						<option value="Lakshadeep">Lakshadeep</option>
						<option value="Pondicherry">Pondicherry</option>
					</select><br>
					<br> <label>Date of Birth </label> <input type="date"
						name="birthday"> <br>
					<br> <label>Marital Status </label><br> <input
						type="radio" name="marital" value="single">Single<br>
					<input type="radio" name="marital" value="married">Married<br>
					<input type="radio" name="marital" value="divorced">Divorced<br>
					<br> <input type="submit" value="Update" class='submit'>
				</form>
			</div>
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


		<div id='viewads'>
			<div class='ad'>
				<div class='SName'>Rajesh</div>
				<div class='SName'>Web Designer</div>
				<hr>
				<div class='details'>
					<div class='item'>
						<div class='left'>+91-9833355556 raj@gmail.com Indore</div>
						<div class='right'>Works at:PERL solutions, Indore</div>
					</div>
				</div>
			</div>
		</div>


		<span id="workform">
			<h1>
				Fill The Work Details<br>
				<br>
			</h1>
			<div>
				<form>
					<input type="radio" id='skillset' name="entry" value="skillSet">
					Skills <br>
					<br> <input type="radio" id='experience' name="entry"
						value="experience">Experience<br>
					<br> <input type="radio" id='certificate' name="entry"
						value="certificates">Your certifications<br>
					<br>
				</form>
			</div> <!-- margin-left: 2px;
            margin-right: 2px;
            padding-top: 0.35em;
            padding-bottom: 0.625em;
            padding-left: 0.75em;
            padding-right: 0.75em;
        Ye field ki default css hai change the desired option to achieve the required identation on the page-->
			<div id='skillform'>
				<form action="AddSkill" method="get">
					<fieldset style="margin-right: 800px">
						<legend>Add Skills </legend>
						<input type='text' name='skills' required /><br>
						<br> <input type='submit' value='ADD' />
					</fieldset>
				</form>
			</div>
			<div style="" id='expform'>
				<form action="AddExperience" method="get">

					<fieldset>
						<legend>Experience</legend>
						<br>
						<br>
						<!--input type="radio" id='cb1'name="project" value="projects"-->
						Projects</input> <br> <br>
						<form id="project">

							<table border="0" style="width: 80%; text-align: center">
								<tr>
									<td><input type="text" name="name1"
										placeholder="project name"></td>
									<td><input type="text" name="TechUsed"
										placeholder="Technologies used"></td>
									<td><input type="text" name="kabkiya"
										placeholder="year of project completion"></td>
									<td><input type='button' name='' value='ADD'></td>
								</tr>
							</table>
						</form>
						<br>
						<br>
						<!--input type="radio" id='cb2'name="intern" value="intern"-->
						Intern <br>
						<form id='intern'>
							<br>
							<table border="0" style="width: 80%; text-align: center">
								<tr>
									<td><input type="text" name="name2"
										placeholder="Company name"></td>
									<td><input type="text" name="kabkiya"
										placeholder="completion year"></td>
									<td><textarea cols="80" rows="1" required
											placeholder="brief description of the skills learned"></textarea></td>
									<td><input type='button' name='' value='ADD'></td>
								</tr>
								</form>
							</table>
							<br>
							<br>
							<!--input type="radio"  id='cb3' name="training" value="training"-->
							Training <br>
							<form id='training'>
								<br>
								<table border="0" style="width: 80%; text-align: center">
									<tr>
										<td><input type="text" name="name3"
											placeholder="Company name"></td>
										<td><input type="text" name="kabkiya"
											placeholder="completion year"></td>
										<td><textarea cols="80" rows="1" required
												placeholder="Technologies trained in"></textarea></td>
										<td><input type='button' name='' value='ADD'></td>
										</form>
									</tr>
								</table>
								<br>
								<br>
								<!--input type="radio" id='cb4' name="job" value="job"-->
								Job
								<form id='job'>
									<br>
									<table border="0" style="width: 80%; text-align: center">

										<tr>
											<td height="100"><input type="text" name="name4"
												placeholder="Company name"></td>
											<td height="100"><input type="text" name="work filed"
												placeholder="mention your work field"></td>
											<td><input type="text" name="kabsejoinkiya"
												placeholder="year of joining company"></td>
										</tr>
										<tr>

											<td><input type="radio" name="status" value="present">Still
												working there</br> <input type="radio" name="status" value="past">Switched
												Job</td>
											<td><textarea cols="80" rows="1" required
													placeholder="brief account of your work in the job specified"></textarea></td>
											<td><input type='button' name='' value='ADD'></td>
										</tr>

									</table>
								</form>
								<br>
								<br>
					</fieldset>
				</form>
			</div>
			<div id='certform'>
				<form action="AddCertificate" method="get">
					<fieldset>
						<legend>Certifications</legend>
						<br>
						<br>
						<table border="0" style="width: 100%; text-align: center">
							<tr>
								<!--this should be auto incremented on pressing enter by the user-->
								<td><input type="text" name="certiname"
									placeholder="Field of Certification"></td>
								<td><input type="text" name="certifiedby"
									placeholder="Certified by"></td>
								<td><input type='submit' name='' value='ADD'></td>
							</tr>
						</table>
				</form>
				</fieldset>
				</form>
			</div>
		</span>


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
	<div>
		Fill The Work Details<br>
		<br>
	</div>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/j.js"></script>
</body>
</html>
