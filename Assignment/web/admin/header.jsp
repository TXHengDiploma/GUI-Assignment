<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Admin"%>
<% 
	Admin admin = (Admin) session.getAttribute("admin"); 
	String[] urlSegments = request.getRequestURI().substring(request.getContextPath().length()+1).split("/"); 
%>
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

<body id="page-top" class="h-100">

	<form id="ajax-form"></form>
	<div class="modal" tabindex="-1" role="dialog" id="ajax-modal"></div>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
				<div class="sidebar-brand-icon">
					<img src="/public/img/logo/white.png" alt="Love Music Logo" style="width: 50px; height: 50px;">
				</div>
				<div class="sidebar-brand-text mx-3">Love Music</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item <%=urlSegments[1].equals("products") ? "active" : ""%>">
				<a class="nav-link collapsed" href="/admin/products/list.jsp">
					<i class="fas fa-fw fa-guitar"></i>
					<span>Products</span>
				</a>
			</li>

			<li class="nav-item <%=urlSegments[1].equals("categories") ? "active" : ""%>">
				<a class="nav-link collapsed" href="/admin/categories/list.jsp">
					<i class="fas fa-fw fa-sitemap"></i>
					<span>Categories</span>
				</a>
			</li>
			
			<li class="nav-item <%=urlSegments[1].equals("brands") ? "active" : ""%>">
				<a class="nav-link collapsed" href="/admin/brands/list.jsp">
					<i class="fas fa-drum"></i>
					<span>Brands</span>
				</a>
			</li>
			
			<li class="nav-item <%= urlSegments[1].equals("orders") ? "active" : ""%>">
				<a class="nav-link collapsed" href="/admin/orders/list.jsp">
					<i class="fas fa-truck"></i>
					<span>Orders</span>
				</a>
			</li>


			<li class="nav-item <%= urlSegments[1].equals("reports") ? "active" : ""%>">
				<a class="nav-link collapsed" href="/admin/reports/monthly_sales_report.jsp">
					<i class="fas fa-chart-line"></i>
					<span>Reports</span>
				</a>
			</li>

			<% if(admin.getRole().equals("admin")){ %>
			<li class="nav-item <%= urlSegments[1].equals("staffs") || urlSegments[1].equals("admins") ? "active" : ""%>">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-fw fa-cog"></i>
					<span>Maintain Staff</span>
				</a>
				<div id="collapseOne" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Role:</h6>
						<a class="collapse-item" href="/admin/admins/list.jsp">Admins</a>
						<a class="collapse-item" href="/admin/staffs/list.jsp">Staffs</a>
					</div>
				</div>
			</li>
			<% } %>

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<h3>${param.pageTitle}</h3>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= admin.getName() %></span>
								<img class="img-profile rounded-circle" src="/public/img/undraw_profile.svg">
							</a>
							<!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="/admin/profile/edit">
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
									My Profile 
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" data-logout="/admin/auth/logout">
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div>
						</li>
					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">