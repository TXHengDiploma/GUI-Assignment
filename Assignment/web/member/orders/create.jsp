<%@page import="java.util.ArrayList, Models.Cart"%>
<% 
	ArrayList<Cart> carts = (ArrayList<Cart>) request.getAttribute("carts"); 
	double totalPrice = 0;
	int totalQuantity = 0;
%>

<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="New Order"/>
</jsp:include>
<style>
	.my-img{
		width: 70px;
		height: 70px;
	}
</style>
<div class="card">
	<div class="card-header">
		Product Selected
	</div>
	<div class="card-body">
		<table class="product-selected-table display w-100">
			<thead>
				<th>Product</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Subtotal</th>
			</thead>
			<tbody>
				<% if(carts.size() != 0){ %>
					<% for(Cart cart : carts) { %> 
					<tr>
						<td>
							<img class="img-thumbnail my-img ml-1" src="<%= cart.getProduct().getImageString() != null ? cart.getProduct().getImageString() : "/public/img/no_pic.svg" %>" alt="<%= cart.getProduct().getName() %>">
							<%= cart.getProduct().getName() %>
						</td>
						<td>RM <%= String.format("%.2f",cart.getProduct().getPrice()) %></td>
						<td><%= cart.getQuantity() %></td>
						<td>RM <%= String.format("%.2f",cart.getProduct().getPrice() * cart.getQuantity()) %></td>
						<% 
							totalPrice += cart.getProduct().getPrice() * cart.getQuantity(); 
							totalQuantity += cart.getQuantity();
						%>
					</tr>
					<% } %>
				<% } %>
			</tbody>
		</table>
	</div>
	<div class="card-footer">
		<div class="row justify-content-end">
			<div class="col-md-3 col-xs-12"><h5>Total Product Selected: </h5></div>
			<div class="col-md-3 col-xs-12 text-warning"><%= carts.size() %></div>
			<div class="col-md-3 col-xs-12"><h5>Products Total Price: </h5></div>
			<div class="col-md-3 col-xs-12 text-success">RM <%= String.format("%.2f", totalPrice) %></div>
			<div class="col-md-3 col-xs-12"><h5>Shipping Fee: </h5></div>
			<div class="col-md-3 col-xs-12 text-success">RM <%= String.format("%.2f", totalQuantity * 5 ) %></div>
			<div class="col-md-3 col-xs-12"><h5>Shipping Fee: </h5></div>
			<div class="col-md-3 col-xs-12 text-success">RM <%= String.format("%.2f", totalQuantity * 5 ) %></div>
		</div>
	</div>

</div>
<script defer>
	$(".product-selected-table").DataTable({
		"columns": [
			{ "width": "30%" },
			{ "width": "30%" },
			{ "width": "25%" },
		]
	});
</script>
<jsp:include page="/member/footer.jsp"/>