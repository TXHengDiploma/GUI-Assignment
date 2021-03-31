package Models;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

public class Admin extends DBConnect{
    
	private int id;
	private String name, email, password;

    public Admin(String name, String email, String password){
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public Admin(int id, String name, String email, String password){
        this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
	}

    //Id
    public int getId() {
		return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
	//Name
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
    }
    
    //Email
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    //Password
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

	// Verify Admin
	public boolean auth(){
		Admin searchMember = find(id);
		if(searchMember != null){
			return searchMember.getPassword().equals(password);
		}
		return false;
	}

	public static String hashPassword(String password){

		String result = "";
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update(password.getBytes());
			byte[] resultByteArr = messageDigest.digest();
			StringBuilder sb = new StringBuilder();
			for(byte b : resultByteArr){
				sb.append(String.format("%02x", b));
			}
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

    //Create Admin
	public static void create(Admin admin) {
		connectDB();
		sql = "INSERT INTO admins (name, email, password) VALUES (?, ?, ?)";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, admin.getName());
			stmt.setString(2, admin.getEmail());
			stmt.setString(3, hashPassword(admin.getPassword()));

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static Admin find(int id) {
		connectDB();
		Admin admin = null;
		sql = "SELECT * FROM admins WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1,id);

			rs = stmt.executeQuery();

			if(rs.next()){
				admin = new Admin(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("password"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return admin;
	}

	public static Admin findByEmail(String email) {
		connectDB();
		Admin admin = null;
		sql = "SELECT * FROM admins WHERE email=?";
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,email);

			rs = stmt.executeQuery();

			if(rs.next()){
				admin = new Admin(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("password"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return admin;
	}
	

	// public void update() {
	// 	connectDB();
	// 	sql = "UPDATE members SET name=?, email=?, password=? WHERE id=?";
	// 	try {
	// 		stmt = conn.prepareStatement(sql);

	// 		stmt.setString(1, name);
	// 		stmt.setString(2, email);
	// 		stmt.setString(3, password);
	// 		stmt.setInt(4, id);

	// 		stmt.executeUpdate();
	// 	} catch (SQLException e) {
	// 		System.out.println(e.getMessage());
	// 	}
	// }

	// public void delete() {
	// 	connectDB();
	// 	sql = "UPDATE members SET isDeleted=? WHERE id=?";

	// 	try {
	// 		stmt = conn.prepareStatement(sql);

	// 		stmt.setBoolean(1, true);
	// 		stmt.setInt(2, id);

	// 		stmt.executeUpdate();
	// 	} catch (SQLException e) {
	// 		System.out.println(e.getMessage());
	// 	}
	// }

	// public static ArrayList<Product> all() {
	// 	connectDB();
	// 	ArrayList<Product> products = new ArrayList<Product>();
	// 	sql = "SELECT * FROM products WHERE isDeleted=? ORDER BY id DESC";
	// 	try {
	// 		stmt = conn.prepareStatement(sql);
	// 		stmt.setBoolean(1, false);

	// 		rs = stmt.executeQuery();
	// 		while(rs.next()){
	// 			products.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("image"), rs.getString("description")));
	// 		}
	// 	} catch (SQLException e) {
	// 		System.out.println(e.getMessage());
	// 	}
	// 	return products;
	// }

	// public static ArrayList<Product> allWithDeleted(){
	// 	connectDB();
	// 	ArrayList<Product> products = new ArrayList<Product>();
	// 	sql = "SELECT * FROM products ORDER BY id DESC";
	// 	try {
	// 		stmt = conn.prepareStatement(sql);

	// 		rs = stmt.executeQuery();
	// 		while(rs.next()){
	// 			products.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("image"), rs.getString("description")));
	// 		}
	// 	} catch (SQLException e) {
	// 		System.out.println(e.getMessage());
	// 	}
	// 	return products;
	// }

	// public static int count(){
	// 	connectDB();
	// 	sql = "SELECT COUNT(*) as total FROM products WHERE isDeleted=?";
	// 	int total = 0;
	// 	try {
	// 		stmt = conn.prepareStatement(sql);
	// 		stmt.setBoolean(1, false);
	// 		rs = stmt.executeQuery();
	// 		if(rs.next()){
	// 			total = rs.getInt("total");
	// 		}
	// 	} catch (SQLException e) {
	// 		System.out.println(e.getMessage());
	// 	}
	// 	return total;
	// }

	// public static ArrayList<Product> page(int page, int resultPerPage){
	// 	connectDB();
	// 	ArrayList<Product> products = new ArrayList<Product>();
	// 	sql = "SELECT * FROM products WHERE isDeleted=? OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	// 	try{
	// 		stmt = conn.prepareStatement(sql);
	// 		stmt.setBoolean(1, false);
	// 		stmt.setInt(2, ((page-1) * resultPerPage));
	// 		stmt.setInt(3, resultPerPage);

	// 		rs = stmt.executeQuery();
	// 		while(rs.next()){
	// 			products.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("image"), rs.getString("description")));
	// 		}
	// 	} catch (SQLException e) {
	// 		System.out.println(e.getMessage());
	// 	}
	// 	return products;
	// }
}
