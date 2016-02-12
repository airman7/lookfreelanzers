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
public class SearchResult extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

        //set the content type
        response.setContentType("text/html");
        //outputstream
        PrintWriter out = response.getWriter();

        out.println("<html><head>");
        out.println("<title>Search results</title>");
        out.println("</head><body>");

        Connection con = Conn.getCon();
        String query1 = "select * from resource where name=?";
        String query2 = "select * from resource where field=?";
        ResultSet rs;
        PreparedStatement ps;
        try{
            String search=request.getParameter("search");
            String where=request.getParameter("searchin");
            if(where.equals("job"))
                ps = con.prepareStatement(query1);
            else
                ps=con.prepareStatement(query2);
            ps.setString(1,search);
            rs=ps.executeQuery();
            if(rs.next())
            {
                out.println("");
            }
            else
            {
                out.println("<h4>no result matches your search</h4>");
            }
        }catch(Exception e)
        {
            out.println("Error fetching data. Please try again");
        }
        out.println("</body></html>");
    }
}
