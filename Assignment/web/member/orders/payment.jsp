<%@page import="java.util.Date, Models.Order"%>
<% Order order = (Order) request.getAttribute("order"); %>
<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Payment"/>
</jsp:include>

<article class="card">
	<div class="card-body p-5">
	<h2>Payment for Order #LMO<%= order.getId() %></h2>
	<h3>Amount to pay: RM <%= String.format("%.2f",order.getTotalPrice() + order.getShippingFee()) %></h3>
	
	<form action="/member/orders/payment?id=<%= order.getId() %>" method="POST">
	<div class="form-group">
		<label for="username">Full name (on the card)</label>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fa fa-user"></i></span>
			</div>
			<input type="text" class="form-control" id="username" name="username" placeholder="" required="">
		</div> <!-- input-group.// -->
	</div> <!-- form-group.// -->

	<div class="form-group">
		<label for="phonenum">Phone Number</label>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-phone-square-alt"></i></span>
			</div>
			<input type="text" class="form-control" id="phonenum" name="phonenum" placeholder="" required="">
		</div> <!-- input-group.// -->
	</div> <!-- form-group.// -->
	
	<div class="form-group">
		<label for="cardNumber">Card number</label>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fa fa-credit-card"></i></span>
			</div>
			<input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="" maxlength="16" minlength="16">
		</div> <!-- input-group.// -->
	</div> <!-- form-group.// -->
	
	<div class="row">
		<div class="col-sm-8">
			<div class="form-group">
				<label><span class="hidden-xs">Expiration</span> </label>
				<div class="form-inline">
					<select class="form-control" style="width:45%" required>
						<option>MM</option>
						<% for(int i = 1; i <= 12 ; i++ ) { %>
							<option value="<%= String.format("%02d",i) %>"><%= String.format("%02d",i) %></option>
						<% } %>
					</select>
					<span style="width:10%; text-align: center"> / </span>
					<select class="form-control" style="width:45%" required>
						<option>YY</option>
						<%
							Date d = new Date();
							int currentYear = d.getYear() + 1900;
							for(int i = currentYear; i <= currentYear + 10; i++) {
						%>
							<option value="<%= i %>"><%= i %></option>
						<% } %>
					</select>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV</label>
				<input class="form-control" required="" type="text" placeholder="420" maxlength="3" minlength="3">
			</div> <!-- form-group.// -->
		</div>
	</div> <!-- row.// -->
	<button class="subscribe btn btn-primary btn-block" type="submit">Confirm</button>
	</form>
	</div> <!-- card-body.// -->
	</article> <!-- card.// -->

<jsp:include page="/member/footer.jsp"/>