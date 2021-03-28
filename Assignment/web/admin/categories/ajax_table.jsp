<%@page import="java.util.ArrayList"%>
<%@page import="Models.Category"%>
<% ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories"); %>
<table class="category-table display w-100">
	<thead>
		<th> </th>
		<th class="sorting">Name</th>
		<th>Description</th>
		<th>Actions</th>
	</thead>
	<tbody>
		<% if(categories.size() != 0){ %>
			<% for(Category category : categories) { %> 
			<tr>
				<td class="text-center">
					<% if(category.getIcon() == null) { %>
							<i class="fa fa-guitar"></i>
					<% } else { %>
                        <i class="fa fa-<%= category.getIcon() %>"></i>
					<% } %>
				</td>
				<td><%= category.getName() %></td>
				<td><%= category.getDescription() %></td>
				<td>
					<div class="btn-group">
							<button class="btn btn-secondary" data-ajax-modal="/admin/categories/edit?id=<%= category.getId() %>"><i class="fa fa-edit"></i></button>
							<button class="btn btn-danger" data-delete-id="<%= category.getId() %>"><i class="fa fa-trash-alt"></i></button>
					</div>
				</td>
			</tr>
			<% } %>
		<% } %>
	</tbody>
</table>
<script defer>
    $(".category-table").DataTable({
		"columns": [
			{ "width": "3%", "orderable": false },
			{ "width": "30%" },
			{ "width": "30%" },
			{ "width": "25%", "orderable": false },
		]
	});

	$(document).on('click', "[data-delete-id]", function(){
		let id = $(this).data("delete-id");
		console.log(id);
		Swal.fire({
			title: "Are you sure?",
			text : "Do you want to delete this category?",
			icon : "warning",
			showCancelButton: true,
			confirmButtonText: "Yes",
			cancelButtonText: "No"
		}).then((result)=>{
			if(result.isConfirmed){
				console.log(id)
				$("#ajax-form").attr("action",`/admin/categories/delete?id=\${id}`);
				$("#ajax-form").attr("method","POST");
				$("#ajax-form").submit();
			}
		})
	})
</script>