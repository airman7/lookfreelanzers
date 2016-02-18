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

public class ShowMyAds extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

        //set the content type
        response.setContentType("text/html");
        //outputstream
        PrintWriter out = response.getWriter();

        out.println("<html><head>");
        out.println("<title>Search results</title>");
        out.println("</head><body>");

        Connection con = Conn.getCon();
        String get="select * from applied_ads where eid=?";
        String getr="select * from applied_ads where rid=?";
        //adid,eid,rid (take rid from session)
        ResultSet rs;
        PreparedStatement ps;

        try{
          HttpSession session=request.getSession();
          String id= (String) session.getAttribute("rid");
          if(id==null)
          {
            id= (String) session.getAttribute("eid");
            ps=con.prepareStatement(get);
          }
          else
          {
              ps=con.prepareStatement(getr);
          }

          ps.setInt(1,Integer.parseInt(id));
          rs=ps.executeQuery();
          while(rs.next())
          {
            out.print("<div>");
            out.print("<h3>Ad Number:"+rs.getString("adid")+"</h3>");
            out.print("<h3>Applicant id:"+rs.getString("rid")+"</h3>");
            //make sql query to count of appplicants..and also get ad info
            //and appplicant info from respective pages
            out.print("</div>");
          }
        }catch(Exception e)
        {
            out.println("<h3>Error fetching data. Please try again<h3>");
            e.printStackTrace(out);
        }
        out.println("<br><a href=\"emphome.jsp\">Go to Home</a>");
        out.println("</body></html>");
    }
}
