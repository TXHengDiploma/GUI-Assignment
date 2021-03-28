<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Main Page"/>
</jsp:include>
<style>
  .login-form {
      width: 340px;
      margin: 50px auto;
      font-size: 15px;
  }
  .login-form form {
      margin-bottom: 15px;
      background: #f7f7f7;
      box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
      padding: 30px;
  }
  .login-form h2 {
      margin: 0 0 15px;
  }
  .form-control, .btn {
      min-height: 38px;
      border-radius: 2px;
  }
  .btn {        
      font-size: 15px;
      font-weight: bold;
  }
  </style>
<div class="login-form">
    <form action="/member/auth/signup" method="post">
		<h2>Sign Up</h2>
        <div class="form-group">
        	<input type="text" class="form-control" name="member_name" placeholder="Username" required="required">
        </div>
        <div class="form-group">
        	<input type="email" class="form-control" name="member_email" placeholder="Email" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="member_password" placeholder="Password" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="member_confirmpass" placeholder="Confirm Password" required="required">
        </div>        
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
        </div>
    </form>
</div>
<!-- /.row -->

<jsp:include page="/member/footer.jsp"/>