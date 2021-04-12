<%@page import="java.util.ArrayList, Models.Order"%>
<% ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders"); %>
<style>
.pointer{
	cursor: pointer;
}
</style>
<table class="order-table display w-100">
	<thead>
		<th>Member</th>
		<th>Order Id</th>
		<th>Status</th>
		<th>Amount To Pay</th>
	</thead>
	<tbody>
		<% if(orders.size() != 0){ %>
			<% for(Order order : orders) { %> 
			<tr>
				<td><a href="/admin/members/details?id=<%= order.getMemberId() %>">LMM<%= order.getMemberId() %></a></td>
				<td>
					<button class="btn btn-primary" data-ajax-modal="/admin/orders/details?id=<%= order.getId() %>">LMO<%= String.format("%05d", order.getId()) %></button>
				</td>
				<td>
					<% if(order.getStatus().equals("pending")) { %>
						<label class="badge badge-warning">Payment Pending</label>
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
			<h5 class="w-100 text-center">No Record!</h5>
		<% } %>
	</tbody>
</table>

<script src="//www.tracking.my/track-button.js"></script>
<script defer>
    $(".order-table").DataTable({
		"columns": [
			{ "width": "25%" },
			{ "width": "25%" },
			{ "width": "25%" },
			{ "width": "25%" },
		]
	});
	function linkTrack(num) {
		TrackButton.track({
		tracking_no: num
		});
	}
</script>