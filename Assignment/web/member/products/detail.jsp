<%@page import="java.util.ArrayList"%>
<%@page import="Models.Product, Models.Brand, Models.Category"%>
<% 
	Product product = (Product) request.getAttribute("product"); 
	Brand brand = product.getBrand();
	Category category = product.getCategory();
%>
<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Product Detail Page"/>
</jsp:include>

<!-- Page Features -->
<script src="/public/vendor/input-spinner/input-spinner.js"></script>
<div class="container" id="product-section">
	<div class="row">
		<div class="col-md-6">
			<img class="img-thumbnail w-100 rounded" src="<%= product.getImageString() != null ? product.getImageString() : "/public/img/no_pic.svg" %>" alt="Image of <%= product.getName() %>" >
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">
					<h1><%= product.getName() %></h1>
					<hr>
					<b><p class="card-text"><%= product.getDescription() %></p></b>
					<!-- display product catagory -->
					<p>Category: <a href="/member/products/list.jsp?filter=categoryId=<%= product.getCategoryId() %>" target="_blank" class="btn btn-primary"><i class="fa fa-<%= category.getIcon() %>"></i> <%= category.getName() %></a></p>
					<p>Brand: <a href="/member/products/list.jsp?filter=brandId=<%= product.getBrandId() %>" target="_blank" class="btn btn-primary"><%= brand.getName() %></a></p>
					<p class="card-text">RM <%= String.format("%.2f",product.getPrice()) %></p>
					

					<div class="form-group" style="width:250px">
						<p>Quantity :</p>
					<input type="number" value="1" min="1" max="100" step="1"/>
					</div>
					
					
					<button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="Add To Cart"><i class="fas fa-cart-plus"></i> Add To Cart
					</button>
					<button class="btn btn-primary" type="button">Buy Now!</i></button>

				</div>
			</div>
		</div>
	</div>
</div>
<script defer>
	$(document).ready(function () {
		$("input[type='number']").inputSpinner({});
	})
</script>
<jsp:include page="/member/footer.jsp"/>