<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="Admin Sign Up"/>
</jsp:include>
<style>
/* .signup-form {
    width: 400px;
    margin: 0 auto;
    padding: 30px 0;		
}
.signup-form form {
    color: #7a7a7a;
    border-radius: 3px;
    margin-bottom: 15px;
    background: #fff;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;
}
.signup-form h2 {
    color: #7a7a7a;
    font-weight: bold;
    margin-top: 0;
}
.signup-form hr {
    margin: 0 -30px 20px;
}
.signup-form .form-group {
    margin-bottom: 20px;
}
.signup-form label {
    font-weight: normal;
    font-size: 15px;
}
.signup-form .form-control {
    min-height: 38px;
    box-shadow: none !important;
}	
.signup-form .input-group-addon {
    max-width: 42px;
    text-align: center;
}	
.signup-form .btn, .signup-form .btn:active {        
    font-size: 16px;
    font-weight: bold;
    background: #81cac8 !important;
    border: none;
    min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
    background: #3c908d !important;
}
.signup-form a {
    color: #fff;	
    text-decoration: underline;
}
.signup-form a:hover {
    text-decoration: none;
}
.signup-form form a {
    color: #19aa8d;
    text-decoration: none;
}	
.signup-form form a:hover {
    text-decoration: underline;
}
.signup-form .fa {
    font-size: 21px;
}
.signup-form .fa-paper-plane {
    font-size: 18px;
}
.signup-form .fa-check {
    color: #fff;
    left: 17px;
    top: 18px;
    font-size: 7px;
    position: absolute;
} */
</style>

<div class="signup-form d-flex justify-content-center align-item-center">
    <div class="card">
    <form action="/admin/auth/signup" method="post">
        <input type="hidden" name="role" value="<%= request.getParameter("role") %>">
        <div class="card-header"><h2>Sign Up</h2></div>
        <div class="card-body">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">
                        <span class="fa fa-user"></span>
                    </span>                    
                </div>
                <input type="text" class="form-control" name="admin_name" placeholder="Username" required="required">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-envelope"></i>
                    </span>                    
                </div>
                <input type="email" class="form-control" name="admin_email" placeholder="Email Address" required="required">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fa fa-lock"></i>
                    </span>                    
                </div>
                <input type="password" class="form-control" name="admin_password" placeholder="Password" required="required">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fa fa-lock"></i>
                        <i class="fa fa-check"></i>
                    </span>                    
                </div>
                <input type="password" class="form-control" name="admin_confirmpass" placeholder="Confirm Password" required="required">
            </div>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block">Sign Up</button>
        </div>
    </div>
    </form>
</div>
</div>

<jsp:include page="/admin/footer.jsp"/>


