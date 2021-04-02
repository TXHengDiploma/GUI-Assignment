<%@page import="java.util.ArrayList"%>
<%@page import="Models.Brand"%>
<%@page import="Models.Category"%>
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
				<div class="form-group">
					<label for="prod_price">Price: </label>
					<input name="prod_price" type="text" class="form-control" placeholder="Enter Product Price" required value="<%= String.format("%.2f",product.getPrice()) %>">
				</div>
				<div class="form-group">
					<label for="prod_price">Description: </label>
					<textarea name="prod_desc" cols="30" rows="10" class="form-control" placeholder="Enter Product Description"><%= product.getDescription() %></textarea>
				</div>
				<div class="form-group">
					<label>Brand: </label>
					<select name="prod_brand" required class="form-control">
						<option value="">-- Select One Brand --</option>
						<% for(Brand brand : (ArrayList<Brand>) request.getAttribute("brands")){ %>
							<option value="<%= brand.getId() %>" <%= brand.getId() == product.getBrandId() ? "selected" : "" %> ><%= brand.getName() %></option>
						<% } %>
					</select>
				</div>
				<div class="form-group">
					<label>Category: </label>
					<select name="prod_category" required class="form-control">
						<option value="">-- Select One Category --</option>
						<% for(Category category : (ArrayList<Category>) request.getAttribute("categories")){ %>
							<option value="<%= category.getId() %>" <%= category.getId() == product.getCategoryId() ? "selected" : "" %> ><%= category.getName() %></option>
						<% } %>
					</select>
				</div>
				<div class="form-group">
					<label>Image: </label>
					<input id="inp" type="file" class="form-control" accept="image/*">
					<input name="prod_img" type="hidden" id="b64" value="<%= product.getImageString() %>">
					<div class="d-flex w-100 justify-content-center align-item-center">
						<img id="img_preview" height="200" src="<%= product.getImageString() %>">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</form>
	</div>
</div>
<script defer>
	function readFile() {
		if (this.files && this.files[0]) {
			var FR= new FileReader();
			FR.addEventListener("load", function(e) {
				document.getElementById("img_preview").src = e.target.result;
				document.getElementById("b64").value = e.target.result;
			}); 
			FR.readAsDataURL( this.files[0] );
		}
	}
	document.getElementById("inp").addEventListener("change", readFile);
</script>