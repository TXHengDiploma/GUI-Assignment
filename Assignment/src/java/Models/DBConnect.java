package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnect {
    protected static String host = "jdbc:derby://localhost:1527/ecommercedb;sendStringParametersAsUnicode=false;", user = "nbuser", password = "nbpassword";
	protected static PreparedStatement stmt;
	protected static Connection conn;
	protected static String sql;
	protected static ResultSet rs;

	protected static void connectDB() {
		try {
			conn = DriverManager.getConnection(host, user, password);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
