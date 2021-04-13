<%@page import="Models.Member"%>
<% Member member = (Member) session.getAttribute("member"); %>
<jsp:include page="/member/header.jsp">
  <jsp:param name="pageTitle" value="User Profile" />
</jsp:include>
<div class="row mt-5">
	<form action="/member/profile/edit" method="post" class="col-lg-6 offset-lg-3">
	  <div class="jumbotron">
		<div class="card-header">
		  User Profile
		</div>
		<div class="form-row">
		  <div class="form-group col-md-6">
			<label for="inputPassword4">Email</label>
			<input disabled class="form-control" required value="<%= member.getEmail() %>">
		  </div>
		  <div class="form-group col-md-6">
			<label for="inputPassword4">Name</label>
			<input name="member_name" class="form-control" placeholder="Password" required value="<%= member.getName() %>">
		  </div>
		</div>
		<div class="form-row">
		  <div class="form-group col-md-6">
			<label for="inputState">Gender</label>
			<select name="member_gender" class="form-control" >
			  <option value="female" <%= member.getGender() == "female" ? "selected" : "" %>>Female</option>
			  <option value="male" <%= member.getGender() == "male" ? "selected" : "" %>>Male</option>
			</select>
		  </div>
		  <div class="form-group col-md-6">
			<label for="example-date-input">Date</label>
			  <input name="member_birthday" class="form-control" type="date" id="example-date-input" value="<%= member.getBirthday() != null ? member.getBirthday().toString() : "" %>">
		  </div>
		</div>
		  <div class="form-group">
			<button type="submit" class="btn btn-primary btn-block">Edit</button>
		  </div>
		  <div class="form-group">
			<a href="/member/profile/edit_pass" target="_blank" class="btn btn-secondary btn-block" data-toggle="tooltip" data-placement="bottom" title="Click here to reset password">Reset Password</a>
		  </div>
	</form>
  </div>
</div>
</div>
<jsp:include page="/member/footer.jsp" />