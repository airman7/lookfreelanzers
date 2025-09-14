package Connection;
import java.sql.Connection;
import java.sql.DriverManager;
public class Conn {
	public static void main(String args[])
	{
	    System.out.println(getCon());
	}
	public static Connection getCon()
	{
		String dbHost = System.getenv("DB_HOST");
		String dbPort = System.getenv("DB_PORT");
		String dbName = System.getenv("DB_NAME");
		// String dbUser = System.getenv("DB_USER");
		// String dbPass = System.getenv("DB_PASS");

		if (dbHost == null) {
			dbHost = "localhost";
		}
		if (dbPort == null) {
			dbPort = "3306";
		}
		if (dbName == null) {
			dbName = "lookfreelanzers";
		}
		
		String jdbcUrl = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;
	    Connection con=null;
	    try
	    {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	con=DriverManager.getConnection(jdbcUrl+"?characterEncoding=latin1&useConfigs=maxPerformance",
	    			"root","doomsday");
	    } catch(Exception ex)
	    {
	    	ex.printStackTrace();
	    }
	    return con;
	}    
}
