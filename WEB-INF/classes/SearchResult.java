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
        String send;
        PrintWriter out = response.getWriter();

        Connection con = Conn.getCon();
        String query1 = "select * from resource where rname=?";
        String query2 = "select * from resource where rname=? & `work field`=?";
        String query= "select * from resource where `work field`=?";
        String query3 = "select * from resource";
        ResultSet rs;
        PreparedStatement ps;
        //SearchResult?search=&searchin=

        try{
            String search="";
            search=search.concat(request.getParameter("search"));
            String where="";
            where=where.concat(request.getParameter("searchin"));
            //out.println(search);
            //out.println(where);

            if(search.equals("") && where.equals("No Particular Field"))
            {
              ps  = con.prepareStatement(query3);
            }
            else
            {
              if(where.equals("No Particular Field"))
              {
                  ps = con.prepareStatement(query1);
                  ps.setString(1,search);
              }
              else
              {
                if(search.equals(""))
                {
                    ps=con.prepareStatement(query);
                    ps.setString(1,where);
                }
                else
                {
                    ps=con.prepareStatement(query2);
                    ps.setString(1,search);
                    ps.setString(2,where);
                }
              }
            }

            rs=ps.executeQuery();
            int count=0;
            while (rs.next())
              ++count;
            if(rs.first())
              for(int i =0;i<count;i++)
              {
                  out.println("<h4>"+rs.getString("rname")+"</h4>");
                  rs.next();
              }
  /*          else
            {
                out.println("<h4>no result matches your search</h4>");
            }
  */      }catch(Exception e)
        {
            out.println("Error fetching data. Please try again");
            //e.printStackTrace(out);

        }

        out.write(generateJSONdata(send));
    }
}

{"result":{
  ""
}}
/*
out.println("<html><head>");
out.println("<title>Search results</title>");
out.println("</head><body>");

Connection con = Conn.getCon();
String query1 = "select * from resource where rname=?";
String query2 = "select * from resource where rname=? & `work field`=?";
String query= "select * from resource where `work field`=?";
String query3 = "select * from resource";
ResultSet rs;
PreparedStatement ps;
//SearchResult?search=&searchin=

try{
    String search="";
    search=search.concat(request.getParameter("search"));
    String where="";
    where=where.concat(request.getParameter("searchin"));
    //out.println(search);
    //out.println(where);

    if(search.equals("") && where.equals("No Particular Field"))
    {
      ps  = con.prepareStatement(query3);
    }
    else
    {
      if(where.equals("No Particular Field"))
      {
          ps = con.prepareStatement(query1);
          ps.setString(1,search);
      }
      else
      {
        if(search.equals(""))
        {
            ps=con.prepareStatement(query);
            ps.setString(1,where);
        }
        else
        {
            ps=con.prepareStatement(query2);
            ps.setString(1,search);
            ps.setString(2,where);
        }
      }
    }
    out.println("chekpoint");

    rs=ps.executeQuery();
    int count=0;
    while (rs.next())
      ++count;
    if(rs.first())
      for(int i =0;i<count;i++)
      {
          out.println("<h4>"+rs.getString("rname")+"</h4>");
          rs.next();
      }
    else
    {
        out.println("<h4>no result matches your search</h4>");
    }
}catch(Exception e)
{
    out.println("Error fetching data. Please try again");
    //e.printStackTrace(out);

}
out.println("</body></html>");
*/
