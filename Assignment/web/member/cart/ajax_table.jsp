<%@page import="java.util.ArrayList, Models.Cart"%>
<% ArrayList<Cart> carts = (ArrayList<Cart>) request.getAttribute("carts"); %>
<script src="/public/vendor/input-spinner/input-spinner.js"></script>
<table class="cart-table display w-100">
	<thead>
		<th></th>
		<th>Product</th>
		<th>Quantity</th>
		<th>Price</th>
		<th>Actions</th>
	</thead>
	<tbody>
		<% if(carts.size() != 0){ %>
			<% for(Cart cart : carts) { %> 
			<tr>
				<td><input type="checkbox" class="form-control" data-cart-id="<%= cart.getId() %>" data-product-price="<%= cart.getProduct().getPrice() %>" data-product-quantity="<%= cart.getQuantity() %>" /></td>
				<td>
					<img class="img-thumbnail ml-1" src="<%= cart.getProduct().getImageString() != null ? cart.getProduct().getImageString() : "/public/img/no_pic.svg" %>" alt="<%= cart.getProduct().getName() %>">
					<%= cart.getProduct().getName() %>
				</td>
				<td><input data-number="<%= cart.getId() %>" data-price="<%= cart.getProduct().getPrice() %>" class="pl-5 pr-5" type="number" value="<%= cart.getQuantity() %>" min="1" max="100" step="1"/></td>
				<td>RM <span data-price-id="<%= cart.getId() %>"><%= String.format("%.2f",cart.getProduct().getPrice() * cart.getQuantity()) %><span></td>
				<td>
					<div class="btn-group">
						<button class="btn btn-danger" data-delete-id="<%= cart.getId() %>"><i class="fa fa-trash-alt"></i></button>
					</div>
				</td>
			</tr>
			<% } %>
		<% } %>
	</tbody>
</table>

<div class="row mt-5">
	<div class="col-md-3 col-xs-12"><h5>Total Product Selected: </h5></div>
	<div class="col-md-3 col-xs-12 text-warning" data-product-selected>0</div>
	<div class="col-md-3 col-xs-12"><h5>Total Price: </h5></div>
	<div class="col-md-3 col-xs-12 text-success">RM <span data-total-price>0.00</span></div>
</div>

<script defer>
    $(".cart-table").DataTable({
		"columns": [
			{ "width": "2%", "orderable": false },
			{ "width": "30%" },
			{ "width": "30%" },
			{ "width": "25%" },
			{ "width": "5%", "orderable": false },
		]
	});

	$(document).ready(function () {
		$("input[type='number']").each(function(){
			$(this).inputSpinner({groupClass: "pl-5 pr-5"});
		});
	})
</script>