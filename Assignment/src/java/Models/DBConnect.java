package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnect {
    private static String host = "jdbc:derby://localhost:1527/ecommercedb", user = "nbuser", password = "nbpassword";
	public static PreparedStatement stmt;
	public static Connection conn;
	public static String sql;
	public static ResultSet rs;

	public static void connectDB() {
		try {
			conn = DriverManager.getConnection(host, user, password);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
