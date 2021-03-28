package Models;

import java.sql.SQLException;
import java.util.ArrayList;

public class Brand extends DBConnect{
    
	private int id;
	private String name, imageString, description;
	private boolean isDeleted;

	public Brand(){
		isDeleted = false;
	}

	public Brand(String name, String imageString, String description){
		this.name = name;
		this.imageString = imageString;
		this.description = description;
	}

	public Brand(int id, String name, String imageString, String description){
		this.id = id;
		this.name = name;
        this.imageString = imageString;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	// Name
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// image in base 64
	public String getImageString() {
			return imageString;
	}
	
	public void setImageString(String imageString) {
			this.imageString = imageString;
	}

	// Description
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	// Delete Brand
	public boolean getIsDeleted(){
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public static void create(Brand brand) {
		connectDB();
		sql = "INSERT INTO brands (name, image, description, isDeleted) VALUES (?, ?, ?, ?)";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, brand.getName());
			stmt.setString(2, brand.getImageString());
			stmt.setString(3, brand.getDescription());
			stmt.setBoolean(4, false);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static Brand find(int id) {
		connectDB();
		Brand brand = null;
		sql = "SELECT * FROM brands WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1,id);

			rs = stmt.executeQuery();

			if(rs.next()){
				brand = new Brand(rs.getInt("id"), rs.getString("name"), rs.getString("image"), rs.getString("description"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return brand;
	}

	public void update() {
		connectDB();
		sql = "UPDATE brands SET name=?, image=?, description=? WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, name);
			stmt.setString(2, imageString);
			stmt.setString(3, description);
			stmt.setInt(4, id);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public void delete() {
		connectDB();
		sql = "UPDATE brands SET isDeleted=? WHERE id=?";

		try {
			stmt = conn.prepareStatement(sql);

			stmt.setBoolean(1, true);
			stmt.setInt(2, id);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static ArrayList<Brand> all() {
		connectDB();
		ArrayList<Brand> brands = new ArrayList<Brand>();
		sql = "SELECT * FROM brands WHERE isDeleted=? ORDER BY id DESC";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setBoolean(1, false);

			rs = stmt.executeQuery();
			while(rs.next()){
				brands.add(new Brand(rs.getInt("id"), rs.getString("name"), rs.getString("image"), rs.getString("description")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return brands;
	}

	public static ArrayList<Brand> allWithDeleted(){
		connectDB();
		ArrayList<Brand> brands = new ArrayList<Brand>();
		sql = "SELECT * FROM brands ORDER BY id DESC";
		try {
			stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery();
			while(rs.next()){
				brands.add(new Brand(rs.getInt("id"), rs.getString("name"), rs.getString("image"), rs.getString("description")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return brands;
	}

	public static int count(){
		connectDB();
		sql = "SELECT COUNT(*) as total FROM brands WHERE isDeleted=?";
		int total = 0;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setBoolean(1, false);
			rs = stmt.executeQuery();
			if(rs.next()){
				total = rs.getInt("total");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	public static ArrayList<Brand> page(int page, int resultPerPage){
		connectDB();
		ArrayList<Brand> brands = new ArrayList<Brand>();
		sql = "SELECT * FROM brands WHERE isDeleted=? OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		try{
			stmt = conn.prepareStatement(sql);
			stmt.setBoolean(1, false);
			stmt.setInt(2, ((page-1) * resultPerPage));
			stmt.setInt(3, resultPerPage);

			rs = stmt.executeQuery();
			while(rs.next()){
				brands.add(new Brand(rs.getInt("id"), rs.getString("name"), rs.getString("image"), rs.getString("description")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return brands;
	}
}
