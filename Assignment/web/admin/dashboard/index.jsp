<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="Dashboard"/>
</jsp:include>

	<button class="btn btn-primary" data-ajax-modal="/admin/dashboard/ajax-modal.jsp"> Open Modal </button>
	<div data-ajax-html="/admin/dashboard/ajax-content.jsp"></div>

<jsp:include page="/admin/footer.jsp"/>