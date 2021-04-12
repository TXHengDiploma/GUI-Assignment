<%@page import="java.util.ArrayList, Models.Order, Models.OrderProduct"%>
<% 
	Order order = (Order) request.getAttribute("order"); 
	ArrayList<OrderProduct> orderProducts = (ArrayList<OrderProduct>) request.getAttribute("orderProducts");
%>
<div class="modal-dialog modal-lg" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Order Details #LMO<%= String.format("%04d",order.getId()) %></h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div class="form-group">
				<label>Receiver Name</label>
				<input type="text" class="form-control" value="<%= order.getShippingAddress().getReceiverName() %>" disabled>
			</div>
			<div class="form-row">
				<div class="form-group col">
					<label>Receiver Contact No.</label>
					<input type="text" class="form-control" value="<%= order.getShippingAddress().getPhoneNumber() %>" disabled>
				</div>
				<div class="form-group col">
					<label>Receiver Email</label>
					<input type="email" class="form-control" value="<%= order.getShippingAddress().getEmail() %>" disabled>
				</div>
			</div>
			<div class="form-group">
				<label>Delviery Address</label>
				<textarea class="form-control" disabled><%= order.getShippingAddress().getFullAddress() %></textarea>
			</div>
			
			<hr>

			<div class="form-group">
				<label>Products</label>
				<table class="order-product-table">
					<thead>
						<tr>
							<th> </th>
							<th>Name</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>SubTotal</th>
						</tr>
					</thead>
					<tbody>
						<% for(OrderProduct op : orderProducts){ %>
							<tr>
								<td class="text-center">
									<% if(op.getProduct().getImageString() == null) { %>
											<i class="fa fa-guitar"></i>
									<% } else { %>
											<img src="<%= op.getProduct().getImageString() %>" alt="Product Image" style="width: 40px; height: 40px;">
									<% } %>
								</td>
								<td><%= op.getProduct().getName() %></td>
								<td>RM <%= String.format("%.2f",op.getProductPrice()) %></td>
								<td><%= op.getProductQuantity() %></td>
								<td>RM <%= String.format("%.2f",op.getProductQuantity() * op.getProductPrice()) %></td>
							</tr>
						<% } %>
					</tbody>
				</table>
			</div>

			<hr>

			<div class="form-row">
				<div class="form-group col">
					<label>Total Price</label>
					<input type="text" class="form-control" value="RM <%= String.format("%.2f",order.getTotalPrice()) %>" disabled>
				</div>
				<div class="form-group col">
					<label>Shipping Fee</label>
					<input type="text" class="form-control" value="RM <%= String.format("%.2f",order.getShippingFee()) %>" disabled>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col">
					<label>Amount To Pay</label>
					<input type="text" class="form-control text-success" value="RM <%= String.format("%.2f", order.getTotalPrice() + order.getShippingFee() ) %>" disabled>
				</div>
				<div class="form-group col">
					<label>Payment Status</label>
					<input type="text" class="form-control text-<%= order.getIsPaid() ? "success" : "danger" %>" value="<%= order.getIsPaid() ? "Paid" : "Not Paid" %>" disabled>
				</div>
			</div>

			<hr>

			<div class="form-row">
				<div class="form-group col">
					<label>Order Status</label>
					<% if(order.getStatus().equals("pending")) { %>
						<input type="text" class="form-control" value="Payment Pending" disabled>
					<% } else if (order.getStatus().equals("paid")) { %>
						<input type="text" class="form-control" value="Paid" disabled>
					<% } else if (order.getStatus().equals("packing")) { %>
						<input type="text" class="form-control" value="Packing" disabled>
					<% } else if (order.getStatus().equals("delivering")) { %>
						<input type="text" class="form-control" value="Delivering" disabled>
					<% } else if (order.getStatus().equals("delivered")) { %>
						<input type="text" class="form-control" value="Delivered" disabled>
					<% } %>
				</div>
				<div class="form-group col">
					<label>Created At</label>
					<input type="text" class="form-control" value="<%= order.getCreatedAt() %>" disabled>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col">
					<label>Pay At</label>
					<input type="text" class="form-control" value="<%= order.getPayAt() == null ? "-" : order.getPayAt() %>" disabled>
				</div>
				<div class="form-group col">
					<label>Packing At</label>
					<input type="text" class="form-control" value="<%= order.getPackingAt() == null ? "-" : order.getPackingAt() %>" disabled>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col">
					<label>Delivering At</label>
					<input type="text" class="form-control" value="<%= order.getDeliveringAt() == null ? "-" : order.getDeliveringAt() %>" disabled>
				</div>
				<div class="form-group col">
					<label>Delivered At</label>
					<input type="text" class="form-control" value="<%= order.getDeliveredAt() == null ? "-" : order.getDeliveredAt() %>" disabled>
				</div>
			</div>
		</div>
	</div>
</div>
<script defer>
$('.order-product-table').DataTable({
	"columns": [
		{ "width": "5%" },
		{ "width": "25%" },
		{ "width": "25%" },
		{ "width": "20%" },
		{ "width": "25%" }
	]
});
</script>