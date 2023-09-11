package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	public static Connection getCon() {
		try {
			String url = "jdbc:mysql://localhost:3306/bank";

			String uname = "root";
			String pass = "939164";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pass);
			return con;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
