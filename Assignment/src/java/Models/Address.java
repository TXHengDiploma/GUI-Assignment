package Models;

import java.sql.SQLException;
import java.util.ArrayList;

public class Address extends DBConnect{
    
    private int id, memberId;
	private String receiverName, remarkName, email, phoneNumber, street, city, state, postalCode;

	public Address(){
		
	}

	public Address(int id, String receiverName, String remarkName, String email, String phoneNumber, String street, String city, String state, String postalCode){
		this.id = id;
        this.receiverName = receiverName;
        this.remarkName= remarkName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.street = street;
        this.city = city;
        this.state = state;
        this.postalCode = postalCode;
	}

	public Address(int id, String receiverName, String remarkName, String email, String phoneNumber, String street, String city, String state, String postalCode, int memberId){
		this.id = id;
        this.receiverName = receiverName;
        this.remarkName= remarkName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.street = street;
        this.city = city;
        this.state = state;
        this.postalCode = postalCode;
		this.memberId = memberId;
	}

	public int getId() {
		return id;
	}

	// Receiver Name
	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	// Remark Name
	public String getRemarkName() {
		return remarkName;
	}

	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}

	// Email
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	// Phone Number
	public String getPhoneNumber() {
			return phoneNumber;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	// Street
	public String getStreet() {
			return street;
	}
	
	public void setStreet(String street) {
			this.street = street;
	}

	// City
	public String getCity() {
			return city;
	}
	
	public void setCity(String city) {
			this.city = city;
	}

    // State
	public String getState() {
			return state;
	}
	
	public void setState(String state) {
			this. state= state;
	}
    // Postal Code
	public String getPostalCode() {
			return postalCode;
	}
	
	public void setPostalCode(String postalCode) {
			this. postalCode= postalCode;
	}

	// Member Id
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
			this. memberId= memberId;
	}

	public static void create(Address address) {
		connectDB();
		sql = "INSERT INTO addresses (receiverName, remarkName, email, phoneNumber, street, city, state, postalCode, memberId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, address.getReceiverName());
			stmt.setString(2, address.getRemarkName());
			stmt.setString(3, address.getEmail());
            stmt.setString(4, address.getPhoneNumber());
            stmt.setString(5, address.getStreet());
            stmt.setString(6, address.getCity());
            stmt.setString(7, address.getState());
            stmt.setString(8, address.getPostalCode());
			stmt.setInt(9, address.getMemberId());
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static Address find(int id) {
		connectDB();
		Address address = null;
		sql = "SELECT * FROM addresses WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1,id);

			rs = stmt.executeQuery();

			if(rs.next()){
				address = new Address(rs.getInt("id"), rs.getString("receiverName"), rs.getString("remarkName"), rs.getString("email"), rs.getString("phoneNumber"), rs.getString("street"), rs.getString("city"), rs.getString("state"), rs.getString("postalCode"), rs.getInt("memberId"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return address;
	}

	public static ArrayList<Address> findByMemberId(int memberId){
		connectDB();
		ArrayList<Address> addresses = new ArrayList<Address>();
		sql = "SELECT * FROM addresses WHERE memberId=? ORDER BY id DESC";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, memberId);

			rs = stmt.executeQuery();
			while(rs.next()){
				addresses.add(new Address(rs.getInt("id"), rs.getString("receiverName"), rs.getString("remarkName"), rs.getString("email"), rs.getString("phoneNumber"), rs.getString("street"), rs.getString("city"), rs.getString("state"), rs.getString("postalCode"),rs.getInt("memberId")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return addresses;
	}

	public void update() {
		connectDB();
		sql = "UPDATE addresses SET receiverName=?, remarkName=?, email=?, phoneNumber=?, street=?, city=?, state=?, postalCode=?, memberId=? WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, receiverName);
			stmt.setString(2, remarkName);
			stmt.setString(3, email);
            stmt.setString(4, phoneNumber);
            stmt.setString(5, street);
            stmt.setString(6, city);
            stmt.setString(7, state);
            stmt.setString(8, postalCode);
			stmt.setInt(9, memberId);
            stmt.setInt(10, id);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public void delete() {
		connectDB();
		sql = "DELETE FROM addresses WHERE id=?";

		try {
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, id);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static ArrayList<Address> all() {
		connectDB();
		ArrayList<Address> addresses = new ArrayList<Address>();
		sql = "SELECT * FROM addresses ORDER BY id DESC";
		try {
			stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery();
			while(rs.next()){
				addresses.add(new Address(rs.getInt("id"), rs.getString("receiverName"), rs.getString("remarkName"), rs.getString("email"), rs.getString("phoneNumber"), rs.getString("street"), rs.getString("city"), rs.getString("state"), rs.getString("postalCode"), rs.getInt("memberId")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return addresses;
	}
}

