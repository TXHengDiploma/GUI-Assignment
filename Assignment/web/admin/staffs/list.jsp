<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="All Staffs"/>
</jsp:include>
<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#admin-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		All Staffs
		<div class="float-right">
			<a href="/admin/auth/signup?role=staff" class="btn btn-primary"><i class="fa fa-plus"></i> Add Staff</a>
		</div>
	</div>
	<div class="card-body">
		<div data-ajax-html="/admin/staffs/ajax_table" id="admin-table"></div>
	</div>
</div>
<jsp:include page="/admin/footer.jsp"/>