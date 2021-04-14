<jsp:include page="/admin/header.jsp">
  <jsp:param name="pageTitle" value="Password Reset" />
</jsp:include>
<div class="row mt-5">
<div class="col-lg-6 offset-lg-3">
    <form action="/admin/profile/edit_pass" method="post" >
      <div class="jumbotron">
        <div class="form-row">
          <div class="form-group col-12">
            <label for="inputPassword4">Current Password</label>
            <input name="admin_password_old" type="password" class="form-control" placeholder="Enter Current Password" required="required">
          </div>
          <div class="form-group col-12">
            <label for="inputPassword4">New Password</label>
            <input name="admin_password" type="password" class="form-control" placeholder="Enter New Password" required="required">
          </div>
          <div class="form-group col-12">
            <label for="inputPassword4">Confirm Password</label>
            <input name="admin_confirmpass" type="password" class="form-control" placeholder="Enter Confirm Password" required="required">
          </div>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block">Change Password</button>
        </div>
      </div>
    </form>
  </div>
</div>
  <jsp:include page="/admin/footer.jsp" />