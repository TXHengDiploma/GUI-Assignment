<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="All categories"/>
</jsp:include>
<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#category-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		All categories
		<div class="float-right">
			<button data-ajax-modal="/admin/categories/add" class="btn btn-primary"><i class="fa fa-plus"></i> Add Category</button>
		</div>
	</div>
	<div class="card-body">
		<div data-ajax-html="/admin/categories/ajax_table" id="category-table"></div>
	</div>
</div>
<jsp:include page="/admin/footer.jsp"/>