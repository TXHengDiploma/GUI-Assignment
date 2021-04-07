<%@page import="java.util.ArrayList"%>
<%@page import="Models.Brand"%>
<%@page import="Models.Pagination"%>
<% ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("brands"); %>
<% if(brands.size() != 0) { %>
	<div class="row text-center justify-content-center">
		<% for(Brand brand : brands) { %>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="<%= brand.getImageString() != null ? brand.getImageString() : "/public/img/no_pic.svg" %>" alt="<%= brand.getName() %>">
					<div class="card-body">
						<h4 class="card-title"><%= brand.getName() %></h4>
					</div>
					<div class="card-footer">
						<a href="/member/brands/detail?id=<%= brand.getId() %>" target="_blank" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="View Details">
							<i class="fas fa-eye"></i>
						</a>
					</div>
				</div>
			</div>
		<% } %>
	</div>
	<!-- /.row -->
	<% Pagination pagination = (Pagination)request.getAttribute("pagination"); %>
	<%= pagination.generateNav() %>
<% } else { %>
	<div class="row text-center justify-content-center">
		<div class="d-block">
			<h4>Oops... No Result Found</h4>
			<img src="/public/img/no_search_result.svg" alt="No results found" class="m-auto w-25">
		</div>
	</div>
<% } %>
