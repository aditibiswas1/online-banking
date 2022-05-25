package bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC_Connect {
	private Connection connection = null;
	private String username = "SYSTEM";
	private String password = "1234";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";

	public Connection getConnection() throws SQLException {
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {

			System.out.println("Where is your Oracle JDBC Driver?");
			e.printStackTrace();

		}

		return connection;

	}

}