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
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        //outputstream
        PrintWriter out = response.getWriter();

        Connection con = Conn.getCon();
        String get="select * from applied_ads where eid=?";
        String getad="select * from ad where adid=?";
        String field = "select name from `work fields` where id=?";
        //String getdata="select * from resource where rid=?";
        //adid,eid,rid (take rid from session)
        ResultSet rs,rs2,rs3;
        PreparedStatement ps,ps2,ps3;
        StringBuffer send=null;
        String name;
        int countAd=0;
        try{
          HttpSession session=request.getSession();
          String id= (String) session.getAttribute("eid");

          ps=con.prepareStatement(get);
          ps.setInt(1,Integer.parseInt(id));
          rs=ps.executeQuery();
          while(rs.next())
          {
            countAd++;
          }
          int i;
          int adid[]=new int[countAd];
          rs.first();

          send = new StringBuffer("{\"ad\":[");

          for(i=0;i<countAd;i++)
          {
            adid[i]=Integer.parseInt(rs.getString("adid"));
            //rs.next();

            ps2=con.prepareStatement(getad);
            ps2.setInt(1,adid[i]);
            rs2=ps2.executeQuery();


            while(rs2.next())
            {
              ps3=con.prepareStatement(field);
              ps3.setInt(1,Integer.parseInt(rs2.getString("field")));
              rs3=ps3.executeQuery();
              rs3.first();
              send.append("{\"title\":\""+rs2.getString("title")+"\",");
              send.append("\"field\":\""+rs3.getString("name")+"\"}");
              if(rs.next())
              {
                send.append(",");
              }
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
