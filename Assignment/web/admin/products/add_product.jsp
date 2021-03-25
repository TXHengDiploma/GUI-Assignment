<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Add New Product</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<form action="/admin/products/add" method="post">
			<div class="modal-body">
				<div class="form-group">
					<label for="prod_name">Name: </label>
					<input name="prod_name" type="text" class="form-control" placeholder="Enter Product Name" maxlength="100" required>
				</div>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="prod_price">Price: </label>
					<input name="prod_price" type="text" class="form-control" placeholder="Enter Product Price" required>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
		</form>
	</div>
</div>