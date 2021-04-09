package Models;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Order extends DBConnect {

	private int id, memberId;
	private Address shippingAddress;
	private String status;
	private double totalPrice, shippingFee;
	private Timestamp createdAt, payAt, packingAt, deliveringAt, deliveredAt;
	private boolean isPaid;

	public Order(){

	}

	public Order(int memberId, Address shippingAddress, String status, double totalPrice, double shippingFee, Timestamp createdAt, Timestamp payAt, Timestamp packingAt, Timestamp deliveringAt, Timestamp deliveredAt, boolean isPaid) {
		this.memberId = memberId;
		this.shippingAddress = shippingAddress;
		this.status = status;
		this.totalPrice = totalPrice;
		this.shippingFee = shippingFee;
		this.createdAt = createdAt;
		this.payAt = payAt;
		this.packingAt = packingAt;
		this.deliveringAt = deliveringAt;
		this.deliveredAt = deliveredAt;
		this.isPaid = isPaid;
	}

	public Order(int id, int memberId, Address shippingAddress, String status, double totalPrice, double shippingFee, Timestamp createdAt, Timestamp payAt, Timestamp packingAt, Timestamp deliveringAt, Timestamp deliveredAt, boolean isPaid) {
		this.id = id;
		this.memberId = memberId;
		this.shippingAddress = shippingAddress;
		this.status = status;
		this.totalPrice = totalPrice;
		this.shippingFee = shippingFee;
		this.createdAt = createdAt;
		this.payAt = payAt;
		this.packingAt = packingAt;
		this.deliveringAt = deliveringAt;
		this.deliveredAt = deliveredAt;
		this.isPaid = isPaid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id){
		this.id = id;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public Address getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(Address shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public double getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getPayAt() {
		return payAt;
	}

	public void setPayAt(Timestamp payAt) {
		this.payAt = payAt;
	}

	public Timestamp getPackingAt() {
		return packingAt;
	}

	public void setPackingAt(Timestamp packingAt) {
		this.packingAt = packingAt;
	}

	public Timestamp getDeliveringAt() {
		return deliveringAt;
	}

	public void setDeliveringAt(Timestamp deliveringAt) {
		this.deliveringAt = deliveringAt;
	}

	public Timestamp getDeliveredAt() {
		return deliveredAt;
	}

	public void setDeliveredAt(Timestamp deliveredAt) {
		this.deliveredAt = deliveredAt;
	}

	public boolean getIsPaid() {
		return isPaid;
	}

	public void setIsPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}

	// End of Getter and Setter

	public static ArrayList<Order> all() {
		connectDB();
		ArrayList<Order> orders = new ArrayList<Order>();

		sql = "SELECT * FROM orders";
		try {
			stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery();
			while(rs.next()){
				orders.add(new Order(rs.getInt("id"), rs.getInt("memberId"), new Address(rs.getString("receiverName"), rs.getString("remarkName"), rs.getString("email"), rs.getString("phoneNumber"), rs.getString("street"), rs.getString("city"), rs.getString("state"), rs.getString("postalCode")), rs.getString("status"), rs.getDouble("totalPrice"), rs.getDouble("shippingFee"), rs.getTimestamp("createdAt"), rs.getTimestamp("payAt"), rs.getTimestamp("payAt"), rs.getTimestamp("deliveringAt"), rs.getTimestamp("deliveredAt"), rs.getBoolean("isPaid")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return orders;
	}

	public static ArrayList<Order> all(int memberId) {
		connectDB();
		ArrayList<Order> orders = new ArrayList<Order>();

		sql = "SELECT * FROM orders WHERE memberId=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, memberId);
			rs = stmt.executeQuery();
			while(rs.next()){
				orders.add(new Order(rs.getInt("id"), rs.getInt("memberId"), new Address(rs.getString("receiverName"), rs.getString("remarkName"), rs.getString("email"), rs.getString("phoneNumber"), rs.getString("street"), rs.getString("city"), rs.getString("state"), rs.getString("postalCode")), rs.getString("status"), rs.getDouble("totalPrice"), rs.getDouble("shippingFee"), rs.getTimestamp("createdAt"), rs.getTimestamp("payAt"), rs.getTimestamp("payAt"), rs.getTimestamp("deliveringAt"), rs.getTimestamp("deliveredAt"), rs.getBoolean("isPaid")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return orders;
	}

	public static Order create(Order order){
		connectDB();										// status=10
		sql = "INSERT INTO orders (memberId, receiverName, remarkName, email, phoneNumber, street, city, state, postalCode, status, totalPrice, shippingFee, createdAt, payAt, packingAt, deliveringAt, deliveredAt, isPaid) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			stmt = conn.prepareStatement(sql, new int[]{ 1 });

			stmt.setInt(1, order.getMemberId());
			stmt.setString(2, order.getShippingAddress().getReceiverName());
			stmt.setString(3, order.getShippingAddress().getRemarkName());
			stmt.setString(4, order.getShippingAddress().getEmail());
			stmt.setString(5, order.getShippingAddress().getPhoneNumber());
			stmt.setString(6, order.getShippingAddress().getStreet());
			stmt.setString(7, order.getShippingAddress().getCity());
			stmt.setString(8, order.getShippingAddress().getState());
			stmt.setString(9, order.getShippingAddress().getPostalCode());
			stmt.setString(10, order.getStatus());
			stmt.setDouble(11, order.getTotalPrice());
			stmt.setDouble(12, order.getShippingFee());
			stmt.setTimestamp(13, order.getCreatedAt());
			stmt.setTimestamp(14, order.getPayAt());
			stmt.setTimestamp(15, order.getPackingAt());
			stmt.setTimestamp(16, order.getDeliveringAt());
			stmt.setTimestamp(17, order.getDeliveredAt());
			stmt.setBoolean(18, order.getIsPaid());

			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
			if(rs.next()){
				System.out.println(rs.getInt(1)+"");
				order.setId(rs.getInt(1));
				System.out.println(order.getId()+"");
			} else {
				System.out.println("Cannot access generated keys");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println(order.getId()+" before return");
		return order;
	}

	public void createProducts(ArrayList<Cart> carts){
		connectDB();
		for(Cart cart : carts){
			sql = "INSERT INTO orderProducts (orderId, productId, productPrice, productQuantity) VALUES (?, ?, ?, ?)";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, id);
				stmt.setInt(2, cart.getProduct().getId());
				stmt.setDouble(3, cart.getProduct().getPrice());
				stmt.setInt(4, cart.getQuantity());
				stmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

			sql = "DELETE FROM carts WHERE id=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, cart.getId());
				stmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
