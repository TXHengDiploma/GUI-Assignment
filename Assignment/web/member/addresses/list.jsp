<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Address information"/>
</jsp:include>

<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.js"></script>

<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#address-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		Address Information
		<div class="float-right">
			<button data-ajax-modal="/member/addresses/add" class="btn btn-primary"><i class="fa fa-plus"></i> Add Address</button>
		</div>
	</div>

</div>

<script>
// <!-- show tooltip -->
  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({placement: "right"});   
  });

// <!-- tooltip automadically show when page load -->
  $('label').tooltip({
    trigger: 'manual'
  });
  $(document).ready(function() {
      $('label').tooltip('show');
      setTimeout(function(){ $('label').tooltip('hide'); }, 3000);
  });

  // <!-- tooltip show when mouse scroll -->
  $(document).ready(function(){
      $(window).on("scroll", function(){
        $('[data-toggle="tooltip"]').tooltip().mouseover();
        setTimeout(function(){ $('[data-toggle="tooltip"]').tooltip('hide'); }, 3000);
      });
  });
</script>

<jsp:include page="/member/footer.jsp"/>