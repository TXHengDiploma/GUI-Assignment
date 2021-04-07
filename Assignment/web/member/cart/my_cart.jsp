<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Main Page"/>
</jsp:include>

<div class="card-header">
	<button data-ajax-reload="#cart-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
	My Cart
</div>
<div class="card-body">
	<div data-ajax-html="/member/myCart/ajax_table" id="cart-table"></div>
</div>
<script defer>
	let ajax_update_quantity = [], lastId = null, lastQuantity;

	$(document).on('change', "[data-number]", function(){
		let cartId = $(this).data('number'), quantity = $(this).val();

		$(`[data-cart-id='\${cartId}']`).data('product-quantity', quantity);
		$(`[data-price-id='\${cartId}']`).text( ($(this).data('price') * quantity).toFixed(2) )
		if(lastId == null) {
			lastId = cartId;
			lastQuantity = quantity;
			ajax_update_quantity = setTimeout(()=>{
				updateCart(cartId, quantity);
				lastId = null;
				lastQuantity = null;
			}, 1000);
		} else if (lastId == cartId) {
			clearTimeout(ajax_update_quantity);
			lastId = cartId;
			lastQuantity = quantity;
			ajax_update_quantity = setTimeout(()=>{
				updateCart(cartId, quantity);
				lastId = null;
				lastQuantity = null;
			}, 1000);
		} else {
			clearTimeout(ajax_update_quantity);
			updateCart(lastId, lastQuantity);
			lastId = cartId;
			lastQuantity = quantity;
			ajax_update_quantity = setTimeout(()=>{
				updateCart(cartId, quantity);
				lastId = null;
				lastQuantity = null;
			}, 1000);
		}
	});

	function updateCart(cartId, quantity){
		$("#ajax-form").attr("action",`/member/cart/update?id=\${cartId}&quantity=\${quantity}`);
		$("#ajax-form").attr("method","POST");
		$("#ajax-form").submit();
	}

		$(document).on('click', "[data-delete-id]", function(){
		let id = $(this).data("delete-id");
		console.log(id);
		Swal.fire({
			title: "Are you sure?",
			text : "Do you want to remove this product from your cart?",
			icon : "warning",
			showCancelButton: true,
			confirmButtonText: "Yes",
			cancelButtonText: "No"
		}).then((result)=>{
			if(result.isConfirmed){
				$("#ajax-form").attr("action",`/member/cart/delete?id=\${id}`);
				$("#ajax-form").attr("method","POST");
				$("#ajax-form").submit();
			}
		})
	})
</script>
<jsp:include page="/member/footer.jsp"/>