<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="My Orders"/>
</jsp:include>

<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#order-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		My Orders
	</div>
	<div class="card-body">
		<div data-ajax-html="/member/orders/ajax_table" id="order-table"></div>
	</div>
</div>
<script defer>
</script>
<jsp:include page="/member/footer.jsp"/>