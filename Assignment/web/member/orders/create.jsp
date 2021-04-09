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
		<button data-ajax-reload="#address-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		Select Your Address
		<div class="float-right">
			<button data-ajax-modal="/member/addresses/add" class="btn btn-primary"><i class="fa fa-plus"></i> Add Address</button>
		</div>
	</div>
	<div class="card-body">
		<div class="row" data-ajax-html="/member/orders/addresses" id="address-table">
		</div>
	</div>
</div>
<div class="card">
	<div class="card-header">
		Product Selected
	</div>
	<div class="card-body">
		<table class="w-100">
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
			<div class="col-md-3 col-xs-12 text-success">RM <%= String.format("%.2f", (double)totalQuantity * 5 ) %></div>
			<div class="col-md-3 col-xs-12"><h5>Amount To Pay: </h5></div>
			<div class="col-md-3 col-xs-12 text-success">RM <%= String.format("%.2f", (double)(totalQuantity * 5) + totalPrice ) %></div>
		</div>
	</div>
	<div class="row">
		<button type="button" class="btn btn-secondary btn-lg btn-block" data-carts="<%= request.getParameter("carts") %>" data-pay-now="false">Confirm Order, Make Pay In A Minutes</button>
		<button type="button" class="btn btn-primary btn-lg btn-block" data-carts="<%= request.getParameter("carts") %>" data-pay-now="true">Proceed To Payment</button>
	</div>
</div>
<script defer>
$("[data-pay-now]").click(function (e) {
	e.preventDefault();
	let carts = $(this).data('carts'), paynow = $(this).data('pay-now'), radioBtn = $('input[name="addressId"]:checked');
	if(radioBtn.length != 1){
		Swal.fire({
			title:"Oops...",
			text :"Please select an address",
			icon :"error"
		});
		return;
	}
	$("#ajax-form").attr("action",`/member/orders/new?addressId=\${radioBtn.val()}&carts=\${carts}&payNow=\${paynow}`);
	$("#ajax-form").attr("method","POST");
	$("#ajax-form").submit();

});
</script>
<jsp:include page="/member/footer.jsp"/>