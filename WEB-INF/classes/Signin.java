import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import Connection.Conn;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.io.PrintWriter;
public class Signin extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{

        //setting the content type of response
        res.setContentType("text/html");

        //outputstream
        PrintWriter out =res.getWriter();

        Connection con=Conn.getCon();
        HttpSession ses=req.getSession();
        String query="select ename,eid from employer where username=? and password=?";
        String query2="select rname,rid from resource where username=? and password=?";
        ResultSet rs;
        PreparedStatement pres;
        //SigninEmp?uname=&pass=&type=Employer
        //SigninEmp?uname=&pass=&type=Resource

        out.println("<html><body>");
        try{
            String usertype=req.getParameter("type");
            if(usertype.equals("employer"))
              pres=con.prepareStatement(query);
            else
              pres=con.prepareStatement(query2);

            pres.setString(1,req.getParameter("uname"));
            pres.setString(2,req.getParameter("pass"));
            rs=pres.executeQuery();
            if(rs.next())
            {
              if(usertype.equals("employer"))
              {
                ses.setAttribute("ename",rs.getString("ename"));
                ses.setAttribute("eid",rs.getString("eid"));
                res.sendRedirect("emphome.jsp");
              }
              else
              {
                ses.setAttribute("rname",rs.getString("rname"));
                ses.setAttribute("rid",rs.getString("rid"));
                res.sendRedirect("workerhome.jsp");
              }
            }
            else
            {
                out.println("<h3> Please check username and password.</h3>");
                out.println("<a href=\"Login.html\">Login</a>");
            }
            con.close();
        }
        catch(Exception e)
        {
            out.println("<h3> Error. Try again later.</h3>");
            e.printStackTrace(out);
        }
        out.println("</body></html>");
    }
}
