<%@page import="java.util.ArrayList"%>
<%@page import="Models.Admin"%>
<% Admin admin = (Admin) request.getAttribute("staff"); %>
<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Edit Staff #<%= admin.getId() %></h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<form action="/admin/admins/edit" method="post">
			<input type="hidden" name="id" value="<%= admin.getId() %>">
			<div class="modal-body">
				<div class="form-group">
					<label for="admin_name">Name: </label>
					<input name="admin_name" type="text" class="form-control" placeholder="Enter Admin Name" maxlength="100" required value="<%= admin.getName() %>">
				</div>

				<div class="form-group">
					<label>Role: </label>
					<select name="admin_role" required class="form-control">
						<option value="">-- Select One Role --</option>
						<option value="admin" <%= admin.getRole().equals("admin") ? "selected" : "" %>>Admin</option>
						<option value="staff" <%= admin.getRole().equals("staff") ? "selected" : "" %>>Staff</option>	
					</select>
				</div>

                <div class="form-group">
					<label for="admin_email">Email: </label>
					<input name="admin_email" type="text" class="form-control" maxlength="100" required value="<%= admin.getEmail() %>" disabled>
				</div>

                <div class="form-group">
					<label for="admin_pass">Current Password: </label>
					<input name="admin_pass" type="password" class="form-control" placeholder="Enter Admin Password" maxlength="100" required value="<%= admin.getPassword() %>" disabled>
				</div>

                <div class="form-group">
					<label for="admin_pass">New Password: </label>
					<input name="admin_pass" type="password" class="form-control" placeholder="Enter Admin Password" maxlength="100">
				</div>

				<div class="form-group">
					<label for="admin_confirmpass">Confirm Password: </label>
					<input name="admin_confirmpass" type="password" class="form-control" placeholder="Enter Admin Password" maxlength="100">
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</form>
	</div>
</div>