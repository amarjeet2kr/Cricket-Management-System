package CricketManagementSystem;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author amarj
 */
//Connect to the MySQL database
public class ConnectionProvider {

    public static Connection getConnection() {
	try {
//	    Class.forName("com.mysql.jdbc.Driver");
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket_database", "root", "");
	    return con;
	} catch (Exception e) {}
	return null;
    }
}
