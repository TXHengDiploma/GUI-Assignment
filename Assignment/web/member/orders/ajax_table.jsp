<%@page import="java.util.ArrayList, Models.Order"%>
<% ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders"); %>
<table class="order-table display w-100">
	<thead>
		<th>Order Id</th>
		<th>Status</th>
		<th>Amount To Pay</th>
	</thead>
	<tbody>
		<% if(orders.size() != 0){ %>
			<% for(Order order : orders) { %> 
			<tr>
				<td>
					<a href="/member/orders/details?id=<%= order.getId() %>">LMO<%= String.format("%05d", order.getId()) %></a>
				</td>
				<td>
					<% if(order.getStatus().equals("pending")) { %>
						<label class="badge badge-warning" data-toggle="tooltip" title="Click to make payment"><a href="member/orders/payment?id=<%= order.getId() %>">Payment Pending</a></label>
					<% } else if (order.getStatus().equals("paid")) { %>
						<label class="badge badge-success">Paid</label>
					<% } else if (order.getStatus().equals("packing")) { %>
						<label class="badge badge-success">Packing</label>
					<% } else if (order.getStatus().equals("delivering")) { %>
						<button onclick="linkTrack('LMO<%= String.format("%05d", order.getId()) %>')" class="badge badge-success">Delivering</button>
					<% } else if (order.getStatus().equals("delivered")) { %>
						<button onclick="linkTrack('LMO<%= String.format("%05d", order.getId()) %>')" class="badge badge-success">Delivered</button>
					<% } %>
				</td>
				<td>RM <%= String.format("%.2f", order.getTotalPrice() + order.getShippingFee() ) %></td>
			</tr>
			<% } %>
		<% } else { %>
			<h5 class="w-100 text-center">You have no order!</h5>
		<% } %>
	</tbody>
</table>

<script src="//www.tracking.my/track-button.js"></script>
<script defer>
    $(".order-table").DataTable({
		"columns": [
			{ "width": "30%" },
			{ "width": "30%" },
			{ "width": "30%" },
		]
	});
	function linkTrack(num) {
		TrackButton.track({
		tracking_no: num
		});
	}
</script>