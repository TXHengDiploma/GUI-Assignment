<%@page import="Models.Admin"%>
<% Admin admin = (Admin) session.getAttribute("admin"); %>
<jsp:include page="/admin/header.jsp">
  <jsp:param name="pageTitle" value="My Profile" />
</jsp:include>
<div class="row mt-5">
	<form action="/admin/profile/edit" method="post" class="col-lg-6 offset-lg-3">
	  <div class="jumbotron">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="admin_name">Name</label>
                <input name="admin_name" type="text" class="form-control" placeholder="Enter Admin Name" maxlength="100" required value="<%= admin.getName() %>">
            </div>
		</div>
		<div class="form-row">
            <div class="form-group col-md-6">
                <label for="admin_email">Email</label>
                <input name="admin_email" type="text" class="form-control" maxlength="100" required value="<%= admin.getEmail() %>" disabled>
            </div>
            <div class="form-group col-md-6">
                <label for="admin_role">Role</label>
                <input name="admin_role" type="text" class="form-control" maxlength="100" required value="<%= admin.getRole() %>" disabled>
            </div>
		</div>
		  <div class="form-group">
			<button type="submit" class="btn btn-primary btn-block">Edit</button>
		  </div>
		  <div class="form-group">
			<a href="/admin/profile/edit_pass" target="_blank" class="btn btn-secondary btn-block" data-toggle="tooltip" data-placement="bottom" title="Click here to reset password">Reset Password</a>
		  </div>
	</form>
  </div>
</div>
</div>
<jsp:include page="/admin/footer.jsp" />