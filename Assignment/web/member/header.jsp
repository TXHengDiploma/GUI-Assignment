<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Member"%>
<% Member member = session.getAttribute("member") != null ? (Member) session.getAttribute("member") : null; %>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>${param.pageTitle} - Love Music</title>
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/png" href="/public/img/logo/icon.png"/>

	<!-- Start CSS -->
	<!-- Custom fonts for this template-->
	<link href="/public/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
	<link href="/public/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link href="/public/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
	<link href="/public/css/font.css" rel="stylesheet">
	<link href="/public/css/app.css" rel="stylesheet">
	<!-- End CSS -->

	<!-- Start JavaScript -->
	<script src="/public/vendor/jquery/jquery.min.js"></script>
	<script src="/public/vendor/bootstrap/js/bootstrap.bundle.min.js" defer></script>
	<script src="/public/vendor/jquery-easing/jquery.easing.min.js" defer></script>
	<script src="/public/vendor/datatables/jquery.dataTables.min.js" defer></script>
	<script src="/public/vendor/datatables/dataTables.bootstrap4.min.js" defer></script>
	<script src="/public/vendor/parsleyjs/parsley.min.js" defer></script>
	<script src="/public/vendor/notify/notify.min.js"  defer></script>
	<script src="/public/vendor/sweetalert2/dist/sweetalert2.min.js"  defer></script>
	<script src="/public/js/app.js" defer></script>
	<!-- End JavaScript -->

</head>

<body id="page-top">
	<form id="ajax-form"></form>
	<div class="modal" tabindex="-1" role="dialog" id="ajax-modal"></div>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#"><img src="/public/img/logo/white.png" alt="Love Music Logo" style="width: 35px; height: 35px;" /> Love Music</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="/"><i class="fa fa-home"></i> Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/member/products/list.jsp"><i class="fa fa-drum"></i> Products</a>
					</li>
					<% if(member == null){ %>
						<li class="nav-item">
							<a class="nav-link" href="/member/auth/login">Sign In / Sign Up</a>
						</li>
					<% } else { %>
						<li class="nav-item">
							<a class="nav-link" href="/member/myCart"><i class="fa fa-shopping-cart"></i> My Carts</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/member/orders/list"><i class="fa fa-truck"></i> My Orders</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="member-profile-dropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Welcome, ${member.name}
							</a>
							<div class="dropdown-menu" aria-labelledby="member-profile-dropdown">
							<a class="dropdown-item" href="/member/profile/edit">My Profile</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" data-logout="/member/auth/logout">Logout</a>
							</div>
						</li>
					<% } %>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container" style="padding-top: 80px; min-height: calc(100% - 85px);">