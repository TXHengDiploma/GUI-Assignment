<%@page import="java.util.ArrayList"%>
<%@page import="Models.Product"%>
<% ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products"); %>
<table class="product-table display w-100">
	<thead>
		<th> </th>
		<th class="sorting">Name</th>
		<th class="sorting">Price</th>
		<th>Actions</th>
	</thead>
	<tbody>
		<% if(products.size() != 0){ %>
			<% for(Product product : products) { %> 
			<tr>
				<td class="text-center">
					<% if(product.getImageString() == null) { %>
							<i class="fa fa-guitar"></i>
					<% } else { %>
							<img src="<%= product.getImageString() %>" alt="Product Image" style="width: 40px; height: 40px;">
					<% } %>
				</td>
				<td><%= product.getName() %></td>
				<td><%= String.format("%.2f",product.getPrice()) %></td>
				<td>
					<div class="btn-group">
							<button class="btn btn-secondary" data-ajax-modal="/admin/products/edit?id=<%= product.getId() %>"><i class="fa fa-edit"></i></button>
							<button class="btn btn-danger" data-delete-id="<%= product.getId() %>"><i class="fa fa-trash-alt"></i></button>
					</div>
				</td>
			</tr>
			<% } %>
		<% } %>
	</tbody>
</table>
<script defer>
    $(".product-table").DataTable({
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
			text : "Do you want to delete this product?",
			icon : "warning",
			showCancelButton: true,
			confirmButtonText: "Yes",
			cancelButtonText: "No"
		}).then((result)=>{
			if(result.isConfirmed){
				console.log(id)
				$("#ajax-form").attr("action",`/admin/products/delete?id=\${id}`);
				$("#ajax-form").attr("method","POST");
				$("#ajax-form").submit();
			}
		})
	})
</script>