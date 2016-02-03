package Connection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
public class Conn {
public static void main(String args[])
{
    System.out.println(getCon());
}
public static Connection getCon()
{
    Connection con=null;
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/freelanzers","root","root");
    }catch(Exception ex){ex.printStackTrace();}
    return con;
}    
}
