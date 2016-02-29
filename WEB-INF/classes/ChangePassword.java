import Connection.Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangePassword extends HttpServlet
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession ses=request.getSession();
        String e=(String)ses.getAttribute("eid");
        String r=(String)ses.getAttribute("rid");
        PreparedStatement ps;

        Connection con=Conn.getCon();
        String query = "update employer set password=? where password=? and eid=?";
        String query2 = "update resource set password=? where password=? and rid=?";
        int id;

      try
        {
          if(e!=null)
          {
            ps=con.prepareStatement(query);
            id=Integer.parseInt(e);
          }
          else
          {
            ps=con.prepareStatement(query2);
            id=Integer.parseInt(r);
          }

            ps.setString(1,request.getParameter("newpassword"));
            ps.setString(2,request.getParameter("oldpassword"));
            ps.setInt(3,id);
            ps.executeUpdate();
            con.close();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title> Congratulations!!</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p style=\"font-family:calibri font-size:30\">");
            out.println("<center><h1>Congratulations!!!<br><center><br><br>");
            out.println("You have successfully changed your password!!</h1><br><br>");
            if(e!=null)
              out.println("<a href=\"emphome.jsp\" class=\"button\">CONTINUE</a></pre>");
            else
              out.println("<a href=\"workerhome.jsp\" class=\"button\">CONTINUE</a></pre>");
            out.println("</body>");
            out.println("</html>");
        }
        catch(SQLException ex)
        {
            ex.printStackTrace(out);
        }


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo()
    {
        return "Short description";
    }
}
