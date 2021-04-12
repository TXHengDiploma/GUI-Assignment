<%@page import="java.util.ArrayList, Models.Order"%>
<% ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders"); %>
<style>
.pointer{
	cursor: pointer;
}
</style>
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
					<p class="text-primary" data-ajax-modal="/member/orders/details?id=<%= order.getId() %>">LMO<%= String.format("%05d", order.getId()) %></p>
				</td>
				<td>
					<% if(order.getStatus().equals("pending")) { %>
						<label class="badge badge-danger" data-toggle="tooltip" title="Click to make payment"><a class="text-light" href="/member/orders/payment?id=<%= order.getId() %>">Payment Pending</a></label>
					<% } else if (order.getStatus().equals("paid")) { %>
						<label class="badge badge-success">Paid</label>
					<% } else if (order.getStatus().equals("packing")) { %>
						<label class="badge badge-success">Packing</label>
					<% } else if (order.getStatus().equals("delivering")) { %>
						<label onclick="linkTrack('LMO<%= String.format("%05d", order.getId()) %>')" class="pointer badge badge-success">Delivering</label>
					<% } else if (order.getStatus().equals("delivered")) { %>
						<label onclick="linkTrack('LMO<%= String.format("%05d", order.getId()) %>')" class="pointer badge badge-success">Delivered</label>
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