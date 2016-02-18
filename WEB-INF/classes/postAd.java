import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import Connection.Conn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;

public class postAd extends HttpServlet{
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

    //set the content type
    response.setContentType("text/html");
    //outputstream
    PrintWriter out = response.getWriter();

    out.println("<html><head>");
    out.println("<title>Search results</title>");
    out.println("</head><body>");

    Connection con = Conn.getCon();
    String query="insert into ad(eid,field,description,`resource required`) values(?,?,?,?)";
    ResultSet rs;
    PreparedStatement ps;
    //postAd?desc=justabook.net+internship&requirement=2&field=1

    try{

      HttpSession ses=request.getSession();
      ps=con.prepareStatement(query);
      ps.setInt(1,(int)ses.getAttribute("eid"));
      ps.setInt(2,Integer.parseInt(request.getParameter("field")));
      ps.setString(3,request.getParameter("desc"));
      ps.setInt(4,Integer.parseInt(request.getParameter("requirement")));
      ps.executeUpdate();
      out.println("<h3>congrats.ad posted</h3>");
    }catch(Exception e)
    {
        out.println("Error loading data. Please try again");
    }
    out.println("</body></html>");
  }
}
