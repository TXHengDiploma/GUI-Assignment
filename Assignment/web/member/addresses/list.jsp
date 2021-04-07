<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Address information"/>
</jsp:include>

<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#address-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		My Addresses
		<div class="float-right">
			<button data-ajax-modal="/member/addresses/add" class="btn btn-primary"><i class="fa fa-plus"></i> Add Address</button>
		</div>
	</div>
	<div class="card-body">
		<div data-ajax-html="/member/addresses/ajax_table" id="address-table"></div>
	</div>
</div>

<script>
</script>

<jsp:include page="/member/footer.jsp"/>