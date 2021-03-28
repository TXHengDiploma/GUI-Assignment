<%@page import="java.util.ArrayList"%>
<%@page import="Models.Brand"%>
<% ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("brands"); %>
<table class="brand-table display w-100">
	<thead>
		<th> </th>
		<th class="sorting">Name</th>
		<th>Actions</th>
	</thead>
	<tbody>
		<% if(brands.size() != 0){ %>
			<% for(Brand brand : brands) { %> 
			<tr>
				<td class="text-center">
					<% if(brand.getImageString() == null) { %>
							<i class="fa fa-guitar"></i>
					<% } else { %>
							<img src="<%= brand.getImageString() %>" alt="Brand Image" style="width: 40px; height: 40px;">
					<% } %>
				</td>
				<td><%= brand.getName() %></td>
				<td>
					<div class="btn-group">
							<button class="btn btn-secondary" data-ajax-modal="/admin/brands/edit?id=<%= brand.getId() %>"><i class="fa fa-edit"></i></button>
							<button class="btn btn-danger" data-delete-id="<%= brand.getId() %>"><i class="fa fa-trash-alt"></i></button>
					</div>
				</td>
			</tr>
			<% } %>
		<% } %>
	</tbody>
</table>
<script defer>
    $(".brand-table").DataTable({
		"columns": [
			{ "width": "3%", "orderable": false },
			{ "width": "30%" },
			{ "width": "25%", "orderable": false },
		]
	});

	$(document).on('click', "[data-delete-id]", function(){
		let id = $(this).data("delete-id");
		console.log(id);
		Swal.fire({
			title: "Are you sure?",
			text : "Do you want to delete this brand?",
			icon : "warning",
			showCancelButton: true,
			confirmButtonText: "Yes",
			cancelButtonText: "No"
		}).then((result)=>{
			if(result.isConfirmed){
				console.log(id)
				$("#ajax-form").attr("action",`/admin/brands/delete?id=\${id}`);
				$("#ajax-form").attr("method","POST");
				$("#ajax-form").submit();
			}
		})
	})
</script>