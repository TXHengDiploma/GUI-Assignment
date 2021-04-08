<%@page import="Models.Member"%>
<% Member member = (Member) session.getAttribute("member"); %>
<jsp:include page="/member/header.jsp">
  <jsp:param name="pageTitle" value="User Profile" />
</jsp:include>
<div class="row mt-5">
<div class="col-lg-6 offset-lg-3">
    <form form action="/member/profile/edit_pass" method="post" >
      <div class="jumbotron">
        <div class="card-header">
          Edit Password
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputPassword4">Old Password</label>
            <input name="member_password_old" type="password" class="form-control" placeholder="Enter Old Password" required="required">
          </div>
          <div class="form-group col-md-6">
            <label for="inputPassword4">New Password</label>
            <input name="member_password" type="password" class="form-control" placeholder="Enter New Password" required="required">
          </div>
          <div class="form-group col-md-6">
            <label for="inputPassword4">confirm New Password</label>
            <input name="member_confirmpass" type="password" class="form-control" placeholder="Enter Confirm Password" required="required">
          </div>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block">Change Password</button>
        </div>
      </div>
    </form>
  </div>
</div>
  <jsp:include page="/member/footer.jsp" />