<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Product Page"/>
</jsp:include>

<div class="container">
	<!-- Search Product -->
	<div class="input-group mb-3 mt-3">
		<input type="text" class="form-control" id="search" placeholder="Search something...">
		<div class="input-group-append"><button class="btn btn-primary" type="button" id="search-btn"><i class="fas fa-search"></i></button></div>
	</div>
</div>
<!-- Page Features -->
<div id="product-list" data-ajax-html="/member/products/ajax_list" data-default-ajax-html="/member/products/ajax_list"></div>
<jsp:include page="/member/footer.jsp"/>
<script defer>
	let search = ()=>{
		$("#product-list").data("ajax-html", "/member/products/ajax_list?search="+$("#search").val())
		$("#product-list").ajax_html();
	}
	$("#search-btn").click(()=>search());
	
	let waitSearch;
	$("#search").keyup(
		()=>{
			clearTimeout(waitSearch);
			waitSearch = setTimeout(()=>search(),1000);
		}
	);
</script>