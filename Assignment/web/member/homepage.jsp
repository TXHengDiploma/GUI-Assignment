<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Main Page"/>
</jsp:include>

<div id="carouselExampleControls" class="carousel slide mb-25" data-ride="carousel" data-interval="5000">
    <div class="carousel-inner w-70 ">
        <div class="carousel-item active">
            <a href="1"><img src="/public/img/slides/Slide-01.png" alt="First slide" class="img-responsive rounded w-100">
        </div></a>

        <div class="carousel-item">
            <a href="2"><img src="/public/img/slides/Slide-02.png" alt="Second slide" class="img-responsive rounded w-100">
        </div></a>

        <div class="carousel-item">
            <a href="3"><img src="/public/img/slides/Slide-03.png" alt="Third slide" class="img-responsive rounded w-100">
        </div></a>
    </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
</div>
<hr class="my-4">
<div class="show_product">
    <div class="row">
        <div class="col-lg-4 col-sm-6 mb-4">
            <div class="text-center">
                <a href="/member/products/list.jsp"><i class="fas fa-drum fa-7x"></i></a>
                    <div class="card-body">
                        <h4 class="card-title text-center">
                            <a href="/member/products/list.jsp" data-toggle="tooltip" title="Product list">Product</a>
                        </h4>
                    </div>
             </div>
        </div>

        <div class="col-lg-4 col-sm-6 mb-4">
            <div class="text-center">
                <a href="/member/myCart"><i class="fas fa-cart-plus fa-7x"></i></a>
                    <div class="card-body">
                        <h4 class="card-title text-center">
                            <a href="/member/myCart" data-toggle="tooltip" title="Your cart">My Cart</a>
                        </h4>
                    </div>
            </div>
        </div>

        <div class="col-lg-4 col-sm-6 mb-4">
            <div class="text-center">
                <a href="/member/orders/list"><i class="fas fa-clipboard-list fa-7x"></i></a>
                    <div class="card-body">
                        <h4 class="card-title text-center">
                            <a href="/member/orders/list" data-toggle="tooltip" title="Your order list">Order History</a>
                        </h4>
                    </div>
            </div>
        </div>
    </div>
</div>    

<jsp:include page="/member/footer.jsp"/>