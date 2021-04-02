<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Login - Love Music</title>
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/jpg" href="/public/img/logo/icon.png"/>

	<!-- Start CSS -->
	<!-- Custom fonts for this template-->
	<link href="/public/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
	<link href="/public/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link href="/public/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
	<link href="/public/css/font.css" rel="stylesheet">
	<link href="/public/css/app.css" rel="stylesheet">
	<!-- End CSS -->

	<!-- Start JavaScript -->
	<script src="/public/vendor/jquery/jquery.min.js" defer></script>
	<script src="/public/vendor/bootstrap/js/bootstrap.bundle.min.js" defer></script>
	<script src="/public/vendor/jquery-easing/jquery.easing.min.js" defer></script>
	<script src="/public/vendor/datatables/jquery.dataTables.min.js" defer></script>
	<script src="/public/vendor/datatables/dataTables.bootstrap4.min.js" defer></script>
	<script src="/public/vendor/parsleyjs/parsley.min.js" defer></script>
	<script src="/public/vendor/notify/notify.min.js"  defer></script>
	<script src="/public/vendor/sweetalert2/dist/sweetalert2.all.min.js"  defer></script>
	<script src="/public/js/app.js" defer></script>
	<!-- End JavaScript -->

</head>
<style>
body {
    color: #fff;
    background: #fff;
}
.form-control {
    min-height: 41px;
    background: #fff;
    box-shadow: none !important;
    border-color: #e3e3e3;
}
.form-control:focus {
    border-color:var(--blue);
}
.form-control, .btn {        
    border-radius: 2px;
}
.login-form {
    width: 350px;
    margin: 0 auto;
    padding: 100px 0 30px;		
}
.login-form form {
    color: #7a7a7a;
    border-radius: 2px;
    margin-bottom: 15px;
    font-size: 13px;
    background: #ececec;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;	
    position: relative;	
}
.login-form h2 {
    font-size: 22px;
    margin: 35px 0 25px;
}
.login-form .avatar {
    position: absolute;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: -50px;
    width: 95px;
    height: 95px;
    border-radius: 50%;
    z-index: 9;
    background:var(--blue);
    padding: 15px;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
}
.login-form .avatar img {
    width: 100%;
}	
.login-form input[type="checkbox"] {
    position: relative;
    top: 1px;
}
.login-form .btn, .login-form .btn:active {        
    font-size: 16px;
    font-weight: bold;
    background:var(--blue) !important;
    border: none;
    margin-bottom: 20px;
}
.login-form .btn:hover, .login-form .btn:focus {
    background: var(--blue) !important;
}    
.login-form a {
    color: #fff;
    text-decoration: underline;
}
.login-form a:hover {
    text-decoration: none;
}
.login-form form a {
    color: #7a7a7a;
    text-decoration: none;
}
.login-form form a:hover {
    text-decoration: underline;
}
.login-form .bottom-action {
    font-size: 14px;
}
</style>
<body>
    <div class="container" style="padding-top: 60px; min-height: calc(100% - 70px);">
        <div class="login-form">
            <form action="/admin/auth/login" method="post">
                <div class="avatar text-light d-flex justify-content-center align-item-center">
                    <i class="fas fa-user" style="font-size: 50px;"></i>
                </div>
                <h2 class="text-center">Admin Login</h2>   
                <div class="form-group">
                    <input type="text" class="form-control" name="admin_email" placeholder="Email" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="admin_pass" placeholder="Password" required="required">
                </div>        
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
                </div>
                <div class="bottom-action clearfix">
                    <label class="float-left form-check-label"><input type="checkbox"> Remember me</label>
                    <a href="#" class="float-right">Forgot Password?</a>
                </div>
            </form>
        </div>
    </div>
</body>
