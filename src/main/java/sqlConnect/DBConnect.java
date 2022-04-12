package sqlConnect;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
	private static DBConnect instance;
	public static DBConnect getInstance() {
		if (instance == null) {
			instance = new DBConnect();
		}
		return instance;
	}
	
	public static Connection getConnect() {
		Connection conn = null;
		String URL = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Project";
		String USER = "sa";
		String PASS = "1234$";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(URL, USER, PASS);
		} catch (Exception e) {
			System.out.println("Lỗi rồi");
			e.printStackTrace();
		}
		return conn;
	}
}
