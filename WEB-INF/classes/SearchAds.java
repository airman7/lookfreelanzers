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
import java.sql.Statement;
import Connection.Conn;
public class SearchAds extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

        //set the content type
        response.setContentType("text/html");
        //outputstream
        PrintWriter out = response.getWriter();

        out.println("<html><head>");
        out.println("<title>Search results</title>");
        out.println("</head><body>");

        Connection con = Conn.getCon();
        String query1 = "select * from ad";
        String query2 = "select * from ad where field=?";
        ResultSet rs;
        PreparedStatement ps;
        Statement stmt;

        try{
            String where=request.getParameter("searchin");
            if(where.equals("0"))
            {
              stmt = con.createStatement();
              rs=stmt.executeQuery(query1);
            }
            else
            {
                ps=con.prepareStatement(query2);
                ps.setInt(1,Integer.parseInt(where));
                rs=ps.executeQuery();
            }
            if(rs.first())
            {
              do
              {
                  out.println("<br>Title:"+rs.getString("title")+"<br>");
                  out.println("<br>Deascription:"+rs.getString("description")+"<br>");
                  out.println("<form action=\"ApplyForAd\">");
                  out.println("<input type=\"hidden\" name=\"adid\" value=\""+rs.getString("adid")+"\" />");
                  out.println("<input type=\"submit\" value=\"Apply\">");
                  out.println("</form>");
              }while(rs.next());
            }
            else
            {
                out.println("<h4>no result matches your search</h4>");
            }
        }catch(Exception e)
        {
            e.printStackTrace(out);
          }
        out.println("</body></html>");
    }
}
