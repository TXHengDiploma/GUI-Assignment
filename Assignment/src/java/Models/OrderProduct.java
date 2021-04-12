package Models;

import java.sql.SQLException;
import java.util.ArrayList;

public class OrderProduct extends DBConnect{

	private int id, orderId, productId, productQuantity;
	private double productPrice;
	private Product product;

	public OrderProduct() {

	}

	public OrderProduct(int orderId, int productId, int productQuantity, double productPrice, Product product) {
		this.orderId = orderId;
		this.productId = productId;
		this.productQuantity = productQuantity;
		this.productPrice = productPrice;
		this.product = product;
	}

	public OrderProduct(int id, int orderId, int productId, int productQuantity, double productPrice, Product product) {
		this.id = id;
		this.orderId = orderId;
		this.productId = productId;
		this.productQuantity = productQuantity;
		this.productPrice = productPrice;
		this.product = product;
	}

	public int getId() {
		return this.id;
	}

	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductQuantity() {
		return this.productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public double getProductPrice() {
		return this.productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public static ArrayList<OrderProduct> whereOrderId(int orderId){
		connectDB();
		ArrayList<OrderProduct> orderProducts = new ArrayList<OrderProduct>();
		sql = "SELECT * FROM orderProducts OP, products P WHERE OP.productId = P.id AND OP.orderId=?";
		try {
			stmt = conn.prepareStatement(sql)	;
			stmt.setInt(1, orderId);

			rs = stmt.executeQuery();
			while(rs.next()){
				orderProducts.add(new OrderProduct(rs.getInt(1), rs.getInt("orderId"), rs.getInt("productId"), rs.getInt("productQuantity"), rs.getDouble("productPrice"), new Product(rs.getInt(6), rs.getString("name"), rs.getDouble("price"), rs.getString("image"), rs.getString("description"), rs.getInt("brandId"), rs.getInt("categoryId"))));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return orderProducts;
	}
}
