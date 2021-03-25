<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="All Products"/>
</jsp:include>
<div class="card">
	<div class="card-header">
		All Products
		<div class="float-right">
			<button data-ajax-modal="/admin/products/add" class="btn btn-primary"><i class="fa fa-plus"></i> Add Product</button>
		</div>
	</div>
	<div class="card-body">
		<div data-ajax-html="/admin/products/ajax_table" id="product-table"></div>
	</div>
</div>
<jsp:include page="/admin/footer.jsp"/>