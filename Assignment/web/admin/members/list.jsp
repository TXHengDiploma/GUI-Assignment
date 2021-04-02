<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="All Members"/>
</jsp:include>
<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#members-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		All Member
	</div>
	<div class="card-body">
		<div data-ajax-html="/admin/members/ajax_table" id="members-table"></div>
	</div>
</div>
<jsp:include page="/admin/footer.jsp"/>