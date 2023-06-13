import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Connection.Conn;
import javax.servlet.http.HttpSession;

public class ApplyForAd extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

        //set the content type
        response.setContentType("text/html");
        //outputstream
        PrintWriter out = response.getWriter();

        out.println("<html><head>");
        out.println("<title>Apply for ad</title>");
        out.println("</head><body>");

        Connection con = Conn.getCon();
        String query ="insert into applied_ads values(?,?,?)";
        String get="select eid from ad where adid=?";
        //adid,eid,rid (take rid from session)
        ResultSet rs;
        PreparedStatement ps;

        try{
          int adid = Integer.parseInt(request.getParameter("adid"));
          ps=con.prepareStatement(get);
          ps.setInt(1,adid);
          rs=ps.executeQuery();
          rs.first();
          int eid = Integer.parseInt(rs.getString("eid"));
          HttpSession ses=request.getSession();

          int rid = Integer.parseInt((String) ses.getAttribute("rid"));

          ps=con.prepareStatement(query);
          ps.setInt(1,adid);
          ps.setInt(2,eid);
          ps.setInt(3,rid);
          int n = ps.executeUpdate();
          if(n==1)
          {
            out.println("<h3>Congrats, You have successfully applied for the ad</h3>");
          }
          else
          {
            out.println("<h3>Sorry, error while applying</h3>");
          }
        }catch(Exception e)
        {
            out.println("<h3>Error fetching data. Please try again<h3>");
            e.printStackTrace(out);
        }
        out.println("<br><a href=\"workerhome.jsp\">Go to Home</a>");
        out.println("</body></html>");
    }
}
