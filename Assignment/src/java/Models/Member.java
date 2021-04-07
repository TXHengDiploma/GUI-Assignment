package Models;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Member extends DBConnect{
    
	private int id;
	private String name, email, password, birthday, gender;

    public Member(String name, String email, String password){
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public Member(int id, String name, String email, String password){
        this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
	}
	public Member(String name, String email, String password, String gender, String birthday){
        this.gender = gender;
        this.birthday = birthday;
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
	//Gender
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }

    //Birthday
    public String getBirthday() {
        return birthday;
    }
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

	// Verify Member
	public boolean auth(){
		Member searchMember = find(id);
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

    //Create Member
	public static void create(Member member) {
		connectDB();
		sql = "INSERT INTO members (name, email, password) VALUES (?, ?, ?)";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, member.getName());
			stmt.setString(2, member.getEmail());
			stmt.setString(3, hashPassword(member.getPassword()));

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static Member find(int id) {
		connectDB();
		Member member = null;
		sql = "SELECT * FROM members WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1,id);

			rs = stmt.executeQuery();

			if(rs.next()){
				member = new Member(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("password"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return member;
	}

	public static Member findByEmail(String email) {
		connectDB();
		Member member = null;
		sql = "SELECT * FROM members WHERE email=?";
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,email);

			rs = stmt.executeQuery();

			if(rs.next()){
				member = new Member(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("password"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return member;
	}
	
	public void addAddress(Address address) {
		address.setMemberId(id);
		Address.create(address);
	}

	public void deleteAddress(int addressId) {
		Address.find(addressId).delete();
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

	public static ArrayList<Member> all() {
		connectDB();
		ArrayList<Member> members = new ArrayList<Member>();
		sql = "SELECT * FROM members ";//WHERE isDeleted=? ORDER BY id DESC
		try {
			stmt = conn.prepareStatement(sql);
			// stmt.setBoolean(1, false);

			rs = stmt.executeQuery();
			while(rs.next()){
				members.add(new Member(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("password")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return members;
	}

	public ArrayList<Address> getAddresses() {
		return Address.findByMemberId(id);
	}

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

	public void addToCart(int productId, int quantity){
		Cart.create(id,productId,quantity);
	}

	public ArrayList<Cart> myCart(){
		return Cart.all(id);
	}

	public void deleteFromCart(int cartId){
		Cart.delete(id, cartId);
	}

	public void updateCart(int cartId, int quantity){
		Cart cart = Cart.findByCartId(id, cartId);
		cart.setQuantity(quantity);
		cart.update();
	}
}
