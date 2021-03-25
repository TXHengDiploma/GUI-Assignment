<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Product Page"/>
</jsp:include>
<div class="container">
    <!-- Search Product -->
   
       <div class="input-group mb-3">
         <input type="text" class="form-control" placeholder="Search to find something..." aria-label="#" aria-describedby="#">
         <div class="input-group-append">
           <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
         </div>
       </div>
   
</div>
<!-- Page Features -->
<div class="row text-center">

	<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100">
			<img class="card-img-top" src="http://my-test-11.slatic.net/p/1b17fcfbecb0340130c2131edd5f2284.png_720x720q80.jpg_.webp" alt="">
			<div class="card-body">
				<h4 class="card-title">Casio CTK-2500 Standard Keyboard</h4>
				<p class="card-text">RM 750</p>
			</div>
			<div class="card-footer">
                <!-- <button class="btn btn-primary" type="button"></button> -->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="Add To Cart">
                    <i class="fas fa-cart-plus"></i>
                </button>
                <button class="btn btn-primary" type="button">Buy Now!</i></button>
                
            </div>
            
				
			
		</div>
	</div>

	<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100">
			<img class="card-img-top" src="https://cf.shopee.com.my/file/e041131387481c748c4a9c8cd23ad197" alt="">
			<div class="card-body">
				<h4 class="card-title">Ukulele Concert 23' Brown</h4>
				<p class="card-text">RM 365</p>
			</div>
			<div class="card-footer">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="Add To Cart">
                    <i class="fas fa-cart-plus"></i>
                </button>
                <button class="btn btn-primary" type="button">Buy Now!</i></button>
            </div>
		</div>
	</div>

	<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100">
			<img class="card-img-top" src="https://cf.shopee.com.my/file/65967cc1cf15be56cc12fded6097e3bf" alt="">
			<div class="card-body">
				<h4 class="card-title">Guitar 38' Inch </h4>
				<p class="card-text">RM 680</p>
			</div>
			<div class="card-footer">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="Add To Cart">
                    <i class="fas fa-cart-plus"></i>
                </button>
                <button class="btn btn-primary" type="button">Buy Now!</i></button>
            </div>
		</div>
	</div>

	<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100">
			<img class="card-img-top" src="https://cf.shopee.com.my/file/f4e92ec18485ec0babe62c5735f89219" alt="">
			<div class="card-body">
				<h4 class="card-title">Kalimba 17 Key</h4>
				<p class="card-text">RM 35</p>
			</div>
			<div class="card-footer">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="Add To Cart">
                    <i class="fas fa-cart-plus"></i>
                </button>
                <button class="btn btn-primary" type="button">Buy Now!</i></button>
            </div>
		</div>
	</div>
    

</div>
<!-- /.row -->

<!-- pagination -->
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <li class="page-item disabled">
            <a class="page-link" href="#" tabindex="-1">Previous</a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#">Next</a>
          </li>
        </ul>
      </nav>
<jsp:include page="/member/footer.jsp"/>