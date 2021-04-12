<%
	int size = Integer.parseInt(String.valueOf(request.getAttribute("maxsize")));
	double[] results = (double[])request.getAttribute("results");
%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script defer>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart(){
		let options = {
			title: 'Sales Summary',
			width: 1500,
			height: 500
		}

		let data = google.visualization.arrayToDataTable([
			['Day','Sales Amount'],
			<% for(int i = 1; i <= size; i++ ) { %>
			['<%= i %>', <%= results[i] %>],
			<% } %>
		])

		let chart = new google.visualization.ColumnChart(document.getElementById('myChart'));
		chart.draw(data,options);
	}
</script>

<div id="myChart">

</div>