package Models;

import java.sql.SQLException;
import java.util.ArrayList;

public class Category extends DBConnect{
    
    private int id, brandId, categoryId;
	private String name, icon, description;
	private boolean isDeleted;

	public Category(){
		isDeleted = false;
	}

	public Category(String name, String icon, String description){
		this.name = name;
		this.icon = icon;
		this.description = description;
	}

	public Category(int id, String name, String icon, String description){
		this.id = id;
		this.name = name;
        this.icon = icon;
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

	// icon
	public String getIcon() {
			return icon;
	}
	
	public void setIcon(String icon) {
			this.icon = icon;
	}

	// Description
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	// Delete Category
	public boolean getIsDeleted(){
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public static void create(Category category) {
		connectDB();
		sql = "INSERT INTO categories (name, icon, description, isDeleted) VALUES (?, ?, ?, ?)";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, category.getName());
			stmt.setString(2, category.getIcon());
			stmt.setString(3, category.getDescription());
			stmt.setBoolean(4, false);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static Category find(int id) {
		connectDB();
		Category category = null;
		sql = "SELECT * FROM categories WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1,id);

			rs = stmt.executeQuery();

			if(rs.next()){
				category = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("icon"), rs.getString("description"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return category;
	}

	public void update() {
		connectDB();
		sql = "UPDATE categories SET name=?, icon=?, description=? WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, name);
			stmt.setString(2, icon);
			stmt.setString(3, description);
			stmt.setInt(4, id);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public void delete() {
		connectDB();
		sql = "UPDATE categories SET isDeleted=? WHERE id=?";

		try {
			stmt = conn.prepareStatement(sql);

			stmt.setBoolean(1, true);
			stmt.setInt(2, id);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static ArrayList<Category> all() {
		connectDB();
		ArrayList<Category> categories = new ArrayList<Category>();
		sql = "SELECT * FROM categories WHERE isDeleted=? ORDER BY id DESC";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setBoolean(1, false);

			rs = stmt.executeQuery();
			while(rs.next()){
				categories.add(new Category(rs.getInt("id"), rs.getString("name"), rs.getString("icon"), rs.getString("description")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return categories;
	}

	public static ArrayList<Category> allWithDeleted(){
		connectDB();
		ArrayList<Category> categories = new ArrayList<Category>();
		sql = "SELECT * FROM categories ORDER BY id DESC";
		try {
			stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery();
			while(rs.next()){
				categories.add(new Category(rs.getInt("id"), rs.getString("name"), rs.getString("icon"), rs.getString("description")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return categories;
	}

	public static int count(){
		connectDB();
		sql = "SELECT COUNT(*) as total FROM categories WHERE isDeleted=?";
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

	public static ArrayList<Category> page(int page, int resultPerPage){
		connectDB();
		ArrayList<Category> categories = new ArrayList<Category>();
		sql = "SELECT * FROM categories WHERE isDeleted=? OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		try{
			stmt = conn.prepareStatement(sql);
			stmt.setBoolean(1, false);
			stmt.setInt(2, ((page-1) * resultPerPage));
			stmt.setInt(3, resultPerPage);

			rs = stmt.executeQuery();
			while(rs.next()){
				categories.add(new Category(rs.getInt("id"), rs.getString("name"), rs.getString("icon"), rs.getString("description")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return categories;
	}
}

