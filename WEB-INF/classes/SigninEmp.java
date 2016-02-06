import javax.servlet.ServletException;
//import java.servlet.*;
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
public class SigninEmp extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{

        //setting the content type of response
        res.setContentType("text/html");

        //outputstream
        PrintWriter out =res.getWriter();

        Connection con=Conn.getCon();
        HttpSession ses=req.getSession();
        String query="select ename from employer where username=? and password=?";
        ResultSet rs;

        out.println("<html><body>");
        try{
                PreparedStatement pres=con.prepareStatement(query);
                pres.setString(1,req.getParameter("uname"));
                pres.setString(2,req.getParameter("pass"));
                rs=pres.executeQuery();
                if(rs.next())
                {
                    String name =rs.getString("ename");
                    ses.setAttribute("ename",name);
                    res.sendRedirect("emphome.html");
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
        }
        out.println("</body></html>");
    }
}
