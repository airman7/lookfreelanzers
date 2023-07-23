import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import Connection.Conn;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.io.PrintWriter;
public class AddSkill extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{

        //setting the content type of response
        res.setContentType("text/html");

        //outputstream
        PrintWriter out =res.getWriter();

        //AddSkill?skills=
        Connection con=Conn.getCon();
        HttpSession ses=req.getSession();
        String query="insert into skill values(?,?)";
        PreparedStatement pres;

        try{
          String id= (String) ses.getAttribute("rid");

            pres=con.prepareStatement(query);
            pres.setInt(1,Integer.parseInt(id));
            pres.setString(2,req.getParameter("skills"));
            pres.executeUpdate();
            con.close();
        }
        catch(Exception e)
        {
            out.println("<h3> Error. Try again later.</h3>");
            e.printStackTrace(out);
        }
        res.sendRedirect("workerhome.jsp");
    }
}
