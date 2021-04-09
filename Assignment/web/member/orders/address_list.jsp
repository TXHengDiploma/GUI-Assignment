<%@page import="java.util.ArrayList, Models.Address"%>
<% ArrayList<Address> addresses = (ArrayList<Address>) request.getAttribute("addresses"); %>
<% if(addresses.size() != 0) { %>
	<% for(Address address : addresses){ %>
		<div class="col-4">
			<div class="form-check">
				<input class="form-check-input" type="radio" name="addressId" value="<%= address.getId() %>" id="address<%= address.getId() %>">
				<label class="form-check-label" data-toggle="tooltip" title="<%= address.getFullAddress() %>" for="address<%= address.getId() %>">
					<%= address.getRemarkName() %>
				</label>
			</div>
		</div>
	<% } %>
<% } else { %>
	<h5 class="w-100 text-center">You do not have an address! Please add an address to proceed</h5>
<% } %>