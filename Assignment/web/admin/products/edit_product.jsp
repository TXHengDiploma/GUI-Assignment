<%@page import="Models.Product"%>
<% Product product = (Product) request.getAttribute("product"); %>
<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Edit Product #<%= product.getId() %></h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<form action="/admin/products/edit" method="post">
			<input type="hidden" name="id" value="<%= product.getId() %>">
			<div class="modal-body">
				<div class="form-group">
					<label for="prod_name">Name: </label>
					<input name="prod_name" type="text" class="form-control" placeholder="Enter Product Name" maxlength="100" required value="<%= product.getName() %>">
				</div>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="prod_price">Price: </label>
					<input name="prod_price" type="text" class="form-control" placeholder="Enter Product Price" required value="<%= String.format("%.2f",product.getPrice()) %>">
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</form>
	</div>
</div>