package Models;

import java.sql.SQLException;
import java.util.ArrayList;

public class Cart extends DBConnect{
	int id, memberId, productId, quantity;
	Product product;

	public Cart(){

	}

	public Cart(int memberId, int productId, int quantity){
		this.memberId = memberId;
		this.productId = productId;
		this.quantity = quantity;
	}

	public Cart(int id, int memberId, int productId, int quantity){
		this.id = id;
		this.memberId = memberId;
		this.productId = productId;
		this.quantity = quantity;
	}

	public Cart(int id, int memberId, int quantity, Product product){
		this.id = id;
		this.memberId = memberId;
		this.quantity = quantity;
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Product getProduct(){
		return product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public static void create(int memberId, int productId, int quantity){
		connectDB();
		Cart cart = Cart.find(memberId, productId);
		if(cart != null){
			cart.setQuantity(cart.getQuantity() + quantity);
			cart.update();
			return;
		}

		sql = "INSERT INTO carts (memberId, productId, quantity) VALUES (?, ?, ?)";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, memberId);
			stmt.setInt(2, productId);
			stmt.setInt(3, quantity);
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static Cart find(int memberId, int productId){
		connectDB();
		Cart cart = null;
		sql = "SELECT * FROM carts WHERE memberId=? AND productId=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, memberId);
			stmt.setInt(2, productId);

			rs = stmt.executeQuery();
			if(rs.next()){
				cart = new Cart(rs.getInt("id"), memberId, productId, rs.getInt("quantity"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return cart;
	}

	public static Cart findByCartId(int memberId, int cartId){
		connectDB();
		Cart cart = null;
		sql = "SELECT * FROM carts WHERE id=? AND memberId=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, cartId);
			stmt.setInt(2, memberId);

			rs = stmt.executeQuery();
			if(rs.next()){
				cart = new Cart(rs.getInt("id"), memberId, rs.getInt("productId"), rs.getInt("quantity"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return cart;
	}

	public static ArrayList<Cart> all(int memberId) {
		connectDB();
		ArrayList<Cart> carts = new ArrayList<Cart>();
		sql = "SELECT * FROM carts C JOIN products P ON C.productId = P.id WHERE memberId=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, memberId);

			rs = stmt.executeQuery();
			while(rs.next()){
				carts.add(new Cart(rs.getInt(1), rs.getInt("memberId"), rs.getInt("quantity"), new Product(rs.getInt(5), rs.getString("name"), rs.getDouble("price"), rs.getString("image"), rs.getString("description"), rs.getInt("brandId"), rs.getInt("categoryId"))));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return carts;
	}

	public void update(){
		connectDB();
		sql = "UPDATE carts SET quantity=? WHERE id =?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, quantity);
			stmt.setInt(2, id);

			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static void delete(int memberId, int cartId){
		connectDB();
		if(findByCartId(memberId, cartId) != null){
			sql = "DELETE FROM carts WHERE id=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, cartId);

				stmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
