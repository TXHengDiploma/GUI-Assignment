<%@page import="java.util.ArrayList"%>
<%@page import="Models.Product"%>
<%@page import="Models.Pagination"%>
<% ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products"); %>
<% if(products.size() != 0) { %>
	<div class="row text-center justify-content-center">
		<% for(Product product : products) { %>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="<%= product.getImageString() != null ? product.getImageString() : "/public/img/no_pic.svg" %>" alt="<%= product.getName() %>">
					<div class="card-body">
						<h4 class="card-title"><%= product.getName() %></h4>
						<p class="card-text">RM <%= String.format("%.2f", product.getPrice()) %></p>
					</div>
					<div class="card-footer">
						<a href="/member/products/detail?id=<%= product.getId() %>" target="_blank" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="View Details">
							<i class="fas fa-eye"></i>
						</a>
						<button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="Add To Cart">
							<i class="fas fa-cart-plus"></i>
						</button>
						<button class="btn btn-primary" type="button">Buy Now!</i></button>
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
