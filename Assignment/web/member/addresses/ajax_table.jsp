<%@page import="java.util.ArrayList"%>
<%@page import="Models.Address"%>
<% ArrayList<Address> addresses = (ArrayList<Address>) request.getAttribute("addresses"); %>
<div class="row w-100">

	<% if(addresses.size() != 0){ %>
		<% for(Address address : addresses) { %> 
		<div class="card col-4">
			<div class="card-body">
				<h5 class="card-title"><%= address.getRemarkName() %></h5>
				<h6 class="card-subtitle mb-2 text-muted"><%= address.getReceiverName() %></h6>
				<h6 class="card-subtitle mb-2 text-muted"><%= address.getEmail() %> (<%= address.getPhoneNumber() %>)</h6>
				<p class="card-text"><%= address.getFullAddress() %></p>
			</div>
			<div class="card-footer">
				<div class="btn-group float-right">
					<button class="btn btn-secondary" data-ajax-modal="/member/addresses/edit?id=<%= address.getId() %>"><i class="fa fa-edit"></i></button>
					<button class="btn btn-danger" data-delete-id="<%= address.getId() %>"><i class="fa fa-trash-alt"></i></button>
				</div>
			</div>
		</div>
		<% } %>
	<% } else { %>
		<div class="col-12 text-center"><h3>You have no address!</h3></div>
	<% } %>

</div>
<script defer>

	$(document).on('click', "[data-delete-id]", function(){
		let id = $(this).data("delete-id");
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
				$("#ajax-form").attr("action",`/member/addresses/delete?id=\${id}`);
				$("#ajax-form").attr("method","POST");
				$("#ajax-form").submit();
			}
		})
	})
</script>