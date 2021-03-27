<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Main Page"/>
</jsp:include>
<table class="product-table display w-100">
	<thead>
        <th> </th>
		<th>Product</th>
        <th class="sorting">Name</th>
        <th class="sorting">Quantity</th>
        <th class="sorting">Price</th>
        <th class="sorting">Total</th>
        <th>Action</th>
	</thead>
	<tbody>
        <tr>
            <td><input type="checkbox" id="select" name="select" value=""></td>
            <td><img src="prod_pic/Screenshot 2021-03-24 235859.gif" width="200" height="200"></td>
            <td>Casio CTK-2500 Standard Keyboard (CTK2500)</td>
            <td>
            <div class="form-group" style="width:250px">
            <input type="number" value="2" min="1" max="100" step="1"/>
            </div>
            </td>
            <td>RM 750</td>
            <td>RM 1500</td>
            <td><button class="btn btn-danger" data-delete-id="#"><i class="fa fa-trash-alt"></i></button></td>
        </tr>
    </tbody>
  
</table>

<div class="float-right">
<button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="back"><i class="fas fa-cart-plus"></i> Continue Shopping
</button>
<button class="btn btn-primary" type="button">Payment</i></button>
</div>

<jsp:include page="/member/footer.jsp"/>