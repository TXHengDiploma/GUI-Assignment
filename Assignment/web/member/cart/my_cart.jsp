<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="My Cart"/>
</jsp:include>

<div class="card">
	<div class="card-header">
		<button data-ajax-reload="#cart-table" class="btn btn-sm btn-default"><i class="fa fa-sync-alt"></i></button>
		My Cart
	</div>
	<div class="card-body">
		<div data-ajax-html="/member/myCart/ajax_table" id="cart-table"></div>
	</div>
	<div class="card-footer">
		<div class="row justify-content-end">
			<div class="col-md-3 col-xs-12"><h5>Total Product Selected: </h5></div>
			<div class="col-md-3 col-xs-12 text-warning" data-product-selected>0</div>
			<div class="col-md-3 col-xs-12"><h5>Total Price: </h5></div>
			<div class="col-md-3 col-xs-12 text-success">RM <span data-total-price>0.00</span></div>
		</div>
		<div class="row">
			<div class="col-md-3 col-xs-12"><button class="btn btn-block btn-primary" data-check-out><i class="fa fa-cash-register"></i> Check Out</button></div>
		</div>
	</div>
</div>
<script defer>
	let ajax_update_quantity = [], lastId = null, lastQuantity;

	$("[data-check-out]").click(function(){
		
		let result = [];
		if($('[data-cart-id]:checked').length == 0){
			Swal.fire({
				title: "Oops...",
				text : "You must select at least one item before you check out",
				icon : "error"
			});
			return;
		}
		$('[data-cart-id]:checked').each(function(index){
			result.push($(this).data('cart-id'));
		});

		location.href = "/member/orders/new?carts="+result.join(",");
	});
	
	function updateFinalResult(){
		let checkboxes = $('[data-cart-id]:checked');
		$('[data-product-selected]').text(checkboxes.length);
		let totalPrice = 0;
		checkboxes.each(function(index){
			totalPrice += $(this).data('product-price') * $(this).data('product-quantity');
		});
		$('[data-total-price]').text(totalPrice.toFixed(2));
	}

	$(document).on('click', '[data-cart-id]',function(){
		updateFinalResult();
	});

	$(document).on('click','[data-select-all]',function(){
		let selectAll = $(this);
		$('[data-cart-id]').each(function(index){
			$(this).prop('checked', selectAll.prop("checked"));
		});
		updateFinalResult();
	})

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
		updateFinalResult();
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