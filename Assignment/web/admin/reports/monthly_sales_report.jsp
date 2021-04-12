<%@page import="java.util.Date"%>
<%
	Date today = new Date(System.currentTimeMillis());
	int month = request.getParameter("month") != null ? Integer.parseInt(request.getParameter("month")) : today.getMonth() + 1;
	int year = request.getParameter("year") != null ? Integer.parseInt(request.getParameter("year")) : today.getYear() + 1900;
%>
<jsp:include page="/admin/header.jsp">
	<jsp:param name="pageTitle" value="Monthly Sales Report"/>
</jsp:include>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div class="card">
	<div class="card-header">
		Sales Record
		<div class="form-row">
			<div class="form-group col-1">
				<select name="month" class="form-control">
					<% for(int i = 1; i <= 12; i++){ %>
					<option value="<%= i %>" <%= i == month ? "selected" : "" %> ><%= String.format("%02d",i) %></option>
					<% } %>
				</select>
			</div>
			<div class="form-group col-1">
				<select name="year" class="form-control">
					<% for(int i = 2021; i <= today.getYear() + 1900 ; i++){ %>
					<option value="<%= i %>" <%= i == year ? "selected" : "" %> ><%= i %></option>
					<% } %>
				</select>
			</div>
		</div>
	</div>
	<div class="card-body">
		<div id="report-content" data-ajax-html="/admin/reports/sales_chart?month=<%= month %>&year=<%= year %>"></div>
		<div id="order-table" data-ajax-html="/admin/orders/ajax_table?month=<%= month %>&year=<%= year %>"></div>
	</div>
</div>
<script>
	let updateChart = () => {
		let month = $('[name="month"]').val(), year = $('[name="year"]').val();
		$('#report-content').data('ajax-html', `/admin/reports/sales_chart?month=\${month}&year=\${year}`);
		$('#report-content').ajax_html();
		$('#order-table').data('ajax-html', `/admin/orders/ajax_table?month=\${month}&year=\${year}`);
		$('#order-table').ajax_html();
	}

	$('[name="month"], [name="year"]').change(()=>updateChart());

</script>
<jsp:include page="/admin/footer.jsp"/>