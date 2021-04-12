<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Product"/>
</jsp:include>
<%@page import="Models.Brand"%>
<%@page import="Models.Category"%>
<div class="container">
	<!-- Search Product -->
	<div class="row">
		<div class="col-12">
			<div class="input-group mb-2">
				<input type="text" class="form-control" id="search" placeholder="Search something...">
				<div class="input-group-append"><button class="btn btn-primary" type="button" id="search-btn"><i class="fas fa-search"></i></button></div>
			</div>
		</div>
		<div class="col-3">
			<div class="input-group mb-2">
				<select name="brand" class="form-control">
					<option value="">-- Select A Brand --</option>
					<% for(Brand brand : Brand.all()) { %>
						<option value="<%= brand.getId() %>"><%= brand.getName() %></option>
					<% } %>
				</select>
			</div>
		</div>
		<div class="col-3">
			<div class="input-group mb-2">
				<select name="category" class="form-control">
					<option value="">-- Select A Category --</option>
					<% for(Category category : Category.all()) { %>
						<option value="<%= category.getId() %>"><%= category.getName() %></option>
					<% } %>
				</select>
			</div>
		</div>
	</div>
</div>
<!-- Page Features -->
<div id="product-list" data-ajax-html="/member/products/ajax_list?<%= request.getParameter("search") != null ? "search=" + request.getParameter("search") + "&" : "" %><%= request.getParameter("filter") != null ? "filter=" + request.getParameter("filter") + "&" : "" %>"></div>
<jsp:include page="/member/footer.jsp"/>
<script defer>
	let search = ()=>{

		let filter = "";

		if($('[name="brand"]').val() != "" && $('[name="brand"]').val() != null && $('[name="brand"]').val() != undefined) {
			filter += `brandId=\${$('[name="brand"]').val()}@`;
		}

		if($('[name="category"]').val() != "" && $('[name="category"]').val() != null && $('[name="category"]').val() != undefined) {
			filter += `categoryId=\${$('[name="category"]').val()}@`;
		}

		$("#product-list").data("ajax-html", `/member/products/ajax_list?search=\${$("#search").val()}&filter=\${filter}`)
		$("#product-list").ajax_html();
	}
	$("#search-btn").click(()=>search());
	
	let waitSearch;

	$("#search").keyup(
		()=>{
			clearTimeout(waitSearch);
			waitSearch = setTimeout(()=>search(),1000);
		}
	);
	
	$('[name="category"]').change(()=>search());
	$('[name="brand"]').change(()=>search());

	$(document).on('click', '[data-add-to-cart]', function(e){
		e.preventDefault();
		$('#ajax-form').attr('action', $(this).data('add-to-cart'));
		$('#ajax-form').attr('method', 'POST');
		$('#ajax-form').submit();
	})
</script>