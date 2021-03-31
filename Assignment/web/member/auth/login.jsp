<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Login"/>
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
  </head>
  <body>
  <div class="login-form">
      <form action="/member/auth/login" method="post">
          <h2 class="text-center">Log in</h2>       
          <div class="form-group">
              <input type="text" class="form-control" name="memberemail" placeholder="Email" required="required">
          </div>
          <div class="form-group">
              <input type="password" class="form-control" name="memberpassword" placeholder="Password" required="required">
          </div>
          <div class="form-group">
              <button type="submit" class="btn btn-primary btn-block">Log in</button>
          </div>
          <div class="clearfix">
              <label class="float-left form-check-label"><input type="checkbox"> Remember me</label>
              <a href="#" class="float-right">Forgot Password?</a>
          </div>        
      </form>
      <p class="text-center"><a href="/member/auth/signup.jsp">Create an Account</a></p>
  </div>

<jsp:include page="/member/footer.jsp"/>