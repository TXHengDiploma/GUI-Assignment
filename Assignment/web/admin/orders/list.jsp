<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="All Orders"/>
</jsp:include>
<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#order-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		All Orders
	</div>
	<div class="card-body">
		<div data-ajax-html="/admin/orders/ajax_table" id="order-table"></div>
	</div>
</div>
<jsp:include page="/admin/footer.jsp"/>