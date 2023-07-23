import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import Connection.Conn;
import java.sql.*;
public class RegisterEmp extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)  throws ServletException,IOException
	{
		response.setContentType("text/html");//setting the content type

		//RegisterEmp?name=&contact=&add=&email=
		//&username=&password=&password2=&type=employer
		    PrintWriter out = response.getWriter();
        Connection con=Conn.getCon();
        String query = "insert into employer(ename,username,password,address,contact,email) values(?,?,?,?,?,?)";
				String res="insert into resource(rname,username,password,raddress,rcontact,email) values(?,?,?,?,?,?)";
        String name=request.getParameter("name");
        String uid= request.getParameter("username");
        String password= request.getParameter("password");
        String address= request.getParameter("add");
        String contact = request.getParameter("contact");
				String type=request.getParameter("type");
				String email=request.getParameter("email");
        PreparedStatement ps;
				try
        {
          if(type.equals("resource"))
					{
						ps = con.prepareStatement(res);
          }
					else
					{
						ps = con.prepareStatement(query);
					}
					ps.setString(1,name);
          ps.setString(2,uid);
          ps.setString(3,password);
          ps.setString(4,address);
          ps.setString(5,contact);
					ps.setString(6,email);
          ps.executeUpdate();
          con.close();

          out.println("<html>");
          out.println("<head>");
          out.println("<title> Congratulations!!</title>");
          out.println("</head>");
          out.println("<body>");
          out.println("<p style=\"font-family:calibri font-size:30\">");
          out.println("<center><h1>Congratulations!!!<br><center><br><br>");
          out.println("You have successfully registered yourself.<br>Now get started!!</h1><br><br>");
          out.println("<a href=\"index.html\">Go to Home</a><br><br>");
					out.println("<a href=\"login.html\">Go to Login</a>");
					out.println("</body></html>");

        }
        catch (SQLException ex)
        {
            ex.printStackTrace(out);
        }
	}
}
