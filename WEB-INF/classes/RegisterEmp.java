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

		//RegisterEmp?name=&email=&description=&username=&password=&password2=
        PrintWriter out = response.getWriter();
        Connection con=Conn.getCon();
        String query = "insert into employer(ename,username,password,address,contact,email,description) values(?,?,?,?,?,?,?)";

        String ename=request.getParameter("name");
        String uid= request.getParameter("username");
        String password= request.getParameter("password");
        String address= request.getParameter("add");
        String contact = request.getParameter("contact");
		String description=request.getParameter("description");
		String email=request.getParameter("email");
        if(uid!=null)
        {
        try
        {
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1,ename);
                    ps.setString(2,uid);
                    ps.setString(3,password);
                    ps.setString(4,address);
                    ps.setString(5,contact);
					ps.setString(6,email);
					ps.setString(7,description);
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
					out.println("<a href=\"Login.html\">Go to Login</a>");

                    /*
					HttpSession ses=request.getSession();
                    ses.setAttribute("user",uname);
                    ses.setAttribute("userid",uid);
                    ses.setAttribute("institute",institute);
                    out.println("<a href=\"enterdetails.jsp\" class=\"button\">CONTINUE</a></pre>");
                    */

					out.println("</body></html>");

                }
                catch (SQLException ex)
                {
                    out.println("ERROR");
                }
        }
	}
}
