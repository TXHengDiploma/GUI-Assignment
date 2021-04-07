<%@page import="java.util.ArrayList"%>
<%@page import="Models.Address"%>
<% ArrayList<Address> addresses = (ArrayList<address>) request.getAttribute("addresses"); %>
<table class="address-table display w-100">
	<thead>
		<th>Receiver Name</th>
		<th>Remark Name</th>
		<th>Email</th>
		<th>Phone Number</th>
		<th>Street</th>
		<th>City</th>
		<th>State</th>
		<th>Postal Code</th>
		<th>Actions</th>
	</thead>
	<tbody>
		<% if(addresses.size() != 0){ %>
			<% for(Address address : addresses) { %> 
			<tr>
				<td><%= address.getReceiverName() %></td>
				<td><%= address.getRemarkName() %></td>
				<td><%= address.getEmail() %></td>
				<td><%= address.getPhoneNumber() %></td>
				<td><%= address.getStreet() %></td>
				<td><%= address.getCity() %></td>
				<td><%= address.getState() %></td>
				<td><%= address.getPostalCode() %></td>
				<td>
					<div class="btn-group">
							<button class="btn btn-secondary" data-ajax-modal="/member/addresses/edit?id=<%= member.getId() %>"><i class="fa fa-edit"></i></button>
							<button class="btn btn-danger" data-delete-id="<%= member.getId() %>"><i class="fa fa-trash-alt"></i></button>
					</div>
				</td>
			</tr>
			<% } %>
		<% } %>
	</tbody>
</table>
<script defer>
    $(".member-table").DataTable({
		"columns": [
			{ "width": "30%" },
			{ "width": "30%" },
			{ "width": "30%" },
			{ "width": "30%" },
			{ "width": "30%" },
			{ "width": "30%" },
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
			text : "Do you want to delete this address?",
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