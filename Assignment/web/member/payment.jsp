<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Main Page"/>
</jsp:include>

<article class="card">
    <div class="card-body p-5">
    <h3>Payment</h3>

    <p class="alert alert-success">Some text success or error / Display total Payment</p>
    
    <form role="form">
    <div class="form-group">
    <label for="username">Full name (on the card)</label>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="fa fa-user"></i></span>
        </div>
        <input type="text" class="form-control" name="username" placeholder="" required="">
    </div> <!-- input-group.// -->
    </div> <!-- form-group.// -->

    
    <div class="form-group">
    <label for="address">Address for delivery</label>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
        </div>
        <input type="text" class="form-control" name="address" placeholder="" required="">
    </div> <!-- input-group.// -->
    </div> <!-- form-group.// -->

    <div class="form-group">
    <label for="username">Phone Number</label>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-phone-square-alt"></i></span>
        </div>
        <input type="text" class="form-control" name="phonenum" placeholder="" required="">
    </div> <!-- input-group.// -->
    </div> <!-- form-group.// -->
    
    <div class="form-group">
    <label for="cardNumber">Card number</label>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="fa fa-credit-card"></i></span>
        </div>
        <input type="text" class="form-control" name="cardNumber" placeholder="">
    </div> <!-- input-group.// -->
    </div> <!-- form-group.// -->
    
    <div class="row">
        <div class="col-sm-8">
            <div class="form-group">
                <label><span class="hidden-xs">Expiration</span> </label>
                <div class="form-inline">
                    <select class="form-control" style="width:45%">
                      <option>MM</option>
                      <option>01 - January</option>
                      <option>02 - February</option>
                      <option>03 - March</option>
                      <option>04 - April</option>
                      <option>05 - May</option>
                      <option>06 - June</option>
                      <option>07 - July</option>
                      <option>08 - August</option>
                      <option>09 - September</option>
                      <option>10 - October</option>
                      <option>11 - November</option>
                      <option>12 - December</option>
                    </select>
                    <span style="width:10%; text-align: center"> / </span>
                    <select class="form-control" style="width:45%">
                      <option>YY</option>
                      <option>2021</option>
                      <option>2022</option>
                      <option>2023</option>
                      <option>2024</option>
                      <option>2025</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV</label>
                <input class="form-control" required="" type="text">
            </div> <!-- form-group.// -->
        </div>
    </div> <!-- row.// -->
    <button class="subscribe btn btn-primary btn-block" type="button"> Confirm  </button>
    </form>
    </div> <!-- card-body.// -->
    </article> <!-- card.// -->

<jsp:include page="/member/footer.jsp"/>