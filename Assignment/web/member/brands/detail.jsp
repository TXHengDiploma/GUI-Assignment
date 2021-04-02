<%@page import="java.util.ArrayList"%>
<%@page import="Models.Brand"%>
<% Brand brand = (Brand) request.getAttribute("brand"); %>
<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Brand Detail Page"/>
</jsp:include>

<!-- Page Features -->
<script src="/public/vendor/input-spinner/input-spinner.js"></script>
<div class="container" id="brand-section">
	<div class="row">
		<div class="col-md-6">
			<img class="img-thumbnail w-100 rounded" src="<%= brand.getImageString() != null ? brand.getImageString() : "/public/img/no_pic.svg" %>" alt="Image of <%= brand.getName() %>" >
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">
					<h1><%= brand.getName() %></h1>
					<hr>
					<b><p class="card-text"><%= brand.getDescription() %></p></b>

					<a href="/member/products/list.jsp?filter=brandId=<%= brand.getId() %>"><button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="View Products"><i class="fas fa-eye"></i> View Products
					</button>

				</div>
			</div>
		</div>
	</div>
<%--<div id="product-list" data-ajax-html="/member/products/ajax_list?filter=brandId=<%= brand.getId() %>" data-default-ajax-html="/member/products/ajax_list"></div>--%>	
</div>
<script defer>
	$(document).ready(function () {
		$("input[type='number']").inputSpinner({});
	})
</script>
<jsp:include page="/member/footer.jsp"/>