<%@page import="Models.Category"%>
<% Category category = (Category) request.getAttribute("category"); %>
<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Edit Category #<%= category.getId() %></h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<form action="/admin/categories/edit" method="post">
			<input type="hidden" name="id" value="<%= category.getId() %>">
			<div class="modal-body">
				<div class="form-group">
					<label for="cate_name">Name: </label>
					<input name="cate_name" type="text" class="form-control" placeholder="Enter Category Name" maxlength="100" required value="<%= category.getName() %>">
				</div>
				<div class="form-group">
					<label for="cate_desc">Description: </label>
					<textarea name="cate_desc" cols="30" rows="10" class="form-control" placeholder="Enter Category Description" required><%= category.getDescription() %></textarea>
				</div>
				<div class="form-group">
					<label for="cate_icon">Icon: </label><i id="icon-preview" class="fa fa-<%= category.getIcon() %>"></i>
                    <input name="cate_icon" type="text" class="form-control" placeholder="Enter Category Icon" required value="<%= category.getIcon() %>">
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Update</button>
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