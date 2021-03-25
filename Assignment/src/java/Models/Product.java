package Models;

import java.sql.SQLException;
import java.util.ArrayList;

public class Product extends DBConnect{
    
	private int id, brandId, categoryId;
	private String name;
	private double price;
	private boolean isDeleted;

	public Product(){
		isDeleted = false;
	}

	public Product(String name, double price){
		this.name = name;
		this.price = price;
	}

	public Product(int id, String name, double price){
		this.id = id;
		this.name = name;
		this.price = price;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
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

	// Price
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	// Delete Product
	public boolean getIsDeleted(){
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	// category
	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	// brand
	public int getBrandId() {
		return brandId;
	}

	public static void create(Product product) {
		connectDB();
		sql = "INSERT INTO products (name, price) VALUES (?, ?)";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, product.getName());
			stmt.setDouble(2, product.getPrice());

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static Product find(int id) {
		connectDB();
		Product product = null;
		sql = "SELECT * FROM products WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1,id);

			rs = stmt.executeQuery();

			if(rs.next()){
				product = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return product;
	}

	public void update() {
		connectDB();
		sql = "UPDATE products SET name=?, price=? WHERE id=?";
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, name);
			stmt.setDouble(2, price);
			stmt.setInt(3, id);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public void delete() {
		connectDB();
		sql = "UPDATE products SET isDeleted=? WHERE id=?";

		try {
			stmt = conn.prepareStatement(sql);

			stmt.setBoolean(1, true);
			stmt.setInt(2, id);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static ArrayList<Product> all() {
		connectDB();
		ArrayList<Product> products = new ArrayList<Product>();
		sql = "SELECT * FROM products WHERE isDeleted=? ORDER BY id DESC";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setBoolean(1, false);

			rs = stmt.executeQuery();
			while(rs.next()){
				products.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return products;
	}

	public static ArrayList<Product> allWithDeleted(){
		connectDB();
		ArrayList<Product> products = new ArrayList<Product>();
		sql = "SELECT * FROM products ORDER BY id DESC";
		try {
			stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery();
			while(rs.next()){
				products.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return products;
	}
}
