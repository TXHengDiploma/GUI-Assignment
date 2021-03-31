<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Add New Category</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<form action="/admin/categories/add" method="post">
			<div class="modal-body">
				<div class="form-group">
					<label>Name: </label>
					<input name="cate_name" type="text" class="form-control" placeholder="Enter Category Name" maxlength="100" required>
				</div>
				<div class="form-group">
					<label>Description: </label>
					<textarea name="cate_desc" cols="30" rows="10" class="form-control" placeholder="Enter Category Description"required></textarea>
				</div>
                <div class="form-group">
					<label>Icon: </label><i id="icon-preview" class="fa fa-eye"></i>
					<input name="cate_icon" type="text" class="form-control" placeholder="Enter Category Icon" value="" required>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
		</form>
	</div>
</div>
<script defer>
	$('[name="cate_icon"]').keyup(function (e) { 
		$('#icon-preview').removeClass();
		$('#icon-preview').addClass('fa');
		$('#icon-preview').addClass('fa-'+$(this).val());
	});
</script>