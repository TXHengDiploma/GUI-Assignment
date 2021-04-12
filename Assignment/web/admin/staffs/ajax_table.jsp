<%@page import="java.util.ArrayList"%>
<%@page import="Models.Admin"%>
<% ArrayList<Admin> admins = (ArrayList<Admin>) request.getAttribute("staffs"); %>
<table class="admin-table display w-100">
	<thead>
		<th class="sorting">ID</th>
		<th class="sorting">Name</th>
		<th class="sorting">Email</th>
		<th>Actions</th>
	</thead>
	<tbody>
		<% if(admins.size() != 0){ %>
			<% for(Admin admin : admins) { %> 
			<tr>
				<td><%= admin.getId() %></td>
				<td><%= admin.getName() %></td>
				<td><%= admin.getEmail() %></td>
				<td>
					<div class="btn-group">
							<button class="btn btn-secondary" data-ajax-modal="/admin/staffs/edit?id=<%= admin.getId() %>"><i class="fa fa-edit"></i></button>
							<button class="btn btn-danger" data-delete-id="<%= admin.getId() %>"><i class="fa fa-trash-alt"></i></button>
					</div>
				</td>
			</tr>
			<% } %>
		<% } %>
	</tbody>
</table>
<script defer>
    $(".admin-table").DataTable({
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
			text : "Do you want to delete this staff?",
			icon : "warning",
			showCancelButton: true,
			confirmButtonText: "Yes",
			cancelButtonText: "No"
		}).then((result)=>{
			if(result.isConfirmed){
				console.log(id)
				$("#ajax-form").attr("action",`/admin/staffs/delete?id=\${id}`);
				$("#ajax-form").attr("method","POST");
				$("#ajax-form").submit();
			}
		})
	})
</script>