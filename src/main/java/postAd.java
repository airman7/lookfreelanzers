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
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

    //set the content type
    response.setContentType("text/html");
    //outputstream
    PrintWriter out = response.getWriter();

    out.println("<html><head>");
    out.println("<title>Search results</title>");
    out.println("</head><body>");

    Connection con = Conn.getCon();
    //String query="insert into ad(eid,field,description,title,startdate,enddate) values(?,?,?,?,?,?)";
    String query="insert into ad(eid,field,description,title,startdate,enddate) values(?,?,?,?,?,?)";
    ResultSet rs;
    PreparedStatement ps;
    //postAd?desc=justabook.net+internship&requirement=2&field=1
    //postAd?title=&field=1&sdate=2016-12-06&edate=2016-12-06&desc=
    try{

      HttpSession ses=request.getSession();
      ps=con.prepareStatement(query);
      ps.setInt(1,Integer.parseInt((String)ses.getAttribute("eid")));
      ps.setInt(2,Integer.parseInt(request.getParameter("field")));
      ps.setString(3,request.getParameter("desc"));
      ps.setString(4,request.getParameter("title"));
      ps.setDate(5, java.sql.Date.valueOf(request.getParameter("sdate")));
      ps.setDate(6, java.sql.Date.valueOf(request.getParameter("edate")));
      ps.executeUpdate();
      out.println("<h3>Congrats!! Ad posted</h3>");
    }catch(Exception e)
    {
        out.println("Error loading data. Please try again");
        e.printStackTrace(out);
    }
    out.println("<a href='emphome.jsp'>Go to user home</a>");
    out.println("</body></html>");
  }
}
