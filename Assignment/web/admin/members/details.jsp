<%@page import="Models.Member"%>
<% Member member = (Member) request.getAttribute("member"); %>
<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="Member Details"/>
</jsp:include>
<div class="card">
	<div class="card-header">
		Member Details
	</div>
	<div class="card-body">
		<form>
			<div class="form-row">
				<div class="form-group col-md-6">
				<label>Member Id</label>
				<input type="text" class="form-control" disabled value="LMM<%= member.getId() %>">
				</div>
				<div class="form-group col-md-6">
				<label>Member Name</label>
				<input type="text" class="form-control" disabled value="<%= member.getName() %>">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
				<label>Email</label>
				<input type="text" class="form-control" disabled  value="<%= member.getEmail() %>">
				</div>
				<div class="form-group col-md-6">
				<label>Gender</label>
				<input type="text" class="form-control" disabled value="<%= member.getGender() != null ? member.getGender() : "-" %>">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
				<label>Birthday</label>
				<input type="text" class="form-control" disabled value="<%= member.getBirthday() != null ? member.getBirthday().toString() : "-" %>">
				</div>
				<div class="form-group col-md-6">
				<label>Total Number of Orders</label>
				<input type="text" class="form-control" disabled value="<%= member.getOrders().size() %>">
				</div>
			</div>
		</form>
	</div>
</div>
<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#order-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		Orders History
	</div>
	<div class="card-body">
		<div data-ajax-html="/admin/orders/ajax_table?memberId=<%= member.getId() %>" id="order-table"></div>
	</div>
</div>
<jsp:include page="/admin/footer.jsp"/>