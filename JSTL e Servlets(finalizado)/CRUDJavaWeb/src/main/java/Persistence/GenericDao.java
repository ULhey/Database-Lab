package Persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GenericDao {
	private Connection c;

	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String hostName = "localhost";
		String dbName = "videoAula";
		String user = "UL";
		String senha = "123456";

		Class.forName("net.sourceforge.jtds.jdbc.Driver");

		Connection c = DriverManager.getConnection("jdbc:jtds:sqlserver://" + hostName + ":1433;databaseName=" + dbName + ";user=" + user + ";password=" + senha);
		
		return c;
	}
}
