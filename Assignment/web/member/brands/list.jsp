<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Brand Page"/>
</jsp:include>
<%@page import="Models.Brand"%>

<div class="container">
	<!-- Search Brand -->
	<div class="row">
		<div class="col-12">
			<div class="input-group mb-2">
				<input type="text" class="form-control" id="search" placeholder="Search something...">
				<div class="input-group-append"><button class="btn btn-primary" type="button" id="search-btn"><i class="fas fa-search"></i></button></div>
			</div>
		</div>
		<div class="col-3">
			<div class="input-group mb-2">
				<select name="brand" class="form-control">
					<option value="">-- Select A Brand --</option>
					<% for(Brand brand : Brand.all()) { %>
						<option value="<%= brand.getId() %>"><%= brand.getName() %></option>
					<% } %>
				</select>
			</div>
		</div>
	</div>
</div>


<!-- Page Features -->
<div id="brand-list" data-ajax-html="/member/brands/ajax_list" data-default-ajax-html="/member/brands/ajax_list"></div>
<jsp:include page="/member/footer.jsp"/>
<script defer>
		let search = ()=>{

		let filter = "";

		if($('[name="brand"]').val() != "" && $('[name="brand"]').val() != null && $('[name="brand"]').val() != undefined) {
			filter += `id=\${$('[name="brand"]').val()}@`;
		}

		$("#brand-list").data("ajax-html", `/member/brands/ajax_list?search=\${$("#search").val()}&filter=\${filter}`)
		$("#brand-list").ajax_html();
	}
	$("#search-btn").click(()=>search());
	
	let waitSearch;

	$("#search").keyup(
		()=>{
			clearTimeout(waitSearch);
			waitSearch = setTimeout(()=>search(),1000);
		}
	);

	$('[name="brand"]').change(()=>search());

</script>