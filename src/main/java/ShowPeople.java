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

public class ShowPeople extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

        //set the content type
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        //outputstream
        PrintWriter out = response.getWriter();

        Connection con = Conn.getCon();
        String getr="select * from resource where rid=?";
        String get = "select rid from applied_ads where adid=?";
        ResultSet rs,rs2;
        PreparedStatement ps,ps2;
        StringBuffer send=null;
        String name;
        try{

            int id= Integer.parseInt(request.getParameter("adid"));

            ps=con.prepareStatement(get);
            ps.setInt(1,id);
            rs=ps.executeQuery();
            send = new StringBuffer("{\"applyer\":[");
            while(rs.next())
            {
              ps2=con.prepareStatement(getr);
              ps2.setInt(1,Integer.parseInt(rs.getString("rid")));
              rs2=ps2.executeQuery();
              rs2.first();

              send.append("{\"id\":\""+rs2.getString("rid")+"\",");
              send.append("\"name\":\""+rs2.getString("rname")+"\",");
              send.append("\"work\":\""+rs2.getString("work field")+"\",");
              send.append("\"contact\":\""+rs2.getString("rcontact")+"\",");
              send.append("\"email\":\""+rs2.getString("email")+"\"}");
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
