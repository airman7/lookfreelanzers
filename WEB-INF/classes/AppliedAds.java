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

public class AppliedAds extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

        //set the content type
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        //outputstream
        PrintWriter out = response.getWriter();

        Connection con = Conn.getCon();
        String getr="select * from applied_ads where rid=?";
        String getname="select ename from employer where eid=?";
        String getname2="select rname from resource where rid=?";
        //adid,eid,rid (take rid from session)
        ResultSet rs;
        PreparedStatement ps,ps2;
        StringBuffer send=null;
        String name;
        try{
          HttpSession session=request.getSession();
          String id= (String) session.getAttribute("rid");

            ps=con.prepareStatement(get);
            ps2=con.prepareStatement(getname);
            ps2.setInt(1,Integer.parseInt(id));
            rs=ps2.executeQuery();
            rs.first();
            name=rs.getString("ename");
              ps=con.prepareStatement(getr);
              ps2=con.prepareStatement(getname2);
              ps2.setInt(1,Integer.parseInt(id));
              rs=ps2.executeQuery();
              rs.first();
              name=rs.getString("rname");


          ps.setInt(1,Integer.parseInt(id));
          rs=ps.executeQuery();

          send = new StringBuffer("{\"ad\":[");
          while(rs.next())
          {
            send.append("{\"adid\":\""+rs.getString("adid")+"\",");
            send.append("\"name\":\""+name+"\"}");
            if(rs.next())
            {
              send.append(",");
              rs.previous();
            }
          }
            send.append("]}");
            out.write(send.toString());
        }catch(Exception e)
        {
            //out.println("<h3>Error fetching data. Please try again<h3>");
            e.printStackTrace(out);
        }
    }
}
