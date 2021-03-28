<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="All Brands"/>
</jsp:include>
<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#brand-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		All Brands
		<div class="float-right">
			<button data-ajax-modal="/admin/brands/add" class="btn btn-primary"><i class="fa fa-plus"></i> Add Brand</button>
		</div>
	</div>
	<div class="card-body">
		<div data-ajax-html="/admin/brands/ajax_table" id="brand-table"></div>
	</div>
</div>
<jsp:include page="/admin/footer.jsp"/>